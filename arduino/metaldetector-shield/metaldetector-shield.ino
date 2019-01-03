/**
* Copyright 2018, Simon Harst
* This file is part of the Metaldetector project.
* 
* Metaldetector is free software: you can redistribute it and/or modify
* it under the terms of the GNU Lesser General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* Metaldetector is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU Lesser General Public License for more details.
* 
* You should have received a copy of the GNU Lesser General Public License
* along with Metaldetector.  If not, see <http://www.gnu.org/licenses/>.
*/
#include <SPI.h>
#include <mcp_can.h>
#include <PressureLib.h>
#include "board_v23.h"
#include <CoilLib.h>

#define TX_CAN_ID                 61
#define RX_CAN_ID                 62

#define IS_MASTER                 true

// Toggle all debug output on the serial port
#define DEBUG                     true

#define COMM_TIMEOUT              10000

// Output raw ADC values of one coil, -1 to switch off
#define DEBUG_RAW_ADC_COIL        -1


// Define a switchable debug print function
#ifdef DEBUG
#define DEBUG_PRINTLN(x) Serial.println(x)
#define DEBUG_PRINT(x) Serial.print(x)
#else
#define DEBUG_PRINTLN(x)
#define DEBUG_PRINT(x)
#endif

bool bumpers[8];
byte comm_in_state;
bool comm_out_state = false;

unsigned long start_waiting = 0;
unsigned long last_heartbeat = 0;

unsigned char tx_can_msg[5];
INT8U rx_len = 0;
unsigned char rx_can_msg[5];
bool coils_enabled;
unsigned int coil_value;

Pressure pres = Pressure(pres_mux1, pres_mux2, pres_mux3);
Coil coils = Coil(coil_select1, coil_select2, coil_select3, coil_adc_cs,
    coil_trigger);
MCP_CAN CAN0(can_cs);


bool chain_interrupt_received() {
  if (start_waiting == 0)
    start_waiting = millis();

  byte in = digitalRead(comm_in);
  if (in == comm_in_state) {
    if (IS_MASTER && ((millis() - start_waiting) > COMM_TIMEOUT)) {
      DEBUG_PRINTLN("Connection timeout!");
      start_waiting = 0;
      return true;
    } else {
      return false;
    }
  } else {
    comm_in_state = in;
    start_waiting = 0;
    return true;
  }
}

void toggle_out_state() {
  comm_out_state = !comm_out_state;
  digitalWrite(comm_out, comm_out_state);
}


/* Call this function periodically and it will emit a heartbeat message
 * at most every HEARTBEAT_EVERY milliseconds.
 * The heartbeat message is 5 byte long and consists of
 * BYTE #     DESCRIPTION
 * 0          HEARTBEAT_REGISTER
 * 1          0 (nothing)
 * 2          number of pressure sensors attached
 * 3          0 (nothing)
 * 4          [0 or 1], whether coils are enabled
 */
void send_heartbeat() {
  if ((millis() - last_heartbeat) > HEARTBEAT_EVERY) {

    unsigned char heartbeat_msg[3];
    heartbeat_msg[0] = HEARTBEAT_REGISTER;
    heartbeat_msg[1] = pres.get_available_sensors();
    heartbeat_msg[2] = coils_enabled;
    byte ret = CAN0.sendMsgBuf(TX_CAN_ID, 1, 3, heartbeat_msg);

    if (ret == CAN_OK) {
      DEBUG_PRINTLN("HEARTBEAT msg sent.");
    }
    last_heartbeat = millis();
  }
}

void setup() {
  // Setup chaining pins
  pinMode(comm_in, INPUT_PULLUP);
  pinMode(comm_out, OUTPUT);
  digitalWrite(comm_out, comm_out_state);
  delay(2); // Give pin some ms to settle
  comm_in_state = digitalRead(comm_in);

  Serial.begin(115200);
  pinMode(LEDPin, OUTPUT);
  digitalWrite(LEDPin, LOW);

  // Setup CAN
  CAN0.begin(CAN_500KBPS);

  // Setup pressure sensors
  pres.setup();
  for (int i = 0; i < 8; i++) {
    DEBUG_PRINT("Trying to detect sensor ");
    DEBUG_PRINTLN(i);
    if (pres.detect_sensor(i)) {
      DEBUG_PRINTLN("SUCCESS!");
    }
  }
  byte amount = pres.get_sensor_amount();
  DEBUG_PRINT("Found ");
  DEBUG_PRINT(amount);
  DEBUG_PRINTLN(" sensors.");

  coils_enabled = true;

  // Setup coils
  coils.setup();

  // Wait for master to finish first measurement
  if (!IS_MASTER) {
    while (!chain_interrupt_received())
      delay(1);
    DEBUG_PRINTLN("Received very first interrupt as slave.");
  }

  DEBUG_PRINTLN("Setup done!");
}

