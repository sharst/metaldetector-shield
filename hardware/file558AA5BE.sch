EESchema Schematic File Version 2
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
LIBS:metaldetector-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1350 4350 3    60   Input ~ 0
COIL_OUT1
Text GLabel 2350 4350 3    60   Input ~ 0
COIL_SELECT1
Text GLabel 2450 4350 3    60   Input ~ 0
COIL_SELECT2
Text GLabel 2550 4350 3    60   Input ~ 0
COIL_SELECT3
Text GLabel 1450 4350 3    60   Input ~ 0
COIL_OUT2
Text GLabel 1550 4350 3    60   Input ~ 0
COIL_OUT3
Text GLabel 1650 4350 3    60   Input ~ 0
COIL_OUT4
Text GLabel 1750 4350 3    60   Input ~ 0
COIL_OUT5
Text GLabel 1850 4350 3    60   Input ~ 0
COIL_OUT6
Text GLabel 1950 4350 3    60   Input ~ 0
COIL_OUT7
Text GLabel 2050 4350 3    60   Input ~ 0
COIL_OUT8
Text GLabel 3150 4350 3    60   Input ~ 0
TRIG1
Text GLabel 4150 4350 3    60   Input ~ 0
COIL_SELECT1
Text GLabel 4250 4350 3    60   Input ~ 0
COIL_SELECT2
Text GLabel 4350 4350 3    60   Input ~ 0
COIL_SELECT3
Text GLabel 3250 4350 3    60   Input ~ 0
TRIG2
Text GLabel 3350 4350 3    60   Input ~ 0
TRIG3
Text GLabel 3450 4350 3    60   Input ~ 0
TRIG4
Text GLabel 3550 4350 3    60   Input ~ 0
TRIG5
Text GLabel 3650 4350 3    60   Input ~ 0
TRIG6
Text GLabel 3750 4350 3    60   Input ~ 0
TRIG7
Text GLabel 3850 4350 3    60   Input ~ 0
TRIG8
Text GLabel 3150 2750 1    60   Input ~ 0
COIL_TRIGGER
$Comp
L HEF4051 U3
U 1 1 558AA614
P 1950 3600
F 0 "U3" H 2250 2900 60  0000 C CNN
F 1 "HEF4051" H 2150 4350 60  0000 C CNN
F 2 "Own_Components:DIP16" H 1950 3600 60  0001 C CNN
F 3 "" H 1950 3600 60  0000 C CNN
	1    1950 3600
	0    -1   -1   0   
$EndComp
$Comp
L HEF4051 U4
U 1 1 558AA6BA
P 3750 3600
F 0 "U4" H 4050 2900 60  0000 C CNN
F 1 "HEF4051" H 3950 4350 60  0000 C CNN
F 2 "Own_Components:DIP16" H 3750 3600 60  0001 C CNN
F 3 "" H 3750 3600 60  0000 C CNN
	1    3750 3600
	0    -1   -1   0   
$EndComp
Text GLabel 1350 2800 1    60   Input ~ 0
COIL_OUT
Wire Wire Line
	1350 2800 1350 2900
Wire Wire Line
	3150 2900 3150 2750
Wire Wire Line
	1350 4350 1350 4300
Wire Wire Line
	1450 4350 1450 4300
Wire Wire Line
	1550 4350 1550 4300
Wire Wire Line
	1650 4350 1650 4300
Wire Wire Line
	1750 4350 1750 4300
Wire Wire Line
	1850 4350 1850 4300
Wire Wire Line
	1950 4350 1950 4300
Wire Wire Line
	2050 4350 2050 4300
Wire Wire Line
	2350 4350 2350 4300
Wire Wire Line
	2450 4350 2450 4300
Wire Wire Line
	2550 4350 2550 4300
Wire Wire Line
	3150 4350 3150 4300
Wire Wire Line
	3250 4350 3250 4300
Wire Wire Line
	3350 4350 3350 4300
Wire Wire Line
	3450 4350 3450 4300
Wire Wire Line
	3550 4350 3550 4300
Wire Wire Line
	3650 4350 3650 4300
Wire Wire Line
	3750 4350 3750 4300
Wire Wire Line
	3850 4350 3850 4300
Wire Wire Line
	4150 4350 4150 4300
Wire Wire Line
	4250 4350 4250 4300
Wire Wire Line
	4350 4350 4350 4300
Wire Wire Line
	2100 2650 2100 2900
Wire Wire Line
	1700 2700 1700 2900
