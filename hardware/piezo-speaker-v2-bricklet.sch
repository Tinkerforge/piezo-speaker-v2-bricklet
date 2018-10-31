EESchema Schematic File Version 4
LIBS:piezo-speaker-v2-bricklet-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Piezo Speaker Bricklet 2.0"
Date "2018-09-04"
Rev "2.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2018, T.Schneidermann <tim@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L tinkerforge:PT-4532PLQ P4
U 1 1 5B76FB53
P 9700 1600
F 0 "P4" H 9650 1950 50  0000 L CNN
F 1 "PT-4532PLQ" V 9750 1350 50  0000 L CNN
F 2 "kicad-libraries:PT-4532PLQ" H 9700 1600 50  0001 C CNN
F 3 "" H 9700 1600 50  0001 C CNN
	1    9700 1600
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:CON-SENSOR2 P1
U 1 1 5B76FC6F
P 1300 1800
F 0 "P1" H 1219 2241 60  0000 C CNN
F 1 "CON-SENSOR2" H 1219 2241 60  0001 C CNN
F 2 "kicad-libraries:CON-SENSOR2" H 1400 1650 60  0001 C CNN
F 3 "" H 1400 1650 60  0000 C CNN
	1    1300 1800
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:3V3 #PWR06
U 1 1 5B76FEE3
P 2850 1000
F 0 "#PWR06" H 2850 1100 40  0001 C CNN
F 1 "3V3" H 2859 1156 40  0000 C CNN
F 2 "" H 2850 1000 60  0000 C CNN
F 3 "" H 2850 1000 60  0000 C CNN
	1    2850 1000
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C2
U 1 1 5B76FF20
P 2200 1400
F 0 "C2" H 2330 1446 50  0000 L CNN
F 1 "10uF" H 2330 1355 50  0000 L CNN
F 2 "C0805" H 2200 1400 60  0001 C CNN
F 3 "" H 2200 1400 60  0000 C CNN
	1    2200 1400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C3
U 1 1 5B76FF5B
P 2850 1400
F 0 "C3" H 2980 1446 50  0000 L CNN
F 1 "1uF" H 2980 1355 50  0000 L CNN
F 2 "C0603F" H 2850 1400 60  0001 C CNN
F 3 "" H 2850 1400 60  0000 C CNN
	1    2850 1400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK4 RP1
U 1 1 5B770066
P 2500 2150
F 0 "RP1" H 2500 2600 50  0000 C CNN
F 1 "82" H 2500 2100 50  0000 C CNN
F 2 "4X0402" H 2500 2150 50  0001 C CNN
F 3 "" H 2500 2150 50  0000 C CNN
	1    2500 2150
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C1
U 1 1 5B7700D2
P 1950 2450
F 0 "C1" H 2080 2496 50  0000 L CNN
F 1 "220pF" H 2080 2405 50  0000 L CNN
F 2 "C0402F" H 1950 2450 60  0001 C CNN
F 3 "" H 1950 2450 60  0000 C CNN
	1    1950 2450
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR02
U 1 1 5B864922
P 1300 2400
F 0 "#PWR02" H 1300 2400 30  0001 C CNN
F 1 "GND" H 1300 2330 30  0001 C CNN
F 2 "" H 1300 2400 60  0000 C CNN
F 3 "" H 1300 2400 60  0000 C CNN
	1    1300 2400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR04
U 1 1 5B864956
P 1950 2800
F 0 "#PWR04" H 1950 2800 30  0001 C CNN
F 1 "GND" H 1950 2730 30  0001 C CNN
F 2 "" H 1950 2800 60  0000 C CNN
F 3 "" H 1950 2800 60  0000 C CNN
	1    1950 2800
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR07
U 1 1 5B86499C
P 2850 1650
F 0 "#PWR07" H 2850 1650 30  0001 C CNN
F 1 "GND" H 2850 1580 30  0001 C CNN
F 2 "" H 2850 1650 60  0000 C CNN
F 3 "" H 2850 1650 60  0000 C CNN
	1    2850 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2250 1300 2400
Wire Wire Line
	1650 1500 1850 1500
Wire Wire Line
	1650 1600 2200 1600
Wire Wire Line
	2850 1600 2200 1600