// Debug function to print the individual ADC values of the last measurements
void print_adc(void) {
  DEBUG_PRINT("# ");
  for (int i = 0; i < 40; i++) {
    unsigned int adc_val = coils.get_adc(i);
    DEBUG_PRINT(adc_val);
    if (i < 39) {
      DEBUG_PRINT(",");
    }
  }
  DEBUG_PRINTLN("!");
}

// Send a message about the coil values on the bus
void send_value(int value_register, char identifier, int value) {
    unsigned char message[4];
    message[0] = value_register;
    message[1] = identifier;
    message[2] = value >> 8;
    message[3] = value & 0xFF;

    byte ret = CAN0.sendMsgBuf(TX_CAN_ID, 1, 4, message);
    if (ret == CAN_OK) {
      // DEBUG_PRINTLN("COIL msg sent.");
    }
}

// Send a message on the can bus that encodes the given values
void can_response_2_uint16(int index, int val1, int val2) {
  tx_can_msg[0] = index;
  tx_can_msg[1] = highByte(val1);
  tx_can_msg[2] = lowByte(val1);
  tx_can_msg[3] = highByte(val2);
  tx_can_msg[4] = lowByte(val2);
  byte ret = CAN0.sendMsgBuf(TX_CAN_ID, 1, 5, tx_can_msg);
  if (ret == CAN_OK) {
    // DEBUG_PRINTLN("CAN msg sent.");
  }
  delay(2);
}

void handle_incoming_messages() {
  if (CAN_MSGAVAIL == CAN0.checkReceive()) {
    CAN0.readMsgBuf(&rx_len, rx_can_msg);
    INT32U canId = CAN0.getCanId();

    if (canId == RX_CAN_ID)
      handle_request();
  }
}

// Parse the last message that came in.
void handle_request() {
  INT8U reg = rx_can_msg[0];
  bool is_write = ((reg & 0b10000000) > 0);
  reg &= 0b1111111;

  unsigned char data[3];
  unsigned char flash_data[32];

  if (is_write) {
    if (reg == ENABLE_COILS_REGISTER) {
      DEBUG_PRINT("Received request to switch coils to: ");
      DEBUG_PRINTLN(rx_can_msg[1]);
      coils_enabled = (rx_can_msg[1] & 1) == 1;
    }
  } else {
    DEBUG_PRINT("Received read request for register ");
    DEBUG_PRINTLN(reg);
  }
}


/* 1) If coils are enabled, check them and write the data to the bus
 * 2) Check if there have been transitions in the bumper pressure sensors
 *    If yes, send another message on the bus
 * 3) Send a heartbeat message
 */
void loop() {
  if (coils_enabled) {
    // If raw ADC samples are requested, trigger that coil once and read
    // out the samples.
    if (DEBUG_RAW_ADC_COIL > -1) {
      coils.read_coil(DEBUG_RAW_ADC_COIL);
      DEBUG_PRINT("RAWCOIL");
      for (int i=0; i<ADC_SAMPLES; i++) {
        DEBUG_PRINT(" ");
        DEBUG_PRINT(coils.get_adc(i));
      }
      DEBUG_PRINTLN("");
    }

    coils.check_sensors();
    if (coils.data_ready()) {
      // DEBUG_PRINT("COILS");
      for (int i = 0; i < COIL_AMOUNT; i++) {
        coil_value = coils.get_average(i);
        // DEBUG_PRINT(" ");
        // DEBUG_PRINT(coil_value);
        send_value(COIL_REGISTER, i, coil_value);
      }
      //DEBUG_PRINTLN("");
    }
    toggle_out_state();
  }

  do {
    // Update all of the available sensors
    pres.check_sensors();

    // Find out which bumpers have transitioned.
    int trans = pres.get_bumper_transitions();

    if (trans > 0) {
      send_value(PRESSURE_REGISTER, 0, trans);
      DEBUG_PRINTLN("BUMPER");
    }
    delay(1);
    handle_incoming_messages();
    send_heartbeat();

  } while (!chain_interrupt_received());
}
