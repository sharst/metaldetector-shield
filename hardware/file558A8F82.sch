EESchema Schematic File Version 2
LIBS:transistors
LIBS:74xgxx
LIBS:74xx
LIBS:ac-dc
LIBS:adc-dac
LIBS:analog_switches
LIBS:atmel
LIBS:audio
LIBS:brooktre
LIBS:cmos4000
LIBS:cmos_ieee
LIBS:conn
LIBS:contrib
LIBS:cypress
LIBS:dc-dc
LIBS:device
LIBS:digital-audio
LIBS:display
LIBS:dsp
LIBS:elec-unifil
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:intel
LIBS:interface
LIBS:linear
LIBS:logo
LIBS:memory
LIBS:microchip
LIBS:microchip1
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microcontrollers
LIBS:motorola
LIBS:msp430
LIBS:nxp_armmcu
LIBS:opto
LIBS:philips
LIBS:power
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:regul
LIBS:relays
LIBS:sensors
LIBS:siliconi
LIBS:special
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:texas
LIBS:transf
LIBS:ttl_ieee
LIBS:valves
LIBS:video
LIBS:xilinx
LIBS:4051
LIBS:arduino
LIBS:bumper-cache
LIBS:icl7660
LIBS:lf356n
LIBS:lm2596
LIBS:mcp2515
LIBS:mcp2551
LIBS:mcp3008
LIBS:w_connectors
LIBS:metaldetector-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R5
U 1 1 558AAADB
P 5200 4000
F 0 "R5" V 5280 4000 40  0000 C CNN
F 1 "560" V 5207 4001 40  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 5130 4000 30  0001 C CNN
F 3 "" H 5200 4000 30  0000 C CNN
	1    5200 4000
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 558AAC2E
P 6400 2950
F 0 "R6" V 6480 2950 40  0000 C CNN
F 1 "560k" V 6407 2951 40  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6330 2950 30  0001 C CNN
F 3 "" H 6400 2950 30  0000 C CNN
	1    6400 2950
	0    1    1    0   
$EndComp
$Comp
L GND #PWR31
U 1 1 558AAD1C
P 5800 4550
F 0 "#PWR31" H 5800 4550 30  0001 C CNN
F 1 "GND" H 5800 4480 30  0001 C CNN
F 2 "" H 5800 4550 60  0000 C CNN
F 3 "" H 5800 4550 60  0000 C CNN
	1    5800 4550
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR34
U 1 1 558AAD72
P 7000 4650
F 0 "#PWR34" H 7000 4740 20  0001 C CNN
F 1 "+5V" H 7000 4740 30  0000 C CNN
F 2 "" H 7000 4650 60  0000 C CNN
F 3 "" H 7000 4650 60  0000 C CNN
	1    7000 4650
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 558AADC2
P 6650 4650
F 0 "R8" V 6730 4650 40  0000 C CNN
F 1 "100" V 6657 4651 40  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6580 4650 30  0001 C CNN
F 3 "" H 6650 4650 30  0000 C CNN
	1    6650 4650
	0    1    1    0   
$EndComp
$Comp
L CAPAPOL C9
U 1 1 558AAEA7
P 6400 4850
F 0 "C9" H 6450 4950 40  0000 L CNN
F 1 "100uF ELKO" H 6450 4750 40  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x5.3" H 6500 4700 30  0001 C CNN
F 3 "" H 6400 4850 300 0000 C CNN
	1    6400 4850
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C8
U 1 1 558AB192
P 6400 3400
F 0 "C8" H 6450 3500 40  0000 L CNN
F 1 "100uF ELKO" H 6450 3300 40  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x5.3" H 6500 3250 30  0001 C CNN
F 3 "" H 6400 3400 300 0000 C CNN
	1    6400 3400
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 558AB399
P 6650 3600
F 0 "R7" V 6730 3600 40  0000 C CNN
F 1 "100" V 6657 3601 40  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6580 3600 30  0001 C CNN
F 3 "" H 6650 3600 30  0000 C CNN
	1    6650 3600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR32
U 1 1 558AB447
P 6750 3200
F 0 "#PWR32" H 6750 3200 30  0001 C CNN
F 1 "GND" H 6750 3130 30  0001 C CNN
F 2 "" H 6750 3200 60  0000 C CNN
F 3 "" H 6750 3200 60  0000 C CNN
	1    6750 3200
	0    -1   -1   0   
