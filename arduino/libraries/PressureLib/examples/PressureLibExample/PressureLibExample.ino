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
#include <PressureLib.h>
#include <Wire.h>

#define LEDPin    13
bool bumpers[8];
Pressure pres = Pressure(8,7,6);

void setup() {
  Serial.begin(9600);
  Serial.println("Starting setup...");
  pinMode(LEDPin, OUTPUT);
  digitalWrite(LEDPin, LOW);
  pres.setup();
  Serial.println("Trying to detect sensors...");
  pres.detect_sensors();
  Serial.println("Trying to detect sensors...");
  byte amount = pres.get_sensor_amount();
  Serial.print("Found ");
  Serial.print(amount, DEC);
  Serial.print(" sensors.");
}

void loop() {
  // Update all of the available sensors
  pres.check_sensors();

  long values[8];
  pres.get_raw(values);
  for (int i=0; i<8; i++) {
    Serial.print(values[i]);
    Serial.print(" ");
  }
  Serial.println("");

  // If any of the sensors has triggered
  if (pres.bumper_active()) {
    digitalWrite(LEDPin, HIGH);

    // Find out which one(s) have triggered
    pres.get_bumper_transitions(bumpers);
    for (int i=0; i<8; i++) {
      if (bumpers[i]) {
        Serial.print("1 ");
      } else {
        Serial.print("0 ");
      }
    }
    Serial.println("");

  } else {
    digitalWrite(LEDPin, LOW);
  }

  delay(10);
}
