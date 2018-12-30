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
#include <CoilLib.h>
#include <SPI.h>

/** Constructor. Takes the three pins of the muxes,
  * the pin of the ADC to read from and the pin that is connected to the trigger
  */
Coil::Coil(byte HEFPin0, byte HEFPin1, byte HEFPin2, byte ADC_CS, byte TRIG) {
  SPI.begin();
  SPI.setDataMode(SPI_MODE0);
  SPI.setBitOrder(MSBFIRST);
  SPI.setClockDivider(SPI_CLOCK_DIV2);

  _hefpin0 = HEFPin0;
  _hefpin1 = HEFPin1;
  _hefpin2 = HEFPin2;
  _adc_cs = ADC_CS;
  _triggerpin = TRIG;
  _sample_index = 0;

}

void Coil::setup() {
  pinMode(_hefpin0, OUTPUT);
  pinMode(_hefpin1, OUTPUT);
  pinMode(_hefpin2, OUTPUT);
  pinMode(_adc_cs, OUTPUT);
  pinMode(_triggerpin, OUTPUT);
  digitalWrite(_hefpin0, 0);
  digitalWrite(_hefpin1, 0);
  digitalWrite(_hefpin2, 0);
  digitalWrite(_adc_cs, 0);
  digitalWrite(_triggerpin, 0);
}

void Coil::select_coil(byte sensor) {
  digitalWrite(_hefpin0, (sensor >> 0) & 1);
  digitalWrite(_hefpin1, (sensor >> 1) & 1);
  digitalWrite(_hefpin2, (sensor >> 2) & 1);
}

// reads a single value from the ADC
int Coil::mcp3008_read(int channel) {
  digitalWrite(_adc_cs, LOW);
  delayMicroseconds(1);
  SPI.transfer((channel << 2) + 0b1100000);
  int value = SPI.transfer(0) << 2;
  value += (SPI.transfer(0) & 0b11000000) >> 6;

  digitalWrite(_adc_cs, HIGH);
  return value;
}


// Selects, triggers and reads one coil.
// We read out ADC_SAMPLES amount of samples and return the sum.
unsigned int Coil::read_coil(byte coil) {
  select_coil(coil);
  // Trigger coil
  digitalWrite(_triggerpin, HIGH);
  delayMicroseconds(300);
  digitalWrite(_triggerpin, LOW);
  delayMicroseconds(90);

  // Read out ADC
  unsigned int sum = 0;
  for (int i = 0; i < ADC_SAMPLES; i++) {
    _adc_val[i] = mcp3008_read(0);
    if (sum >= 61000){
      sum = 61000;
    } else {
      sum += _adc_val[i];
    }
  }

  delayMicroseconds(200);
  return sum;
}

unsigned int Coil::get_adc(int ind) {
  return _adc_val[ind];
}


// Returns the average of all samples currently saved for this coil
unsigned int Coil::get_average(byte coil) {
  unsigned long sum = 0;
  for (byte sp = 0; sp < COIL_SAMPLES; sp++) {
    sum += _samples[coil][sp];
  }

  sum = sum / COIL_SAMPLES;
  return (unsigned int) sum;
}

/*
 * Returns whether all the coils have been sampled at least COIL_SAMPLES
 * times and hence the average value can be read out.
 */
bool Coil::data_ready() {
  return (_sample_index == COIL_SAMPLES);
}

int Coil::sample_index() {
  return _sample_index;
}

/* Reads one sample of data for each coil.
 * One sample is already the sum of ADC_SAMPLES number of raw
 * ADC readings.
 */
void Coil::check_sensors() {
  _sample_index %= COIL_SAMPLES;
  for (byte coil = 0; coil < COIL_AMOUNT; coil++) {
    _samples[coil][_sample_index] = read_coil(coil);
  }
  _sample_index += 1;
}