$EndComp
$Comp
L -5V #PWR33
U 1 1 558AB52C
P 7000 3600
F 0 "#PWR33" H 7000 3740 20  0001 C CNN
F 1 "-5V" H 7000 3710 30  0000 C CNN
F 2 "" H 7000 3600 60  0000 C CNN
F 3 "" H 7000 3600 60  0000 C CNN
	1    7000 3600
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 558AB9DB
P 7600 4100
F 0 "R9" V 7680 4100 40  0000 C CNN
F 1 "10k" V 7607 4101 40  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7530 4100 30  0001 C CNN
F 3 "" H 7600 4100 30  0000 C CNN
	1    7600 4100
	0    1    1    0   
$EndComp
$Comp
L DIODESCH D1
U 1 1 558ABC53
P 8100 4450
F 0 "D1" H 8100 4550 40  0000 C CNN
F 1 "SCHOTTKY 1A 20V" H 8100 4350 40  0000 C CNN
F 2 "Own_Components:DO-214AC_Handsoldering" H 8100 4450 60  0001 C CNN
F 3 "" H 8100 4450 60  0000 C CNN
	1    8100 4450
	0    -1   -1   0   
$EndComp
Text GLabel 9950 4150 2    60   Input ~ 0
CLK
Text GLabel 9950 4300 2    60   Input ~ 0
MISO
Text GLabel 9950 4450 2    60   Input ~ 0
MOSI
Text GLabel 9900 4600 2    60   Input ~ 0
CS_ADC
$Comp
L GND #PWR36
U 1 1 558AD24B
P 7700 4900
F 0 "#PWR36" H 7700 4900 30  0001 C CNN
F 1 "GND" H 7700 4830 30  0001 C CNN
F 2 "" H 7700 4900 60  0000 C CNN
F 3 "" H 7700 4900 60  0000 C CNN
	1    7700 4900
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR38
U 1 1 558AD403
P 9950 3700
F 0 "#PWR38" H 9950 3790 20  0001 C CNN
F 1 "+5V" H 9950 3790 30  0000 C CNN
F 2 "" H 9950 3700 60  0000 C CNN
F 3 "" H 9950 3700 60  0000 C CNN
	1    9950 3700
	0    1    1    0   
$EndComp
Text GLabel 4650 4000 0    60   Input ~ 0
COIL_OUT
$Sheet
S 5350 7200 1250 300 
U 558ACF42
F0 "Coils" 60
F1 "file558ACF41.sch" 60
$EndSheet
$Comp
L CAPAPOL C7
U 1 1 558AACAC
P 6100 2300
F 0 "C7" H 6150 2400 40  0000 L CNN
F 1 "680uF / 50V" H 6150 2200 40  0000 L CNN
F 2 "Own_Components:CAP_D12_5_H13_5_SMD" H 6200 2150 30  0001 C CNN
F 3 "" H 6100 2300 300 0000 C CNN
	1    6100 2300
	1    0    0    -1  
$EndComp
$Comp
L LM2596 U2
U 1 1 558AAEA1
P 7600 1700
F 0 "U2" H 7600 1800 60  0000 C CNN
F 1 "LM2596" H 7600 1950 60  0000 C CNN
F 2 "Own_Components:TO-263-5" H 7600 1600 60  0001 C CNN
F 3 "" H 7600 1600 60  0000 C CNN
	1    7600 1700
	1    0    0    -1  
$EndComp
$Comp
L DIODESCH D3
U 1 1 558AB3C5
P 8750 2300
F 0 "D3" H 8750 2400 40  0000 C CNN
F 1 "1n5824" H 8750 2200 40  0000 C CNN
F 2 "Diodes_SMD:DO-214AB_Handsoldering" H 8750 2300 60  0001 C CNN
F 3 "" H 8750 2300 60  0000 C CNN
	1    8750 2300
	0    -1   -1   0   
