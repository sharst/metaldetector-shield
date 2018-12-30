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
#include <CoilLib.h>
#include <Wire.h>
#include <SPI.h>

#define LEDPin            13
#define coil_adc_cs       10
#define coil_select1      5
#define coil_select2      4
#define coil_select3      3
#define coil_trigger      A2

Coil coils = Coil(coil_select1, coil_select2, coil_select3, coil_adc_cs, coil_trigger);

bool bumpers[8];

void setup() {
  Serial.begin(9600);
  pinMode(LEDPin, OUTPUT);
  digitalWrite(LEDPin, LOW);
  Serial.println("Setting up coils..");
  coils.setup();
  Serial.println("Setup done.");
}

void loop() {
  coils.check_sensors();
  //Serial.println(coils.sample_index());
  if (coils.data_ready()) {
    for (int i=0; i<COIL_AMOUNT; i++) {
      unsigned int val = coils.get_average(i);
      Serial.print(val);
      Serial.print(" ");
    }
    Serial.println("");
  }
}