Connection ~ 2200 1600
Wire Wire Line
	1650 1700 2000 1700
Wire Wire Line
	2000 1700 2000 1200
Wire Wire Line
	2000 1200 2200 1200
Wire Wire Line
	2850 1200 2200 1200
Connection ~ 2200 1200
Wire Wire Line
	2850 1200 2850 1000
Connection ~ 2850 1200
Wire Wire Line
	1650 1800 2300 1800
Wire Wire Line
	2300 1900 1650 1900
Wire Wire Line
	1650 2000 2300 2000
Wire Wire Line
	2300 2100 1950 2100
Wire Wire Line
	2850 1650 2850 1600
Connection ~ 2850 1600
Wire Wire Line
	1950 2250 1950 2100
Connection ~ 1950 2100
Wire Wire Line
	1950 2100 1650 2100
Wire Wire Line
	1950 2800 1950 2650
Text GLabel 3250 1800 2    39   Output ~ 0
S-CS
Text GLabel 3250 1900 2    39   Output ~ 0
S-CLK
Text GLabel 3250 2000 2    39   Output ~ 0
S-MOSI
Text GLabel 3250 2100 2    39   Input ~ 0
S-MISO
Wire Wire Line
	3250 1800 2700 1800
Wire Wire Line
	2700 1900 3250 1900
Wire Wire Line
	3250 2000 2700 2000
Wire Wire Line
	2700 2100 3250 2100
$Comp
L tinkerforge:XMC1XXX24 U1
U 4 1 5B865F84
P 3600 6050
F 0 "U1" H 3878 6108 60  0000 L CNN
F 1 "XMC1XXX24" H 3900 5850 60  0000 L CNN
F 2 "QFN24-4x4mm-0.5mm" H 3750 6800 60  0001 C CNN
F 3 "" H 3750 6800 60  0000 C CNN
	4    3600 6050
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U1
U 1 1 5B866069
P 3600 7250
F 0 "U1" H 3878 7308 60  0000 L CNN
F 1 "XMC1XXX24" H 3878 7202 60  0000 L CNN
F 2 "QFN24-4x4mm-0.5mm" H 3750 8000 60  0001 C CNN
F 3 "" H 3750 8000 60  0000 C CNN
	1    3600 7250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U1
U 2 1 5B8660EA
P 3600 4100
F 0 "U1" H 3878 4158 60  0000 L CNN
F 1 "XMC1XXX24" H 3878 4052 60  0000 L CNN
F 2 "QFN24-4x4mm-0.5mm" H 3750 4850 60  0001 C CNN
F 3 "" H 3750 4850 60  0000 C CNN
	2    3600 4100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U1
U 3 1 5B86619E
P 3600 5100
F 0 "U1" H 4019 5158 60  0000 L CNN
F 1 "XMC1XXX24" H 4019 5052 60  0000 L CNN
F 2 "QFN24-4x4mm-0.5mm" H 3750 5850 60  0001 C CNN
F 3 "" H 3750 5850 60  0000 C CNN
	3    3600 5100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C4
U 1 1 5B86654B
P 3000 7350
F 0 "C4" H 3130 7396 50  0000 L CNN
F 1 "100nF" H 3130 7305 50  0000 L CNN
F 2 "C0603F" H 3000 7350 60  0001 C CNN
F 3 "" H 3000 7350 60  0000 C CNN
	1    3000 7350
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:3V3 #PWR08
U 1 1 5B86679E
P 3000 6950
F 0 "#PWR08" H 3000 7050 40  0001 C CNN
F 1 "3V3" H 3009 7106 40  0000 C CNN
F 2 "" H 3000 6950 60  0000 C CNN
F 3 "" H 3000 6950 60  0000 C CNN
	1    3000 6950
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR09
U 1 1 5B866883
P 3000 7650
F 0 "#PWR09" H 3000 7650 30  0001 C CNN
F 1 "GND" H 3000 7580 30  0001 C CNN
F 2 "" H 3000 7650 60  0000 C CNN
F 3 "" H 3000 7650 60  0000 C CNN
	1    3000 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 7550 3000 7550
Wire Wire Line
	3000 7650 3000 7550
Connection ~ 3000 7550
Wire Wire Line
	3250 7450 3000 7450
