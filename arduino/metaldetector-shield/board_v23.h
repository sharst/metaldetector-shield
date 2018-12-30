#ifndef boarddef23_h
#define boarddef23_h 
static const byte IS_MASTER = 2;  // 0: NO master, 1: IS master, 2: read out hardware switch

// Pressure sensor
#define pres_mux1            8
#define pres_mux2            7
#define pres_mux3            6

// Coil sensor
#define coil_adc_cs          10
#define coil_select1         5
#define coil_select2         4
#define coil_select3         3
#define coil_trigger         A2

// CAN settings
#define can_cs               9
#define PRESSURE_REGISTER    25
#define HEARTBEAT_REGISTER   30
#define HEARTBEAT_EVERY      10000

// Chaining settings
#define comm_in              A1
#define comm_out             A0
#define LEDPin               13
#define master_pin           2

#endif