$EndComp
$Comp
L CAPAPOL C10
U 1 1 558AB430
P 9450 2300
F 0 "C10" H 9500 2400 40  0000 L CNN
F 1 "220uF / 25V" H 9500 2200 40  0000 L CNN
F 2 "Capacitors_SMD:c_elec_8x10.5" H 9550 2150 30  0001 C CNN
F 3 "9451846" H 9450 2300 39  0001 C CNN
	1    9450 2300
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR_SMALL L1
U 1 1 558AB63B
P 9100 2000
F 0 "L1" H 9100 2100 50  0000 C CNN
F 1 "68uH" H 9100 1950 50  0000 C CNN
F 2 "Own_Components:Ind_68uH" H 9100 2000 60  0001 C CNN
F 3 "" H 9100 2000 60  0000 C CNN
	1    9100 2000
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR30
U 1 1 558ABBB7
P 5250 1600
F 0 "#PWR30" H 5250 1550 20  0001 C CNN
F 1 "+BATT" H 5250 1700 30  0000 C CNN
F 2 "" H 5250 1600 60  0000 C CNN
F 3 "" H 5250 1600 60  0000 C CNN
	1    5250 1600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR29
U 1 1 558ABE63
P 5200 2500
F 0 "#PWR29" H 5200 2500 30  0001 C CNN
F 1 "GND" H 5200 2430 30  0001 C CNN
F 2 "" H 5200 2500 60  0000 C CNN
F 3 "" H 5200 2500 60  0000 C CNN
	1    5200 2500
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR37
U 1 1 558AC242
P 9700 2000
F 0 "#PWR37" H 9700 2090 20  0001 C CNN
F 1 "+5V" H 9700 2090 30  0000 C CNN
F 2 "" H 9700 2000 60  0000 C CNN
F 3 "" H 9700 2000 60  0000 C CNN
	1    9700 2000
	0    1    1    0   
$EndComp
NoConn ~ 3700 2300
$Comp
L CAPAPOL C1
U 1 1 558AD265
P 1200 2000
F 0 "C1" H 1250 2100 40  0000 L CNN
F 1 "47uF" H 1250 1900 40  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x5.3" H 1300 1850 30  0001 C CNN
F 3 "" H 1200 2000 300 0000 C CNN
	1    1200 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR23
U 1 1 558AD274
P 2800 3000
F 0 "#PWR23" H 2800 3000 30  0001 C CNN
F 1 "GND" H 2800 2930 30  0001 C CNN
F 2 "" H 2800 3000 60  0000 C CNN
F 3 "" H 2800 3000 60  0000 C CNN
	1    2800 3000
	1    0    0    -1  
$EndComp
$Comp
L -5V #PWR28
U 1 1 558AD27B
P 4150 2000
F 0 "#PWR28" H 4150 2140 20  0001 C CNN
F 1 "-5V" H 4150 2110 30  0000 C CNN
F 2 "" H 4150 2000 60  0000 C CNN
F 3 "" H 4150 2000 60  0000 C CNN
	1    4150 2000
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR22
U 1 1 558AD282
P 2800 1450
F 0 "#PWR22" H 2800 1540 20  0001 C CNN
F 1 "+5V" H 2800 1540 30  0000 C CNN
F 2 "" H 2800 1450 60  0000 C CNN
F 3 "" H 2800 1450 60  0000 C CNN
	1    2800 1450
	1    0    0    -1  
$EndComp
$Comp
L ICL7660 U1
U 1 1 558AD288
P 2850 2150
F 0 "U1" H 3050 2550 70  0000 L CNN
F 1 "ICL7660" H 2900 1700 70  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 2850 2150 60  0001 C CNN
F 3 "" H 2850 2150 60  0000 C CNN
	1    2850 2150
	1    0    0    -1  
$EndComp
Text Notes 6700 1100 0    118  ~ 0
30V --> 5V Step Down
Text Notes 1750 1200 0    118  ~ 0
(+/-) 5V Supply
Text Notes 8000 3300 0    118  ~ 0
Receiver Circuit
$Comp
L LF356N AMP1
U 1 1 558BD02C
P 6400 4100
F 0 "AMP1" H 6700 3750 60  0000 C CNN
F 1 "LF356N" H 6150 4500 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 6400 4100 60  0001 C CNN
F 3 "" H 6400 4100 60  0000 C CNN
	1    6400 4100
	1    0    0    -1  
$EndComp
NoConn ~ 6550 4400
NoConn ~ 6550 3800
NoConn ~ 2000 2300
$Comp
L MCP3008 MCP1
U 1 1 558AC24C
P 9250 4150
F 0 "MCP1" H 9000 4800 60  0000 C CNN
F 1 "MCP3008" H 9400 3400 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 9250 4150 60  0001 C CNN
F 3 "" H 9250 4150 60  0000 C CNN
	1    9250 4150
	1    0    0    -1  
$EndComp
Connection ~ 4000 2000
Wire Wire Line
	1450 2200 1450 2100