Wire Wire Line
	3000 7450 3000 7550
Wire Wire Line
	3000 7150 3000 6950
Wire Wire Line
	3000 6950 3250 6950
Connection ~ 3000 6950
Text GLabel 2950 5150 0    39   Input ~ 0
S-MOSI
Text GLabel 2950 5250 0    39   Input ~ 0
S-CLK
Wire Wire Line
	2950 5150 3250 5150
Wire Wire Line
	3250 5250 2950 5250
$Comp
L tinkerforge:LED D1
U 1 1 5B869855
P 1200 6300
F 0 "D1" H 1200 6515 50  0000 C CNN
F 1 "blue" H 1200 6424 50  0000 C CNN
F 2 "D0603F" H 1200 6300 50  0001 C CNN
F 3 "" H 1200 6300 50  0000 C CNN
	1    1200 6300
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:3V3 #PWR01
U 1 1 5B8699BB
P 600 6000
F 0 "#PWR01" H 600 6100 40  0001 C CNN
F 1 "3V3" H 609 6156 40  0000 C CNN
F 2 "" H 600 6000 60  0000 C CNN
F 3 "" H 600 6000 60  0000 C CNN
	1    600  6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 6300 1400 6300
Wire Wire Line
	1000 6300 600  6300
Wire Wire Line
	600  6300 600  6000
$Comp
L tinkerforge:LD1117 U2
U 1 1 5B86C2D2
P 6100 1650
F 0 "U2" H 6100 2287 60  0000 C CNN
F 1 "LD1117" H 6100 2181 60  0000 C CNN
F 2 "kicad-libraries:SOT-223" H 6100 1650 60  0001 C CNN
F 3 "" H 6100 1650 60  0000 C CNN
	1    6100 1650
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C6
U 1 1 5B86C4F3
P 5100 1650
F 0 "C6" H 5230 1696 50  0000 L CNN
F 1 "1uF" H 5230 1605 50  0000 L CNN
F 2 "C0603F" H 5100 1650 60  0001 C CNN
F 3 "" H 5100 1650 60  0000 C CNN
	1    5100 1650
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR013
U 1 1 5B86C60B
P 5100 2050
F 0 "#PWR013" H 5100 2050 30  0001 C CNN
F 1 "GND" H 5100 1980 30  0001 C CNN
F 2 "" H 5100 2050 60  0000 C CNN
F 3 "" H 5100 2050 60  0000 C CNN
	1    5100 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1450 5100 1450
Wire Wire Line
	4600 1150 4600 1450
Wire Wire Line
	4600 1450 5100 1450
Connection ~ 5100 1450
Wire Wire Line
	5100 2050 5100 1850
$Comp
L tinkerforge:+VSW #PWR010
U 1 1 5B86DEAB
P 4600 1150
F 0 "#PWR010" H 4600 1000 50  0001 C CNN
F 1 "+VSW" H 4615 1323 50  0000 C CNN
F 2 "" H 4600 1150 50  0001 C CNN
F 3 "" H 4600 1150 50  0001 C CNN
	1    4600 1150
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R R3
U 1 1 5B86E08A
P 7050 1700
F 0 "R3" H 7121 1746 50  0000 L CNN
F 1 "330" H 7121 1655 50  0000 L CNN
F 2 "R0603F" H 7050 1700 60  0001 C CNN
F 3 "" H 7050 1700 60  0000 C CNN
	1    7050 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1450 7050 1450
Wire Wire Line
	9350 1750 9250 1750
Wire Wire Line
	6100 1850 6100 1950
Wire Wire Line
	6100 1950 6200 1950
$Comp
L tinkerforge:R_PACK4 RP2
U 1 1 5B87098B
P 6050 2300
F 0 "RP2" V 6004 2728 50  0000 L CNN
F 1 "1k" V 6095 2728 50  0000 L CNN
F 2 "4X0603" H 6050 2300 50  0001 C CNN
F 3 "" H 6050 2300 50  0000 C CNN
	1    6050 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 2100 6100 1950
Connection ~ 6100 1950
Wire Wire Line
	6200 2100 6200 1950
Connection ~ 6200 1950
Wire Wire Line
	6200 1950 6300 1950
