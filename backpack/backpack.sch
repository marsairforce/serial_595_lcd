EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:local
LIBS:backpack-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "74HC595 LCD Backpack"
Date "2018-03-16"
Rev "1"
Comp "marsairfoce"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74HC595 U1
U 1 1 5AA9F6B8
P 4100 3400
F 0 "U1" H 4250 4000 50  0000 C CNN
F 1 "74HC595" H 4100 2800 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 4100 3400 50  0001 C CNN
F 3 "" H 4100 3400 50  0001 C CNN
	1    4100 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5AA9F8FC
P 6400 3050
F 0 "#PWR01" H 6400 2800 50  0001 C CNN
F 1 "GND" H 6400 2900 50  0000 C CNN
F 2 "" H 6400 3050 50  0001 C CNN
F 3 "" H 6400 3050 50  0001 C CNN
	1    6400 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3350 7000 2200
Wire Wire Line
	6900 2200 6900 3450
Wire Wire Line
	6800 2200 6800 3550
Wire Wire Line
	6700 2200 6700 3650
Wire Wire Line
	5450 2950 7200 2950
Connection ~ 6500 2950
Connection ~ 6400 2950
Wire Wire Line
	6200 2200 6200 3250
Wire Wire Line
	6200 3250 4800 3250
Connection ~ 6300 2950
Wire Wire Line
	6400 2200 6400 3050
Wire Wire Line
	6000 2200 6000 3150
Wire Wire Line
	6000 3150 4800 3150
Wire Wire Line
	7100 2200 7100 3050
Connection ~ 6100 2950
Wire Wire Line
	6600 2950 6600 2200
Wire Wire Line
	6500 2950 6500 2200
Wire Wire Line
	6300 2950 6300 2200
Wire Wire Line
	6100 2950 6100 2200
Wire Wire Line
	5700 2950 5700 2200
Wire Wire Line
	7200 2950 7200 2200
Connection ~ 6600 2950
Connection ~ 5700 2950
Wire Wire Line
	5800 2650 5800 2200
Wire Wire Line
	4900 2650 5800 2650
Connection ~ 5450 2650
Wire Wire Line
	5600 2800 5900 2800
Wire Wire Line
	5900 2800 5900 2200
Wire Wire Line
	2800 3250 3400 3250
Wire Wire Line
	3400 2950 2350 2950
Wire Wire Line
	2700 3150 3400 3150
Wire Wire Line
	2600 3450 3400 3450
Text Label 2350 2950 0    60   ~ 0
SER
Text Label 2350 3050 0    60   ~ 0
SRCLK
Text Label 2350 3150 0    60   ~ 0
RCLK
NoConn ~ 4800 3850
Wire Wire Line
	6700 3650 4800 3650
Wire Wire Line
	6800 3550 4800 3550
Wire Wire Line
	6900 3450 4800 3450
Wire Wire Line
	7000 3350 4800 3350
$Comp
L POT RV1
U 1 1 5AAAD05B
P 5100 3050
F 0 "RV1" V 4925 3050 50  0000 C CNN
F 1 "1K" H 5000 3050 50  0001 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Vishay_TS53YJ" H 5100 3050 50  0001 C CNN
F 3 "" H 5100 3050 50  0001 C CNN
	1    5100 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 3050 4950 3050
Wire Wire Line
	5100 2900 5250 2900
Wire Wire Line
	5250 2900 5250 3050
Wire Wire Line
	5250 3050 7100 3050
Wire Wire Line
	4900 2650 4900 2950
Wire Wire Line
	4900 2950 4800 2950
$Comp
L Conn_01x16 J2
U 1 1 5AAC687F
P 6400 2000
F 0 "J2" H 6400 2800 50  0000 C CNN
F 1 "Conn_01x16" H 6400 1100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.54mm" H 6400 2000 50  0001 C CNN
F 3 "" H 6400 2000 50  0001 C CNN
	1    6400 2000
	0    -1   -1   0   
$EndComp
$Comp
L Conn_01x05 J1
U 1 1 5AAC6E3E
P 2150 3050
F 0 "J1" H 2150 3350 50  0000 C CNN
F 1 "Conn_01x05" H 2150 2750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x05_Pitch2.54mm" H 2150 3050 50  0001 C CNN
F 3 "" H 2150 3050 50  0001 C CNN
	1    2150 3050
	-1   0    0    -1  
$EndComp
$Comp
L POT RV2
U 1 1 5AA9FC29
P 5450 2800
F 0 "RV2" V 5275 2800 50  0000 C CNN
F 1 "10K" V 5350 2800 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Vishay_TS53YJ" H 5450 2800 50  0001 C CNN
F 3 "" H 5450 2800 50  0001 C CNN
	1    5450 2800
	1    0    0    -1  
