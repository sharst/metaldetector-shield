#ifndef boarddef20_h
#define boarddef20_h

static const byte IS_MASTER =	0;  // 0: SLAVE, 1: MASTER, 2: hardware switch

// Pressure sensor
#define pres_mux1				8
#define pres_mux2				7
#define pres_mux3				6

// Coil sensor
#define coil_adc_cs 		    10
#define coil_select1 			5
#define coil_select2 			4
#define coil_select3 			3
#define coil_trigger 		    A2

// CAN settings
#define can_cs 					9
#define PRESSURE_REGISTER	    25
#define HEARTBEAT_REGISTER		30
#define HEARTBEAT_EVERY			10000

// Ping-Pong settings
#define comm_in					A1
#define comm_out				A0

#define LEDPin					13

#define master_pin				0   // Isn't used when IS_MASTER != 2

#endif