Wire Wire Line
	6300 2100 6300 1950
Connection ~ 6300 1950
Wire Wire Line
	6300 1950 6400 1950
Wire Wire Line
	6400 2100 6400 1950
Connection ~ 6400 1950
Wire Wire Line
	6400 1950 7050 1950
Text GLabel 6100 2650 3    39   Output ~ 0
LR-1
Text GLabel 6200 2650 3    39   Output ~ 0
LR-2
Text GLabel 6300 2650 3    39   Output ~ 0
LR-3
Text GLabel 6400 2650 3    39   Output ~ 0
LR-4
Wire Wire Line
	6100 2650 6100 2500
Wire Wire Line
	6200 2500 6200 2650
Wire Wire Line
	6300 2650 6300 2500
Wire Wire Line
	6400 2500 6400 2650
Text GLabel 2950 4950 0    39   Input ~ 0
LR-1
Text GLabel 2950 3750 0    39   Input ~ 0
LR-2
Text GLabel 2950 3850 0    39   Input ~ 0
LR-3
Text GLabel 2950 4050 0    39   Input ~ 0
LR-4
$Comp
L tinkerforge:LMR62014X U3
U 1 1 5B87B0B1
P 6650 4550
F 0 "U3" H 6350 4200 60  0000 L CNN
F 1 "LMR62014X" H 6700 4200 60  0000 L CNN
F 2 "SOT23-5" H 6650 4550 60  0001 C CNN
F 3 "" H 6650 4550 60  0000 C CNN
	1    6650 4550
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:+VSW #PWR011
U 1 1 5B87B2EA
P 4850 3750
F 0 "#PWR011" H 4850 3600 50  0001 C CNN
F 1 "+VSW" H 4865 3923 50  0000 C CNN
F 2 "" H 4850 3750 50  0001 C CNN
F 3 "" H 4850 3750 50  0001 C CNN
	1    4850 3750
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C5
U 1 1 5B87B35D
P 5050 4500
F 0 "C5" H 5180 4546 50  0000 L CNN
F 1 "4.7uF" H 5180 4455 50  0000 L CNN
F 2 "C0805" H 5050 4500 60  0001 C CNN
F 3 "" H 5050 4500 60  0000 C CNN
	1    5050 4500
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C7
U 1 1 5B87B3E0
P 5550 4500
F 0 "C7" H 5680 4546 50  0000 L CNN
F 1 "4.7uF" H 5680 4455 50  0000 L CNN
F 2 "C0805" H 5550 4500 60  0001 C CNN
F 3 "" H 5550 4500 60  0000 C CNN
	1    5550 4500
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:INDUCT L1
U 1 1 5B87B71A
P 5300 4000
F 0 "L1" V 5095 4000 50  0000 C CNN
F 1 "FB" V 5186 4000 50  0000 C CNN
F 2 "C0603F" H 5300 4000 60  0001 C CNN
F 3 "" H 5300 4000 60  0000 C CNN
	1    5300 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 3750 4850 4000
Wire Wire Line
	4850 4000 5050 4000
Wire Wire Line
	5050 4300 5050 4000
Connection ~ 5050 4000
Wire Wire Line
	5550 4300 5550 4000
$Comp
L tinkerforge:GND #PWR012
U 1 1 5B87EE14
P 5050 5250
F 0 "#PWR012" H 5050 5250 30  0001 C CNN
F 1 "GND" H 5050 5180 30  0001 C CNN
F 2 "" H 5050 5250 60  0000 C CNN
F 3 "" H 5050 5250 60  0000 C CNN
	1    5050 5250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR014
U 1 1 5B87EE7B
P 5550 5250
F 0 "#PWR014" H 5550 5250 30  0001 C CNN
F 1 "GND" H 5550 5180 30  0001 C CNN
F 2 "" H 5550 5250 60  0000 C CNN
F 3 "" H 5550 5250 60  0000 C CNN
	1    5550 5250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R R2
U 1 1 5B87EEF7
P 6000 4800
F 0 "R2" H 6071 4846 50  0000 L CNN
F 1 "1k" H 6071 4755 50  0000 L CNN
F 2 "R0603F" H 6000 4800 60  0001 C CNN
F 3 "" H 6000 4800 60  0000 C CNN
	1    6000 4800
	1    0    0    -1  