Wire Wire Line
	1450 1900 1450 1800
Connection ~ 10500 4750
Wire Wire Line
	9800 4750 10500 4750
Connection ~ 10500 4000
Wire Wire Line
	9800 4000 10500 4000
Connection ~ 6050 4200
Connection ~ 6400 4500
Connection ~ 6850 4100
Connection ~ 6400 3700
Connection ~ 6050 4000
Wire Wire Line
	2800 1500 2800 1450
Wire Wire Line
	3700 2000 4150 2000
Wire Wire Line
	2800 3000 2800 2800
Wire Wire Line
	1450 1900 2000 1900
Wire Wire Line
	1450 2100 2000 2100
Connection ~ 9450 2000
Connection ~ 8750 2500
Connection ~ 7800 2500
Connection ~ 7350 2500
Wire Wire Line
	7800 2500 7800 2300
Wire Wire Line
	7350 2500 7350 2300
Connection ~ 6100 2500
Wire Wire Line
	5200 2500 9450 2500
Connection ~ 6100 1600
Wire Wire Line
	6100 1600 6100 2100
Wire Wire Line
	9450 1850 9450 2100
Wire Wire Line
	9350 2000 9700 2000
Connection ~ 8750 2000
Wire Wire Line
	8750 1600 8750 2100
Wire Wire Line
	8750 2000 8850 2000
Wire Wire Line
	4950 4000 4650 4000
Connection ~ 5900 4000
Connection ~ 8100 4900
Connection ~ 8100 4100
Wire Wire Line
	8100 4250 8100 4100
Wire Wire Line
	8100 4900 8100 4650
Wire Wire Line
	8400 3700 8700 3700
Wire Wire Line
	9950 3700 9800 3700
Connection ~ 8550 4750
Wire Wire Line
	8550 4750 8700 4750
Connection ~ 8550 4600
Wire Wire Line
	8550 4600 8700 4600
Connection ~ 8550 4450
Wire Wire Line
	8550 4450 8700 4450
Connection ~ 8550 4300
Wire Wire Line
	8550 4300 8700 4300
Connection ~ 8550 4150
Wire Wire Line
	8550 4150 8700 4150
Connection ~ 8550 4000
Wire Wire Line
	8700 4000 8550 4000
Connection ~ 8550 4900
Wire Wire Line
	8550 4900 8550 3850
Wire Wire Line
	8550 3850 8700 3850
Wire Wire Line
	10500 4900 7700 4900
Wire Wire Line
	9900 4600 9800 4600
Wire Wire Line
	9950 4450 9800 4450
Wire Wire Line
	9950 4300 9800 4300
Wire Wire Line
	9950 4150 9800 4150
Wire Wire Line
	8400 4100 8400 3700
Wire Wire Line
	7850 4100 8400 4100
Connection ~ 7300 4100
Wire Wire Line
	6400 3200 6750 3200
Wire Wire Line
	6850 4100 7350 4100
Wire Wire Line
	7300 2950 7300 4100
Wire Wire Line
	5900 2950 5900 4000
Connection ~ 5900 4550
Wire Wire Line
	5900 4550 5800 4550
Wire Wire Line
	5900 4650 6000 4650
Wire Wire Line
	6000 4650 6000 5050
Wire Wire Line
	6000 5050 6400 5050
Wire Wire Line
	6400 4650 6400 4500
Wire Wire Line
	7000 3600 6900 3600
Wire Wire Line
	6400 3700 6400 3600
Wire Wire Line
	7000 4650 6900 4650
Wire Wire Line
	5900 4200 6050 4200
Wire Wire Line
	5900 4200 5900 4650
Wire Wire Line
	5900 2950 6150 2950
Wire Wire Line
	6650 2950 7300 2950
Wire Wire Line
	5450 4000 6050 4000
$Comp
L CAPAPOL C11
U 1 1 55C0AB58
P 3200 1500
F 0 "C11" H 3250 1600 40  0000 L CNN
F 1 "47uF" H 3250 1400 40  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x5.3" H 3300 1350 30  0001 C CNN
F 3 "" H 3200 1500 300 0000 C CNN
	1    3200 1500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR27
U 1 1 55C0ABD0
P 4100 1500
F 0 "#PWR27" H 4100 1500 30  0001 C CNN
F 1 "GND" H 4100 1430 30  0001 C CNN
F 2 "" H 4100 1500 60  0000 C CNN
F 3 "" H 4100 1500 60  0000 C CNN
	1    4100 1500
	0    -1   -1   0   
