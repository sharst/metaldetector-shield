#ifndef PressureLib_h
#define PressureLib_h

#include "Arduino.h"
#include <BMP180_Software.h>

#define PRESSURE_SAMPLES  5
#define PRESSURE_AMOUNT   8
// If a sensor doesn't respond in this many ms, it is switched off.
#define OFFLINE_TIMEOUT   5000

class Pressure
{
public:
  Pressure(byte HEFPin0, byte HEFPin1, byte HEFPin2);
  void setup();
  void detect_sensors();
  double detect_sensor(int i);
  void check_sensors();
  void get_raw(long values[]);
  long get_raw(int sensor, bool onlynew);
  int get_active_bumpers();
  int get_bumper_transitions();
  byte get_available_sensors();
  byte get_sensor_amount();
  bool bumper_active();
  long data_ready(byte channel);
  void select_sensor(byte sensor);
  void sensor_online(byte channel, bool online);
  int state;

  byte _hefpin0;
  byte _hefpin1;
  byte _hefpin2;
  int _bumper_state;
  double _temp;
  bool _sensors[PRESSURE_AMOUNT];
  bool _data_ready[PRESSURE_AMOUNT];
  BMP180Soft _sensor;

  long _pressure_samples[PRESSURE_AMOUNT][PRESSURE_SAMPLES];
  int _pressure_index[PRESSURE_AMOUNT];
  unsigned long _pressure_wait[PRESSURE_AMOUNT];
  unsigned long _pressure_offline_since[PRESSURE_AMOUNT];
  bool _sensor_available[PRESSURE_AMOUNT];
  int _pressure_thresholds[PRESSURE_AMOUNT];

};


#endif