$EndComp
Text Label 5700 2250 3    60   ~ 0
VSS
Text Label 5800 2250 3    60   ~ 0
VDD
Text Label 5900 2250 3    60   ~ 0
VO
Text Label 6000 2250 3    60   ~ 0
RS
Text Label 6100 2250 3    60   ~ 0
R/W
Text Label 6200 2250 3    60   ~ 0
E
Text Label 6300 2250 3    60   ~ 0
D0
Text Label 6400 2250 3    60   ~ 0
D1
Text Label 6500 2250 3    60   ~ 0
D2
Text Label 6600 2250 3    60   ~ 0
D3
Text Label 6700 2250 3    60   ~ 0
D4
Text Label 6800 2250 3    60   ~ 0
D5
Text Label 6900 2250 3    60   ~ 0
D6
Text Label 7000 2250 3    60   ~ 0
D7
Text Label 7100 2250 3    60   ~ 0
LED+
Text Label 7200 2250 3    60   ~ 0
LED-
Text Label 2350 3250 0    60   ~ 0
GND
Text Label 2350 2850 0    60   ~ 0
VCC
Wire Wire Line
	3400 3550 2500 3550
Wire Wire Line
	2500 3550 2500 3250
Wire Wire Line
	2500 3250 2350 3250
Wire Wire Line
	2350 3150 2600 3150
Wire Wire Line
	2600 3150 2600 3450
Wire Wire Line
	2700 3150 2700 3050
Wire Wire Line
	2700 3050 2350 3050
Wire Wire Line
	2800 2800 2800 3250
Wire Wire Line
	2800 2850 2350 2850
$Comp
L C C1
U 1 1 5AAC74DF
P 3200 2200
F 0 "C1" H 3225 2300 50  0000 L CNN
F 1 "0.1uF" H 3225 2100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3238 2050 50  0001 C CNN
F 3 "" H 3200 2200 50  0001 C CNN
	1    3200 2200
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR02
U 1 1 5AAC7640
P 2800 2800
F 0 "#PWR02" H 2800 2650 50  0001 C CNN
F 1 "VCC" H 2800 2950 50  0000 C CNN
F 2 "" H 2800 2800 50  0001 C CNN
F 3 "" H 2800 2800 50  0001 C CNN
	1    2800 2800
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR03
U 1 1 5AAC7690
P 3200 2050
F 0 "#PWR03" H 3200 1900 50  0001 C CNN
F 1 "VCC" H 3200 2200 50  0000 C CNN
F 2 "" H 3200 2050 50  0001 C CNN
F 3 "" H 3200 2050 50  0001 C CNN
	1    3200 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5AAC76C8
P 3200 2350
F 0 "#PWR04" H 3200 2100 50  0001 C CNN
F 1 "GND" H 3200 2200 50  0000 C CNN
F 2 "" H 3200 2350 50  0001 C CNN
F 3 "" H 3200 2350 50  0001 C CNN
	1    3200 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5AAC76F4
P 2500 3550
F 0 "#PWR05" H 2500 3300 50  0001 C CNN
F 1 "GND" H 2500 3400 50  0000 C CNN
F 2 "" H 2500 3550 50  0001 C CNN
F 3 "" H 2500 3550 50  0001 C CNN
	1    2500 3550
	1    0    0    -1  
$EndComp
Connection ~ 2800 2850
$Comp
L PWR_FLAG #FLG06
U 1 1 5AAC7772
P 2400 2000
F 0 "#FLG06" H 2400 2075 50  0001 C CNN
F 1 "PWR_FLAG" H 2400 2150 50  0000 C CNN
F 2 "" H 2400 2000 50  0001 C CNN
F 3 "" H 2400 2000 50  0001 C CNN
	1    2400 2000
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG07
U 1 1 5AAC779E
P 2800 2000
F 0 "#FLG07" H 2800 2075 50  0001 C CNN
F 1 "PWR_FLAG" H 2800 2150 50  0000 C CNN
F 2 "" H 2800 2000 50  0001 C CNN
F 3 "" H 2800 2000 50  0001 C CNN
	1    2800 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5AAC77CA
P 2400 2100
F 0 "#PWR08" H 2400 1850 50  0001 C CNN
F 1 "GND" H 2400 1950 50  0000 C CNN
F 2 "" H 2400 2100 50  0001 C CNN
F 3 "" H 2400 2100 50  0001 C CNN
	1    2400 2100
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR09
U 1 1 5AAC77F6
P 2800 2100
F 0 "#PWR09" H 2800 1950 50  0001 C CNN
F 1 "VCC" H 2800 2250 50  0000 C CNN
F 2 "" H 2800 2100 50  0001 C CNN
F 3 "" H 2800 2100 50  0001 C CNN
	1    2800 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 2000 2400 2100
Wire Wire Line
	2800 2000 2800 2100
$EndSCHEMATC