$EndComp
Connection ~ 5550 4000
Wire Wire Line
	6000 4500 6000 4550
Wire Wire Line
	6250 4550 6000 4550
Wire Wire Line
	5550 4700 5550 5250
Wire Wire Line
	5050 5250 5050 4700
$Comp
L tinkerforge:INDUCTOR L2
U 1 1 5B886E6F
P 6650 4000
F 0 "L2" H 6650 4247 60  0000 C CNN
F 1 "10uH" H 6650 4141 60  0000 C CNN
F 2 "NR3030" H 6650 4000 60  0001 C CNN
F 3 "" H 6650 4000 60  0001 C CNN
	1    6650 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4000 6350 4200
Wire Wire Line
	6350 4200 6450 4200
Connection ~ 6350 4000
Wire Wire Line
	6850 4200 6950 4200
Wire Wire Line
	6950 4200 6950 4000
$Comp
L tinkerforge:B0520LW-7-F D3
U 1 1 5B88B70E
P 8000 4000
F 0 "D3" H 8000 4192 40  0000 C CNN
F 1 "B0520LW-7-F" H 8000 4116 40  0000 C CNN
F 2 "SOD-123" H 8000 3900 60  0001 C CNN
F 3 "" H 8000 4000 60  0000 C CNN
	1    8000 4000
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR015
U 1 1 5B88B8A4
P 6650 5250
F 0 "#PWR015" H 6650 5250 30  0001 C CNN
F 1 "GND" H 6650 5180 30  0001 C CNN
F 2 "" H 6650 5250 60  0000 C CNN
F 3 "" H 6650 5250 60  0000 C CNN
	1    6650 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4900 6650 5250
$Comp
L tinkerforge:R_PACK4 RP3
U 1 1 5B88D33A
P 7900 5250
F 0 "RP3" V 7850 5100 50  0000 L CNN
F 1 "68k" V 7950 5150 50  0000 L CNN
F 2 "4X0603" H 7900 5250 50  0001 C CNN
F 3 "" H 7900 5250 50  0000 C CNN
	1    7900 5250
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:R_PACK4 RP4
U 1 1 5B88D41D
P 8350 5250
F 0 "RP4" V 8304 5678 50  0000 L CNN
F 1 "DNP" V 8395 5678 50  0000 L CNN
F 2 "4X0603" H 8350 5250 50  0001 C CNN
F 3 "" H 8350 5250 50  0000 C CNN
	1    8350 5250
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:R R4
U 1 1 5B88D6D0
P 8200 4350
F 0 "R4" V 7992 4350 50  0000 C CNN
F 1 "120k" V 8083 4350 50  0000 C CNN
F 2 "R0603F" H 8200 4350 60  0001 C CNN
F 3 "" H 8200 4350 60  0000 C CNN
	1    8200 4350
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:C C8
U 1 1 5B88D8F2
P 8200 4700
F 0 "C8" V 7933 4700 50  0000 C CNN
F 1 "270pF" V 8024 4700 50  0000 C CNN
F 2 "C0603F" H 8200 4700 60  0001 C CNN
F 3 "" H 8200 4700 60  0000 C CNN
	1    8200 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 4550 7950 4550
Wire Wire Line
	7950 4550 7950 4700
Wire Wire Line
	7950 4700 8000 4700
Wire Wire Line
	7950 4550 7950 4350
Connection ~ 7950 4550
Wire Wire Line
	8450 4350 8450 4000
Wire Wire Line
	8450 4000 8200 4000
Wire Wire Line
	7800 4000 6950 4000
Connection ~ 6950 4000
Wire Wire Line
	8400 4700 8450 4700
Wire Wire Line
	8450 4700 8450 4350
Connection ~ 8450 4350
Wire Wire Line
	7950 4700 7950 4950
Connection ~ 7950 4700
Wire Wire Line
	7950 4950 8050 4950
Connection ~ 7950 4950
Wire Wire Line
	7950 4950 7950 5050
Wire Wire Line
	8050 5050 8050 4950
Connection ~ 8050 4950
Wire Wire Line
	8050 4950 8150 4950
Wire Wire Line
	8150 5050 8150 4950
