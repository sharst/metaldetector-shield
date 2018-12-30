/*
 * CoilLib.h
 * XXX: Add info here
 */
#ifndef CoilLib_h
#define CoilLib_h

#include "Arduino.h"

#define ADC_SAMPLES     40
//#define COIL_SAMPLES    8
#define COIL_SAMPLES    4
#define COIL_AMOUNT     8


class Coil {
public:
  Coil(byte HEFPin0, byte HEFPin1, byte HEFPin2, byte ADC_CS, byte TRIG);
  void setup();
  void check_sensors();
  int sample_index(void);
  unsigned int get_adc(int ind);
  unsigned int get_average(byte coil);
  bool data_ready();
  unsigned int read_coil(byte coil);

private:
  byte _hefpin0;
  byte _hefpin1;
  byte _hefpin2;
  byte _adc_cs;
  byte _triggerpin;

  unsigned int _adc_val[ADC_SAMPLES];
  unsigned int _samples[COIL_AMOUNT][COIL_SAMPLES];
  int _sample_index;

  void select_coil(byte coil);
  int mcp3008_read(int channel);

};


#endif