$EndComp
$Comp
L CAPAPOL C12
U 1 1 55C0ABF1
P 4000 1750
F 0 "C12" H 4050 1850 40  0000 L CNN
F 1 "47uF" H 4050 1650 40  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x5.3" H 4100 1600 30  0001 C CNN
F 3 "" H 4000 1750 300 0000 C CNN
	1    4000 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2000 4000 1950
Wire Wire Line
	3000 1500 2800 1500
Wire Wire Line
	3400 1500 4100 1500
Wire Wire Line
	4000 1550 4000 1500
Connection ~ 4000 1500
Wire Wire Line
	5250 1600 6850 1600
Wire Wire Line
	8350 1600 8750 1600
Wire Wire Line
	8350 1850 9450 1850
Text GLabel 7300 6050 0    60   Input ~ 0
COIL_CONN1
Text GLabel 7300 5950 0    60   Input ~ 0
COIL_CONN2
Text GLabel 7400 5850 0    60   Input ~ 0
COIL_CONN4
Text GLabel 7300 5750 0    60   Input ~ 0
COIL_CONN6
Text GLabel 7400 5650 0    60   Input ~ 0
COIL_CONN8
Text GLabel 7400 6150 0    60   Input ~ 0
COIL_CONN3
Text GLabel 7300 6250 0    60   Input ~ 0
COIL_CONN5
Text GLabel 7400 6350 0    60   Input ~ 0
COIL_CONN7
Wire Wire Line
	7400 5650 7500 5650
Wire Wire Line
	7300 5750 7500 5750
Wire Wire Line
	7400 5850 7500 5850
Wire Wire Line
	7300 5950 7500 5950
Wire Wire Line
	7400 6150 7500 6150
Wire Wire Line
	7300 6250 7500 6250
Wire Wire Line
	7400 6350 7500 6350
Text Notes 6350 5500 0    118  ~ 0
Coil Connector
Text GLabel 1300 6200 3    60   Input ~ 0
COIL_OUT1
Text GLabel 2300 6200 3    60   Input ~ 0
COIL_SELECT1
Text GLabel 2400 6200 3    60   Input ~ 0
COIL_SELECT2
Text GLabel 2500 6200 3    60   Input ~ 0
COIL_SELECT3
Text GLabel 1400 6200 3    60   Input ~ 0
COIL_OUT2
Text GLabel 1500 6200 3    60   Input ~ 0
COIL_OUT3
Text GLabel 1600 6200 3    60   Input ~ 0
COIL_OUT4
Text GLabel 1700 6200 3    60   Input ~ 0
COIL_OUT5
Text GLabel 1800 6200 3    60   Input ~ 0
COIL_OUT6
Text GLabel 1900 6200 3    60   Input ~ 0
COIL_OUT7
Text GLabel 2000 6200 3    60   Input ~ 0
COIL_OUT8
Text GLabel 3100 6200 3    60   Input ~ 0
TRIG1
Text GLabel 4100 6200 3    60   Input ~ 0
COIL_SELECT1
Text GLabel 4200 6200 3    60   Input ~ 0
COIL_SELECT2
Text GLabel 4300 6200 3    60   Input ~ 0
COIL_SELECT3
Text GLabel 3200 6200 3    60   Input ~ 0
TRIG2
Text GLabel 3300 6200 3    60   Input ~ 0
TRIG3
Text GLabel 3400 6200 3    60   Input ~ 0
TRIG4
Text GLabel 3500 6200 3    60   Input ~ 0
TRIG5
Text GLabel 3600 6200 3    60   Input ~ 0
TRIG6
Text GLabel 3700 6200 3    60   Input ~ 0
TRIG7
Text GLabel 3800 6200 3    60   Input ~ 0
TRIG8
Text GLabel 3100 4600 1    60   Input ~ 0
COIL_TRIGGER
$Comp
L HEF4051 U3
U 1 1 561F1607
P 1900 5450
F 0 "U3" H 2200 4750 60  0000 C CNN
F 1 "HEF4051" H 2100 6200 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1900 5450 60  0001 C CNN
F 3 "" H 1900 5450 60  0000 C CNN
	1    1900 5450
	0    -1   -1   0   