Connection ~ 8150 4950
Wire Wire Line
	8150 4950 8250 4950
Wire Wire Line
	8250 5050 8250 4950
Connection ~ 8250 4950
Connection ~ 8450 4000
Wire Wire Line
	9950 4000 9950 2850
Wire Wire Line
	9950 2850 8650 2850
Wire Wire Line
	8650 2850 8650 1450
Wire Wire Line
	8650 1450 8850 1450
$Comp
L tinkerforge:C C9
U 1 1 5B8B232E
P 9000 4500
F 0 "C9" H 9130 4546 50  0000 L CNN
F 1 "4.7uF" H 9130 4455 50  0000 L CNN
F 2 "C0805" H 9000 4500 60  0001 C CNN
F 3 "" H 9000 4500 60  0000 C CNN
	1    9000 4500
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR018
U 1 1 5B8B24BF
P 9550 5250
F 0 "#PWR018" H 9550 5250 30  0001 C CNN
F 1 "GND" H 9550 5180 30  0001 C CNN
F 2 "" H 9550 5250 60  0000 C CNN
F 3 "" H 9550 5250 60  0000 C CNN
	1    9550 5250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C10
U 1 1 5B86B376
P 9550 4500
F 0 "C10" H 9680 4546 50  0000 L CNN
F 1 "4.7uF" H 9680 4455 50  0000 L CNN
F 2 "C0805" H 9550 4500 60  0001 C CNN
F 3 "" H 9550 4500 60  0000 C CNN
	1    9550 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 4300 9550 4000
Wire Wire Line
	8450 4000 9000 4000
Wire Wire Line
	9000 4300 9000 4000
Connection ~ 9000 4000
Wire Wire Line
	9000 4000 9550 4000
Text GLabel 7950 5600 3    50   Output ~ 0
SU-1
Text GLabel 8050 5600 3    50   Output ~ 0
SU-2
Text GLabel 8150 5600 3    50   Output ~ 0
SU-3
Text GLabel 8250 5600 3    50   Output ~ 0
SU-4
Text GLabel 8400 5600 3    50   Output ~ 0
SU-5
Text GLabel 8600 5600 3    50   Output ~ 0
SU-6
Wire Wire Line
	7950 5600 7950 5450
Wire Wire Line
	8050 5450 8050 5600
Wire Wire Line
	8150 5600 8150 5450
Wire Wire Line
	8250 5450 8250 5600
Wire Wire Line
	8400 5600 8400 5450
Wire Wire Line
	8600 5450 8600 5600
Text GLabel 2950 4250 0    39   Input ~ 0
SU-1
Text GLabel 2950 4350 0    39   Input ~ 0
SU-2
Text GLabel 2950 4450 0    39   Input ~ 0
SU-3
Text GLabel 2950 4550 0    39   Input ~ 0
SU-4
Text GLabel 2950 5700 0    39   Input ~ 0
SU-5
Text GLabel 2950 5800 0    39   Input ~ 0
SU-6
$Comp
L tinkerforge:R R1
U 1 1 5B89746E
P 1850 6300
F 0 "R1" V 1642 6300 50  0000 C CNN
F 1 "1k" V 1733 6300 50  0000 C CNN
F 2 "R0603F" H 1850 6300 60  0001 C CNN
F 3 "" H 1850 6300 60  0000 C CNN
	1    1850 6300
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:CONN_01X01 P3
U 1 1 5B89D9E7
P 2350 3650
F 0 "P3" H 2269 3425 50  0000 C CNN
F 1 "DEBUG" H 2269 3516 50  0000 C CNN
F 2 "DEBUG_PAD" H 2350 3650 50  0001 C CNN
F 3 "" H 2350 3650 50  0000 C CNN
	1    2350 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3250 3650 2550 3650
Text GLabel 2950 3950 0    39   Output ~ 0
S-MISO
Text GLabel 2950 4150 0    39   Input ~ 0
S-CS
Wire Wire Line
	2950 3750 3250 3750
Wire Wire Line
	2950 3850 3250 3850
Wire Wire Line
	2950 3950 3250 3950
Wire Wire Line
	3250 4050 2950 4050
Wire Wire Line
	2950 4150 3250 4150
Wire Wire Line
	3250 4250 2950 4250