$Comp
L -5V #PWR037
U 1 1 5590F5F2
P 2450 2850
F 0 "#PWR037" H 2450 2990 20  0001 C CNN
F 1 "-5V" H 2450 2960 30  0000 C CNN
F 2 "" H 2450 2850 60  0000 C CNN
F 3 "" H 2450 2850 60  0000 C CNN
	1    2450 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2900 2450 2850
Text Notes 1150 1800 0    118  ~ 0
Trigger and Receive Multiplexers
$Comp
L CONN_5X2 P?
U 1 1 561ECE2A
P 8450 4050
F 0 "P?" H 8450 4600 60  0000 C CNN
F 1 "CONN_10X2" V 8450 3950 50  0000 C CNN
F 2 "" H 8450 4050 60  0000 C CNN
F 3 "" H 8450 4050 60  0000 C CNN
	1    8450 4050
	-1   0    0    1   
$EndComp
Text GLabel 9000 4250 2    60   Input ~ 0
COIL_CONN1
Text GLabel 7900 4250 0    60   Input ~ 0
COIL_CONN2
Text GLabel 8000 4150 0    60   Input ~ 0
COIL_CONN4
Text GLabel 7900 4050 0    60   Input ~ 0
COIL_CONN6
Text GLabel 8000 3950 0    60   Input ~ 0
COIL_CONN8
Text GLabel 8900 4150 2    60   Input ~ 0
COIL_CONN3
Text GLabel 9000 4050 2    60   Input ~ 0
COIL_CONN5
Text GLabel 8900 3950 2    60   Input ~ 0
COIL_CONN7
$Comp
L GND #PWR?
U 1 1 561ED453
P 2250 5150
F 0 "#PWR?" H 2250 5150 30  0001 C CNN
F 1 "GND" H 2250 5080 30  0001 C CNN
F 2 "" H 2250 5150 60  0000 C CNN
F 3 "" H 2250 5150 60  0000 C CNN
	1    2250 5150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 561ED47E
P 4050 5150
F 0 "#PWR?" H 4050 5150 30  0001 C CNN
F 1 "GND" H 4050 5080 30  0001 C CNN
F 2 "" H 4050 5150 60  0000 C CNN
F 3 "" H 4050 5150 60  0000 C CNN
	1    4050 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 5150 2250 4300
Wire Wire Line
	4050 5150 4050 4300
$Comp
L GND #PWR?
U 1 1 561ED4FB
P 2100 2650
F 0 "#PWR?" H 2100 2650 30  0001 C CNN
F 1 "GND" H 2100 2580 30  0001 C CNN
F 2 "" H 2100 2650 60  0000 C CNN
F 3 "" H 2100 2650 60  0000 C CNN
	1    2100 2650
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 561ED537
P 3900 2650
F 0 "#PWR?" H 3900 2650 30  0001 C CNN
F 1 "GND" H 3900 2580 30  0001 C CNN
F 2 "" H 3900 2650 60  0000 C CNN
F 3 "" H 3900 2650 60  0000 C CNN
	1    3900 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 2900 3900 2650
$Comp
L +5V #PWR?
U 1 1 561ED5A4
P 1700 2700
F 0 "#PWR?" H 1700 2790 20  0001 C CNN
F 1 "+5V" H 1700 2790 30  0000 C CNN
F 2 "" H 1700 2700 60  0000 C CNN
F 3 "" H 1700 2700 60  0000 C CNN
	1    1700 2700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 561ED5E6
P 3500 2700
F 0 "#PWR?" H 3500 2790 20  0001 C CNN
F 1 "+5V" H 3500 2790 30  0000 C CNN
F 2 "" H 3500 2700 60  0000 C CNN
F 3 "" H 3500 2700 60  0000 C CNN
	1    3500 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2700 3500 2900
Connection ~ 3900 2750
Wire Wire Line
	4250 2900 4250 2750
Wire Wire Line
	4250 2750 3900 2750
NoConn ~ 8050 3850
NoConn ~ 8850 3850
Wire Wire Line
	8050 3950 8000 3950
Wire Wire Line
	7900 4050 8050 4050
Wire Wire Line
	8050 4150 8000 4150
Wire Wire Line
	7900 4250 8050 4250
Wire Wire Line
	8850 4250 9000 4250
Wire Wire Line
	8900 4150 8850 4150
Wire Wire Line
	8850 4050 9000 4050
Wire Wire Line
	8900 3950 8850 3950
Text Notes 7200 3450 0    118  ~ 0
Coil Connector
$EndSCHEMATC