$EndComp
$Comp
L HEF4051 U4
U 1 1 561F160E
P 3700 5450
F 0 "U4" H 4000 4750 60  0000 C CNN
F 1 "HEF4051" H 3900 6200 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 3700 5450 60  0001 C CNN
F 3 "" H 3700 5450 60  0000 C CNN
	1    3700 5450
	0    -1   -1   0   
$EndComp
Text GLabel 1300 4650 1    60   Input ~ 0
COIL_OUT
Wire Wire Line
	1300 4650 1300 4750
Wire Wire Line
	3100 4750 3100 4600
Wire Wire Line
	1300 6200 1300 6150
Wire Wire Line
	1400 6200 1400 6150
Wire Wire Line
	1500 6200 1500 6150
Wire Wire Line
	1600 6200 1600 6150
Wire Wire Line
	1700 6200 1700 6150
Wire Wire Line
	1800 6200 1800 6150
Wire Wire Line
	1900 6200 1900 6150
Wire Wire Line
	2000 6200 2000 6150
Wire Wire Line
	2300 6200 2300 6150
Wire Wire Line
	2400 6200 2400 6150
Wire Wire Line
	2500 6200 2500 6150
Wire Wire Line
	3100 6200 3100 6150
Wire Wire Line
	3200 6200 3200 6150
Wire Wire Line
	3300 6200 3300 6150
Wire Wire Line
	3400 6200 3400 6150
Wire Wire Line
	3500 6200 3500 6150
Wire Wire Line
	3600 6200 3600 6150
Wire Wire Line
	3700 6200 3700 6150
Wire Wire Line
	3800 6200 3800 6150
Wire Wire Line
	4100 6200 4100 6150
Wire Wire Line
	4200 6200 4200 6150
Wire Wire Line
	4300 6200 4300 6150
Wire Wire Line
	2050 4500 2050 4750
Wire Wire Line
	1650 4550 1650 4750
$Comp
L -5V #PWR21
U 1 1 561F1630
P 2400 4700
F 0 "#PWR21" H 2400 4840 20  0001 C CNN
F 1 "-5V" H 2400 4810 30  0000 C CNN
F 2 "" H 2400 4700 60  0000 C CNN
F 3 "" H 2400 4700 60  0000 C CNN
	1    2400 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4750 2400 4700
Text Notes 1000 3900 0    118  ~ 0
Trigger and Receive Multiplexers
$Comp
L GND #PWR20
U 1 1 561F1638
P 2200 7000
F 0 "#PWR20" H 2200 7000 30  0001 C CNN
F 1 "GND" H 2200 6930 30  0001 C CNN
F 2 "" H 2200 7000 60  0000 C CNN
F 3 "" H 2200 7000 60  0000 C CNN
	1    2200 7000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR26
U 1 1 561F163E
P 4000 7000
F 0 "#PWR26" H 4000 7000 30  0001 C CNN
F 1 "GND" H 4000 6930 30  0001 C CNN
F 2 "" H 4000 7000 60  0000 C CNN
F 3 "" H 4000 7000 60  0000 C CNN
	1    4000 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 7000 2200 6150
Wire Wire Line
	4000 7000 4000 6150
$Comp
L GND #PWR19
U 1 1 561F1646
P 2050 4500
F 0 "#PWR19" H 2050 4500 30  0001 C CNN
F 1 "GND" H 2050 4430 30  0001 C CNN
F 2 "" H 2050 4500 60  0000 C CNN
F 3 "" H 2050 4500 60  0000 C CNN
	1    2050 4500
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR25
U 1 1 561F164C
P 3850 4500
F 0 "#PWR25" H 3850 4500 30  0001 C CNN
F 1 "GND" H 3850 4430 30  0001 C CNN
F 2 "" H 3850 4500 60  0000 C CNN
F 3 "" H 3850 4500 60  0000 C CNN
	1    3850 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	3850 4750 3850 4500
$Comp
L +5V #PWR18
U 1 1 561F1653
P 1650 4550
F 0 "#PWR18" H 1650 4640 20  0001 C CNN
F 1 "+5V" H 1650 4640 30  0000 C CNN
F 2 "" H 1650 4550 60  0000 C CNN
F 3 "" H 1650 4550 60  0000 C CNN
	1    1650 4550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR24
U 1 1 561F1659
P 3450 4550
F 0 "#PWR24" H 3450 4640 20  0001 C CNN
F 1 "+5V" H 3450 4640 30  0000 C CNN
F 2 "" H 3450 4550 60  0000 C CNN
F 3 "" H 3450 4550 60  0000 C CNN
	1    3450 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4550 3450 4750