Wire Wire Line
	2950 4350 3250 4350
Wire Wire Line
	3250 4450 2950 4450
Wire Wire Line
	2950 4550 3250 4550
$Comp
L tinkerforge:CONN_01X02 P2
U 1 1 5B8C7662
P 2100 6150
F 0 "P2" H 2250 6150 50  0000 C CNN
F 1 "BOOT" H 2100 6300 50  0000 C CNN
F 2 "SolderJumper" H 2100 6150 50  0001 C CNN
F 3 "" H 2100 6150 50  0000 C CNN
	1    2100 6150
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR05
U 1 1 5B8C77AD
P 2350 6100
F 0 "#PWR05" H 2350 6100 30  0001 C CNN
F 1 "GND" H 2350 6030 30  0001 C CNN
F 2 "" H 2350 6100 60  0000 C CNN
F 3 "" H 2350 6100 60  0000 C CNN
	1    2350 6100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 6200 3250 6200
Wire Wire Line
	3250 5700 2950 5700
Wire Wire Line
	2950 5800 3250 5800
$Comp
L tinkerforge:B0520LW-7-F D2
U 1 1 5B8F6B96
P 7800 1450
F 0 "D2" H 7800 1642 40  0000 C CNN
F 1 "B0520LW-7-F" H 7800 1566 40  0000 C CNN
F 2 "SOD-123" H 7800 1350 60  0001 C CNN
F 3 "" H 7800 1450 60  0000 C CNN
	1    7800 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 1450 8000 1450
Connection ~ 8650 1450
Wire Wire Line
	7600 1450 7050 1450
Connection ~ 7050 1450
$Comp
L tinkerforge:B0520LW-7-F D4
U 1 1 5B8FF6C3
P 9750 4000
F 0 "D4" H 9750 4192 40  0000 C CNN
F 1 "B0520LW-7-F" H 9750 4116 40  0000 C CNN
F 2 "SOD-123" H 9750 3900 60  0001 C CNN
F 3 "" H 9750 4000 60  0000 C CNN
	1    9750 4000
	1    0    0    -1  
$EndComp
Connection ~ 9550 4000
Text GLabel 6000 4500 1    39   Output ~ 0
SU-SHDN
$Comp
L tinkerforge:GND #PWR016
U 1 1 5B90BE7A
P 9000 5250
F 0 "#PWR016" H 9000 5250 30  0001 C CNN
F 1 "GND" H 9000 5180 30  0001 C CNN
F 2 "" H 9000 5250 60  0000 C CNN
F 3 "" H 9000 5250 60  0000 C CNN
	1    9000 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4700 9000 5250
Wire Wire Line
	9550 4700 9550 5250
Text GLabel 2950 6400 0    39   Input ~ 0
SU-SHDN
Wire Wire Line
	8250 4950 8550 4950
Wire Wire Line
	8600 5050 8700 5050
Wire Wire Line
	8400 5050 8500 5050
Wire Wire Line
	8500 5450 8550 5450
Wire Wire Line
	8550 5450 8550 4950
Connection ~ 8550 4950
Wire Wire Line
	8800 4950 8800 5450
Wire Wire Line
	8800 5450 8700 5450
Wire Wire Line
	8550 4950 8800 4950
Wire Wire Line
	3250 6400 2950 6400
NoConn ~ 3250 5900
NoConn ~ 3250 6000
NoConn ~ 3250 6100
$Comp
L tinkerforge:+VSW #PWR03
U 1 1 5B7702AC
P 1850 1000
F 0 "#PWR03" H 1850 850 50  0001 C CNN
F 1 "+VSW" H 1865 1173 50  0000 C CNN
F 2 "" H 1850 1000 50  0001 C CNN
F 3 "" H 1850 1000 50  0001 C CNN
	1    1850 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1000 1850 1500
$Comp
L tinkerforge:DRILL U7
U 1 1 5B86EC19
P 11050 6400
F 0 "U7" H 11100 6450 60  0001 C CNN
F 1 "DRILL" H 10950 6400 60  0000 L CNN
F 2 "kicad-libraries:Drill" H 11050 6400 60  0001 C CNN
F 3 "" H 11050 6400 60  0000 C CNN
	1    11050 6400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:DRILL U5
