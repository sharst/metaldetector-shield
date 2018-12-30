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
#include "Arduino.h"
#include <PressureLib.h>
#include <BMP180_Software.h>

/* 
 * Constructor. Takes the three pins to the MUX.
 */
Pressure::Pressure(byte HEFPin0, byte HEFPin1, byte HEFPin2) {
  _hefpin0 = HEFPin0;
  _hefpin1 = HEFPin1;
  _hefpin2 = HEFPin2;
  _temp = 0;
  _pressure_thresholds[0] = 100;
  _pressure_thresholds[1] = 100;
  _pressure_thresholds[2] = 900;
  _pressure_thresholds[3] = 900;
  _pressure_thresholds[4] = 500;
  _pressure_thresholds[5] = 500;
  _pressure_thresholds[6] = 1000;
  _pressure_thresholds[7] = 1000;
}

void Pressure::setup() {
  pinMode(_hefpin0, OUTPUT);
  pinMode(_hefpin1, OUTPUT);
  pinMode(_hefpin2, OUTPUT);
  digitalWrite(_hefpin0, 0);
  digitalWrite(_hefpin1, 0);
  digitalWrite(_hefpin2, 0);
}

void Pressure::select_sensor(byte sensor) {
  digitalWrite(_hefpin0, (sensor >> 0) & 1);
  digitalWrite(_hefpin1, (sensor >> 1) & 1);
  digitalWrite(_hefpin2, (sensor >> 2) & 1);
}

/*
 * This function manages the data transfer to the sensor.
 * In case no request for sensing pressure is filed yet,
 * it starts the measurement, saves away the time when
 * it will be ready and returns 0.
 * If this time is passed, it gets and returns the measurement.
 */
long Pressure::data_ready(byte channel) {
  char wait;
  double P = 0.0;
  if (_pressure_wait[channel] != 0) {
    if (millis() > _pressure_wait[channel]) {
      _sensor.getPressure(P, _temp);
      _pressure_wait[channel] = 0;
      // Only reset the sensor_online timer in case the values are
      // actually sane.
      if (P < 0) {
        sensor_online(channel, false);
      } else {
        sensor_online(channel, true);
      }
      _data_ready[channel] = true;
      return (long (P * 100.0));
    } else
      return 0;
  } else {
    wait = _sensor.startPressure(3);
    if (wait != 0) {
      _pressure_wait[channel] = millis() + wait;
    } else {  // Sensor is offline
      sensor_online(channel, false);
    }
    return 0;
  }
}

/*
 * Implements a simple timeout for sensors. Call it with online=True to reset
 * the OFFLINE_TIMEOUT counter. Call it with online=False to start the timeout.
 * When a timeout occurs, sets _sensor_available[channel] = false.
 */
void Pressure::sensor_online(byte channel, bool online) {
  if (online) {
    // Sensor did respond, so reset offline counter
    _pressure_offline_since[channel] = 0;
  } else {
    // First time non-response
    if (_pressure_offline_since[channel]==0) {
      // Save time for offline timeout.
      _pressure_offline_since[channel] = millis();
    } else {
      if ((millis() - _pressure_offline_since[channel]) > OFFLINE_TIMEOUT) {
        _sensor_available[channel] = false;
      }
    }
  }
}


void Pressure::check_sensors() {
  long pressure;

  for (byte i=0; i<PRESSURE_AMOUNT; i++) {
    if (_sensor_available[i]) {
      select_sensor(i);
      pressure = data_ready(i);
      if (pressure != 0) {
        for (int j=1; j<PRESSURE_SAMPLES; j++)
          _pressure_samples[i][j-1] = _pressure_samples[i][j];
        _pressure_samples[i][PRESSURE_SAMPLES-1] = pressure;
      }
    }
  }
}

/*
 * Returns the current raw values collected from each sensor
 * If no sensor is connected at a channel, will return 0.
 */
void Pressure::get_raw(long values[]) {
  for (byte i=0; i<PRESSURE_AMOUNT; i++) {
    values[i] = _pressure_samples[i][PRESSURE_SAMPLES-1];
  }
}

/*
 * Returns the current raw value collected from sensor "sensor".
 * If no new data has arrived since the last call, will return -1.
 */
long Pressure::get_raw(int sensor, bool onlynew) {
  if (onlynew) {
    if (_data_ready[sensor]) {
      _data_ready[sensor] = false;
      return _pressure_samples[sensor][PRESSURE_SAMPLES-1];
    } else {
      return -1;
    }
  } else {
    return _pressure_samples[sensor][PRESSURE_SAMPLES-1];
  }
}


int Pressure::get_active_bumpers() {
  int bumpers = 0;
  for (byte i=0; i<PRESSURE_AMOUNT; i++) {
    if ((_pressure_samples[i][PRESSURE_SAMPLES-1] - _pressure_samples[i][0]) > _pressure_thresholds[i]) {
      bumpers += (1<<i);
    }
  }
  return bumpers;
}

/*
 * returns a bit-coded message. 1 if bumper has been turned on
 * since last call of this function, 0 otherwise.
 */
int Pressure::get_bumper_transitions() {
  int current_state = get_active_bumpers();
  // Find out bumpers that are false in _bumper_state and true now.
  int bumpers = (current_state & (~_bumper_state));

  // Save current state for next comparison.
  _bumper_state = current_state;
  state = current_state;

  return bumpers;
}

// Returns if any bumper is currently pressed
bool Pressure::bumper_active() {
  int current_state = get_active_bumpers();
  return (current_state > 0);
}

byte Pressure::get_sensor_amount() {
  byte amount = 0;
  for (int i=0; i<PRESSURE_AMOUNT; i++) {
    if (_sensor_available[i]) {
      amount += 1;
    }
  }
  return amount;
}

byte Pressure::get_available_sensors() {
  byte av = 0;
  for (int i=0; i<PRESSURE_AMOUNT; i++) {
    if (_sensor_available[i]) {
      av |= (1<<i);
    }
  }
  return av;
}

double Pressure::detect_sensor(int i) {
  select_sensor(i);
  // Save which sensors are present.
  _sensors[i] = _sensor.begin();
  if (_sensors[i]) {
    // Get one temperature measurement
    // which is required for sensor bootup.
    byte wait = _sensor.startTemperature();
    delay(wait);
    _sensor.getTemperature(_temp);
    _sensor_available[i] = true;
    return _temp;
  } else {
    _sensor_available[i] = false;
    return 0;
  }
}

void Pressure::detect_sensors() {
  for (byte i=0; i<PRESSURE_AMOUNT; i++) {
    select_sensor(i);
    // Save which sensors are present.
    _sensors[i] = _sensor.begin();
    if (_sensors[i]) {
      // Get one temperature measurement
      // which is required for sensor bootup.
      byte wait = _sensor.startTemperature();
      delay(wait);
      _sensor.getTemperature(_temp);
      _sensor_available[i] = true;
    } else {
      _sensor_available[i] = false;
    }
  }
}