Connection ~ 3850 4600
Wire Wire Line
	4200 4750 4200 4600
Wire Wire Line
	4200 4600 3850 4600
$Comp
L CONN_1 P1
U 1 1 561F8EF7
P 7650 5650
F 0 "P1" H 7730 5650 40  0000 L CNN
F 1 "CONN_1" H 7650 5705 30  0001 C CNN
F 2 "Own_Components:solderpad_single" H 7650 5650 60  0001 C CNN
F 3 "" H 7650 5650 60  0000 C CNN
	1    7650 5650
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P11
U 1 1 561F901B
P 7650 5750
F 0 "P11" H 7730 5750 40  0000 L CNN
F 1 "CONN_1" H 7650 5805 30  0001 C CNN
F 2 "Own_Components:solderpad_single" H 7650 5750 60  0001 C CNN
F 3 "" H 7650 5750 60  0000 C CNN
	1    7650 5750
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P12
U 1 1 561F908F
P 7650 5850
F 0 "P12" H 7730 5850 40  0000 L CNN
F 1 "CONN_1" H 7650 5905 30  0001 C CNN
F 2 "Own_Components:solderpad_single" H 7650 5850 60  0001 C CNN
F 3 "" H 7650 5850 60  0000 C CNN
	1    7650 5850
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P13
U 1 1 561F90BB
P 7650 5950
F 0 "P13" H 7730 5950 40  0000 L CNN
F 1 "CONN_1" H 7650 6005 30  0001 C CNN
F 2 "Own_Components:solderpad_single" H 7650 5950 60  0001 C CNN
F 3 "" H 7650 5950 60  0000 C CNN
	1    7650 5950
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P14
U 1 1 561F90E8
P 7650 6050
F 0 "P14" H 7730 6050 40  0000 L CNN
F 1 "CONN_1" H 7650 6105 30  0001 C CNN
F 2 "Own_Components:solderpad_single" H 7650 6050 60  0001 C CNN
F 3 "" H 7650 6050 60  0000 C CNN
	1    7650 6050
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P15
U 1 1 561F9130
P 7650 6150
F 0 "P15" H 7730 6150 40  0000 L CNN
F 1 "CONN_1" H 7650 6205 30  0001 C CNN
F 2 "Own_Components:solderpad_single" H 7650 6150 60  0001 C CNN
F 3 "" H 7650 6150 60  0000 C CNN
	1    7650 6150
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P16
U 1 1 561F915F
P 7650 6250
F 0 "P16" H 7730 6250 40  0000 L CNN
F 1 "CONN_1" H 7650 6305 30  0001 C CNN
F 2 "Own_Components:solderpad_single" H 7650 6250 60  0001 C CNN
F 3 "" H 7650 6250 60  0000 C CNN
	1    7650 6250
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P17
U 1 1 561F9193
P 7650 6350
F 0 "P17" H 7730 6350 40  0000 L CNN
F 1 "CONN_1" H 7650 6405 30  0001 C CNN
F 2 "Own_Components:solderpad_single" H 7650 6350 60  0001 C CNN
F 3 "" H 7650 6350 60  0000 C CNN
	1    7650 6350
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P21
U 1 1 561F96C7
P 7650 6450
F 0 "P21" H 7730 6450 40  0000 L CNN
F 1 "CONN_1" H 7650 6505 30  0001 C CNN
F 2 "Own_Components:solderpad_single" H 7650 6450 60  0001 C CNN
F 3 "" H 7650 6450 60  0000 C CNN
	1    7650 6450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR35
U 1 1 561F96DD
P 7350 6450
F 0 "#PWR35" H 7350 6450 30  0001 C CNN
F 1 "GND" H 7350 6380 30  0001 C CNN
F 2 "" H 7350 6450 60  0000 C CNN
F 3 "" H 7350 6450 60  0000 C CNN
	1    7350 6450
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 6450 7500 6450
Wire Wire Line
	10500 4000 10500 4900
Wire Wire Line
	9800 3850 9900 3850
Wire Wire Line
	9900 3850 9900 3700
Connection ~ 9900 3700
Wire Wire Line
	1450 2200 1200 2200
Wire Wire Line
	1450 1800 1200 1800
Wire Wire Line
	7500 6050 7300 6050
$EndSCHEMATC