U 1 1 5B86ED29
P 10750 6400
F 0 "U5" H 10800 6450 60  0001 C CNN
F 1 "DRILL" H 10650 6400 60  0000 L CNN
F 2 "kicad-libraries:Drill" H 10750 6400 60  0001 C CNN
F 3 "" H 10750 6400 60  0000 C CNN
	1    10750 6400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:DRILL U6
U 1 1 5B86EDB1
P 11050 6200
F 0 "U6" H 11100 6250 60  0001 C CNN
F 1 "DRILL" H 10950 6200 60  0000 L CNN
F 2 "kicad-libraries:Drill" H 11050 6200 60  0001 C CNN
F 3 "" H 11050 6200 60  0000 C CNN
	1    11050 6200
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:DRILL U4
U 1 1 5B86EE39
P 10750 6200
F 0 "U4" H 10800 6250 60  0001 C CNN
F 1 "DRILL" H 10650 6200 60  0000 L CNN
F 2 "kicad-libraries:Drill" H 10750 6200 60  0001 C CNN
F 3 "" H 10750 6200 60  0000 C CNN
	1    10750 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 6300 3250 6300
Wire Wire Line
	2950 4950 3250 4950
Text Notes 6800 3700 0    50   ~ 0
Copyright Tinkerforge GmbH 2018.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
Text Notes 6750 2150 0    50   ~ 0
VREF=1.25V\nVOUT = 1.25V(1+R/330)
Text Notes 6500 5800 0    50   ~ 0
VFB=1.23V\nVOUT = 1.23V(1+120k/R)
Text Notes 6650 5600 0    50   ~ 0
Ziel 13.3k
Text Notes 6600 6100 0    50   ~ 0
VFB=1.23V\nVOUT = 1.23V(1+120k/R)
Connection ~ 6000 4550
Wire Wire Line
	5550 4000 6350 4000
$Comp
L tinkerforge:GND #PWR0101
U 1 1 5BDA218E
P 6000 5250
F 0 "#PWR0101" H 6000 5250 30  0001 C CNN
F 1 "GND" H 6000 5180 30  0001 C CNN
F 2 "" H 6000 5250 60  0000 C CNN
F 3 "" H 6000 5250 60  0000 C CNN
	1    6000 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5250 6000 5050
$Comp
L tinkerforge:R R101
U 1 1 5BDA5FA7
P 8850 1700
F 0 "R101" H 8921 1746 50  0000 L CNN
F 1 "1k" H 8921 1655 50  0000 L CNN
F 2 "R0603F" H 8850 1700 60  0001 C CNN
F 3 "" H 8850 1700 60  0000 C CNN
	1    8850 1700
	1    0    0    -1  
$EndComp
Connection ~ 8850 1450
Wire Wire Line
	8850 1450 9350 1450
$Comp
L tinkerforge:MOSFET_N_CH Q101
U 1 1 5BDA64C3
P 8750 2300
F 0 "Q101" H 8941 2346 50  0000 L CNN
F 1 "2N7002P" H 8941 2255 50  0000 L CNN
F 2 "SOT23GDS" H 8950 2400 50  0001 C CNN
F 3 "" H 8750 2300 50  0000 C CNN
	1    8750 2300
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR0102
U 1 1 5BDA65EF
P 8850 2550
F 0 "#PWR0102" H 8850 2550 30  0001 C CNN
F 1 "GND" H 8850 2480 30  0001 C CNN
F 2 "" H 8850 2550 60  0000 C CNN
F 3 "" H 8850 2550 60  0000 C CNN
	1    8850 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2550 8850 2500
Wire Wire Line
	8850 2100 8850 2000
Wire Wire Line
	8850 2000 9250 2000
Wire Wire Line
	9250 2000 9250 1750
Connection ~ 8850 2000
Wire Wire Line
	8850 2000 8850 1950
Text GLabel 8350 2300 0    50   Input ~ 0
Speaker
Wire Wire Line
	8550 2300 8350 2300
Text GLabel 2950 5050 0    50   Input ~ 0
Speaker
Wire Wire Line
	2950 5050 3250 5050
Wire Wire Line
	2350 6100 2300 6100
$EndSCHEMATC
