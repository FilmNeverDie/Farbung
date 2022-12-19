EESchema Schematic File Version 4
LIBS:mainPCB_v0.92-cache
EELAYER 29 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
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
L power:GND #PWR0101
U 1 1 61147B56
P 5150 1600
F 0 "#PWR0101" H 5150 1350 50  0001 C CNN
F 1 "GND" H 5155 1427 50  0000 C CNN
F 2 "" H 5150 1600 50  0001 C CNN
F 3 "" H 5150 1600 50  0001 C CNN
	1    5150 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 61154142
P 5550 2300
F 0 "#PWR0102" H 5550 2050 50  0001 C CNN
F 1 "GND" H 5555 2127 50  0000 C CNN
F 2 "" H 5550 2300 50  0001 C CNN
F 3 "" H 5550 2300 50  0001 C CNN
	1    5550 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 6115B59F
P 5850 4400
F 0 "#PWR0103" H 5850 4150 50  0001 C CNN
F 1 "GND" H 5855 4227 50  0000 C CNN
F 2 "" H 5850 4400 50  0001 C CNN
F 3 "" H 5850 4400 50  0001 C CNN
	1    5850 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2800 1050 2800
Wire Wire Line
	3350 2800 2900 2800
Text Label 1200 2800 0    50   ~ 10
RXD2
Text Label 3000 2800 0    50   ~ 10
TXD2
Wire Wire Line
	2900 2600 3350 2600
Wire Wire Line
	1500 2500 1050 2500
Wire Wire Line
	2900 2500 3350 2500
Wire Wire Line
	1500 2400 1050 2400
Wire Wire Line
	1500 2300 1050 2300
Text Label 4800 3200 0    50   ~ 10
remove_s0
Text Label 4800 3400 0    50   ~ 10
remove_s2
Text Label 2900 2500 0    50   ~ 10
add_s2
Text Label 1500 2500 2    50   ~ 10
add_s1
Text Label 2900 2600 0    50   ~ 10
add_s0
$Comp
L Device:R R9
U 1 1 6119A225
P 3850 10000
F 0 "R9" V 4057 10000 50  0000 C CNN
F 1 "470-0.25W" V 3966 10000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3780 10000 50  0001 C CNN
F 3 "~" H 3850 10000 50  0001 C CNN
F 4 "C4502" H 0   0   50  0001 C CNN "LCSC"
	1    3850 10000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 611C2FEA
P 2250 9750
F 0 "R4" V 2457 9750 50  0000 C CNN
F 1 "47k-0.25W" V 2366 9750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2180 9750 50  0001 C CNN
F 3 "~" H 2250 9750 50  0001 C CNN
F 4 "C25833" H 0   0   50  0001 C CNN "LCSC"
	1    2250 9750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	800  9750 800  10450
Wire Wire Line
	800  10450 1200 10450
Wire Wire Line
	1200 10650 1200 10800
Wire Wire Line
	1200 10800 2050 10800
Wire Wire Line
	2050 10800 2050 9850
Wire Wire Line
	2000 9750 2100 9750
Wire Wire Line
	2400 9750 4150 9750
$Comp
L Device:R R2
U 1 1 611C7221
P 1000 10200
F 0 "R2" H 1070 10246 50  0000 L CNN
F 1 "47k-0.25W" H 1070 10155 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 930 10200 50  0001 C CNN
F 3 "~" H 1000 10200 50  0001 C CNN
F 4 "C25833" H 0   0   50  0001 C CNN "LCSC"
	1    1000 10200
	1    0    0    -1  
$EndComp
Connection ~ 4150 9750
Text GLabel 950  10650 0    50   Input ~ 10
220VAC-
$Comp
L Connector:Screw_Terminal_01x02 HE1
U 1 1 612054C3
P 4200 10900
F 0 "HE1" H 4280 10892 50  0000 L CNN
F 1 "WJ128V-5.0-2P" H 4280 10801 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 4200 10900 50  0001 C CNN
F 3 "~" H 4200 10900 50  0001 C CNN
F 4 "C8269" H 0   0   50  0001 C CNN "LCSC"
	1    4200 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 10650 4150 10750
Wire Wire Line
	1000 9850 1000 10050
Text GLabel 3850 11000 0    50   Input ~ 10
220VAC-
Wire Wire Line
	4000 11000 3850 11000
Wire Wire Line
	2900 3100 3350 3100
Wire Wire Line
	1000 10350 1000 10650
Wire Wire Line
	1000 10650 950  10650
$Comp
L Isolator:4N28 U1
U 1 1 61276EC9
P 1500 10550
F 0 "U1" H 1500 10875 50  0000 C CNN
F 1 "4N35SM" H 1500 10784 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W8.89mm_SMDSocket_LongPads" H 1300 10350 50  0001 L CIN
F 3 "https://datasheet.lcsc.com/lcsc/2104061834_ON-Semiconductor-4N28SM_C898949.pdf" H 1500 10550 50  0001 L CNN
F 4 "C433446" H 0   0   50  0001 C CNN "LCSC"
	1    1500 10550
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:MOC3020M U3
U 1 1 611884A4
P 2900 10350
F 0 "U3" H 2900 10675 50  0000 C CNN
F 1 "MOC3020S-TA1" H 2900 10584 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W8.89mm_SMDSocket_LongPads" H 2700 10150 50  0001 L CIN
F 3 "https://datasheet.lcsc.com/lcsc/1912111437_Isocom-Components-MOC3020SM_C433448.pdf" H 2900 10350 50  0001 L CNN
F 4 "C115464" H 0   0   50  0001 C CNN "LCSC"
	1    2900 10350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 611A8010
P 2450 10100
F 0 "R5" V 2657 10100 50  0000 C CNN
F 1 "150-0.25W" V 2566 10100 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2380 10100 50  0001 C CNN
F 3 "~" H 2450 10100 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    2450 10100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 9750 4150 9650
Wire Wire Line
	4150 9650 4200 9650
Text GLabel 4200 9650 2    50   Input ~ 10
220VAC+
Wire Wire Line
	2300 10100 2200 10100
Wire Wire Line
	2200 10100 2200 10050
Wire Wire Line
	1950 10100 2200 10100
Connection ~ 2200 10100
$Comp
L Device:R R6
U 1 1 612E9E75
P 3400 10000
F 0 "R6" V 3607 10000 50  0000 C CNN
F 1 "360-0.25W" V 3516 10000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3330 10000 50  0001 C CNN
F 3 "~" H 3400 10000 50  0001 C CNN
F 4 "C17932" H 0   0   50  0001 C CNN "LCSC"
	1    3400 10000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 9750 4150 9900
Wire Wire Line
	4150 10000 4000 10000
Connection ~ 4150 10000
Wire Wire Line
	4150 10000 4150 10350
Wire Wire Line
	3700 10000 3650 10000
Connection ~ 3650 10000
Wire Wire Line
	3650 10000 3550 10000
Wire Wire Line
	2600 10100 2600 10250
$Comp
L Triac_Thyristor:BT136-500 Q2
U 1 1 611844E0
P 4150 10500
F 0 "Q2" H 4278 10546 50  0000 L CNN
F 1 "BT136S-600E" H 4278 10455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 4350 10425 50  0001 L CIN
F 3 "" H 4150 10500 50  0001 L CNN
F 4 "C581425" H 0   0   50  0001 C CNN "LCSC"
	1    4150 10500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 10250 3250 10250
Wire Wire Line
	3250 10250 3250 10000
Wire Wire Line
	3450 10750 3650 10750
Wire Wire Line
	3650 10450 3650 10750
Connection ~ 3650 10750
Wire Wire Line
	3650 10750 4150 10750
Wire Wire Line
	3200 10600 4000 10600
Wire Wire Line
	3200 10450 3200 10600
Wire Wire Line
	2150 11050 2000 11050
$Comp
L power:GND #PWR0105
U 1 1 61237207
P 2000 11050
F 0 "#PWR0105" H 2000 10800 50  0001 C CNN
F 1 "GND" H 2005 10877 50  0000 C CNN
F 2 "" H 2000 11050 50  0001 C CNN
F 3 "" H 2000 11050 50  0001 C CNN
	1    2000 11050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 10550 1950 10550
Wire Wire Line
	1950 10550 1950 10100
Connection ~ 2150 10650
Wire Wire Line
	2150 10650 2300 10650
Wire Wire Line
	2150 10650 2150 10750
$Comp
L Device:R R3
U 1 1 61238D09
P 2150 10900
F 0 "R3" H 2220 10946 50  0000 L CNN
F 1 "1k-0.25W" H 2220 10855 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2080 10900 50  0001 C CNN
F 3 "~" H 2150 10900 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    2150 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 10650 2150 10650
$Comp
L power:GND #PWR0106
U 1 1 613E7036
P 2950 5600
F 0 "#PWR0106" H 2950 5350 50  0001 C CNN
F 1 "GND" H 2955 5427 50  0000 C CNN
F 2 "" H 2950 5600 50  0001 C CNN
F 3 "" H 2950 5600 50  0001 C CNN
	1    2950 5600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 613EEB95
P 3500 900
F 0 "#PWR0107" H 3500 750 50  0001 C CNN
F 1 "+5V" H 3515 1073 50  0000 C CNN
F 2 "" H 3500 900 50  0001 C CNN
F 3 "" H 3500 900 50  0001 C CNN
	1    3500 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 4700 3350 4700
Text GLabel 3350 4700 2    50   Input ~ 10
A0
Text GLabel 1050 2300 0    50   Input ~ 10
D7
Text GLabel 3350 2400 2    50   Input ~ 10
D8
Text GLabel 1050 2400 0    50   Input ~ 10
D9
Text GLabel 3350 2800 2    50   Input ~ 10
D16
Text GLabel 1050 2800 0    50   Input ~ 10
D17
Text GLabel 3350 2100 2    50   Input ~ 10
D2
Text GLabel 3350 2500 2    50   Input ~ 10
D10
Text GLabel 1050 2500 0    50   Input ~ 10
D11
Text GLabel 3350 2600 2    50   Input ~ 10
D12
Wire Wire Line
	1500 4800 1050 4800
Text Label 1100 4900 0    50   ~ 10
tanks_full
Text GLabel 1050 4800 0    50   Input ~ 10
A3
Wire Wire Line
	1500 4900 1050 4900
Text Label 1050 5000 0    50   ~ 10
tanks_low
Text GLabel 1050 4900 0    50   Input ~ 10
A5
Wire Wire Line
	2900 4900 3350 4900
Text Label 3300 5000 2    50   ~ 10
tanks_half
Text GLabel 3350 4900 2    50   Input ~ 10
A4
Text GLabel 1050 4700 0    50   Input ~ 10
A1
Text GLabel 3350 4800 2    50   Input ~ 10
A2
$Comp
L Device:R R10
U 1 1 61A59FA4
P 4700 10050
F 0 "R10" H 4770 10096 50  0000 L CNN
F 1 "68-0.25W" H 4770 10005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4630 10050 50  0001 C CNN
F 3 "~" H 4700 10050 50  0001 C CNN
F 4 "C17976" H 0   0   50  0001 C CNN "LCSC"
	1    4700 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 10000 3650 10150
Wire Wire Line
	4150 9900 4700 9900
Connection ~ 4150 9900
Wire Wire Line
	4150 9900 4150 10000
Wire Wire Line
	4700 10200 4700 10300
Wire Wire Line
	4700 10600 4700 10750
Wire Wire Line
	4700 10750 4150 10750
Connection ~ 4150 10750
$Comp
L Device:C_Polarized C2
U 1 1 61BD72B5
P 3650 10300
F 0 "C2" H 3768 10346 50  0000 L CNN
F 1 "47nF-ceramic" H 3768 10255 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3688 10150 50  0001 C CNN
F 3 "~" H 3650 10300 50  0001 C CNN
F 4 "C106083" H 0   0   50  0001 C CNN "LCSC"
	1    3650 10300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Polarized C3
U 1 1 61BF1306
P 4700 10450
F 0 "C3" H 4818 10496 50  0000 L CNN
F 1 "10nF-ceramic" H 4818 10405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4738 10300 50  0001 C CNN
F 3 "~" H 4700 10450 50  0001 C CNN
F 4 "C107201" H 0   0   50  0001 C CNN "LCSC"
	1    4700 10450
	1    0    0    -1  
$EndComp
Text GLabel 3350 5000 2    50   Input ~ 10
A6
Wire Wire Line
	1500 5000 1050 5000
Text GLabel 1050 5000 0    50   Input ~ 10
A7
Wire Wire Line
	3350 1400 2900 1400
Text GLabel 3350 1400 2    50   Input ~ 10
D0
Wire Wire Line
	3350 1300 2900 1300
Text GLabel 3350 1300 2    50   Input ~ 10
D1
Wire Wire Line
	1500 2200 1050 2200
Text GLabel 1050 2200 0    50   Input ~ 10
D5
Wire Wire Line
	1500 2100 1050 2100
Text GLabel 1050 2100 0    50   Input ~ 10
D3
Wire Wire Line
	2900 2200 3350 2200
Text GLabel 3350 2200 2    50   Input ~ 10
D4
Wire Wire Line
	2900 2300 3350 2300
Text GLabel 3350 2300 2    50   Input ~ 10
D6
Wire Wire Line
	1500 2600 1050 2600
Text GLabel 1050 2600 0    50   Input ~ 10
D13
Text GLabel 3350 2700 2    50   Input ~ 10
D14
Text GLabel 1050 2700 0    50   Input ~ 10
D15
Text Label 3300 1300 2    50   ~ 10
TX0
Text Label 3300 1400 2    50   ~ 10
RX0
Wire Wire Line
	1050 2900 1500 2900
Text GLabel 3350 2900 2    50   Input ~ 10
D18
Wire Wire Line
	3350 2900 2900 2900
Text GLabel 1050 2900 0    50   Input ~ 10
D19
Wire Wire Line
	3350 3000 2900 3000
Text GLabel 3350 3000 2    50   Input ~ 10
D20
Wire Wire Line
	1050 3000 1500 3000
Text GLabel 1050 3000 0    50   Input ~ 10
D21
Text Label 3300 2900 2    50   ~ 10
TXD1
Text Label 1100 2900 0    50   ~ 10
RXD1
Text Label 1100 3000 0    50   ~ 10
SCL
Text Label 3300 3000 2    50   ~ 10
SDA
Wire Wire Line
	3350 5100 2900 5100
Text GLabel 3350 5100 2    50   Input ~ 10
A8
Wire Wire Line
	1500 5100 1050 5100
Text GLabel 1050 5100 0    50   Input ~ 10
A9
Text GLabel 3350 5200 2    50   Input ~ 10
A10
Wire Wire Line
	1500 5200 1050 5200
Text GLabel 1050 5200 0    50   Input ~ 10
A11
Text GLabel 3350 5300 2    50   Input ~ 10
A12
Wire Wire Line
	1500 5300 1050 5300
Text GLabel 1050 5300 0    50   Input ~ 10
A13
Text GLabel 3350 5400 2    50   Input ~ 10
A14
Wire Wire Line
	1500 5400 1050 5400
Text GLabel 1050 5400 0    50   Input ~ 10
A15
Text GLabel 3350 3100 2    50   Input ~ 10
D22
Wire Wire Line
	1500 3100 1050 3100
Text GLabel 1050 3100 0    50   Input ~ 10
D23
Wire Wire Line
	2900 3200 3350 3200
Text GLabel 3350 3200 2    50   Input ~ 10
D24
Text GLabel 1050 3200 0    50   Input ~ 10
D25
Wire Wire Line
	2900 3300 3350 3300
Text GLabel 3350 3300 2    50   Input ~ 10
D26
Wire Wire Line
	1500 3300 1050 3300
Text GLabel 1050 3300 0    50   Input ~ 10
D27
Text GLabel 3350 3400 2    50   Input ~ 10
D28
Wire Wire Line
	1500 3400 1050 3400
Text GLabel 1050 3400 0    50   Input ~ 10
D29
Text GLabel 1050 4600 0    50   Input ~ 10
D53
Text Label 1150 4600 0    50   ~ 10
SS
Wire Wire Line
	2900 4600 3350 4600
Text GLabel 3350 4600 2    50   Input ~ 10
D52
Text Label 3250 4600 2    50   ~ 10
SCK
Wire Wire Line
	1500 4500 1050 4500
Text GLabel 1050 4500 0    50   Input ~ 10
D51
Text Label 1150 4500 0    50   ~ 10
MOSI
Text GLabel 3350 4500 2    50   Input ~ 10
D50
Text Label 3250 4500 2    50   ~ 10
MISO
Wire Wire Line
	1500 1200 1050 1200
Text Label 1050 1200 0    50   ~ 10
reset
Text GLabel 3350 3500 2    50   Input ~ 10
D30
Text GLabel 1050 3500 0    50   Input ~ 10
D31
Wire Wire Line
	2900 3600 3350 3600
Text GLabel 3350 3600 2    50   Input ~ 10
D32
Wire Wire Line
	1500 3600 1050 3600
Text GLabel 1050 3600 0    50   Input ~ 10
D33
Wire Wire Line
	2900 3700 3350 3700
Text GLabel 3350 3700 2    50   Input ~ 10
D34
Wire Wire Line
	1500 3700 1050 3700
Text GLabel 1050 3700 0    50   Input ~ 10
D35
Wire Wire Line
	2900 3800 3350 3800
Text GLabel 3350 3800 2    50   Input ~ 10
D36
Wire Wire Line
	1500 3800 1050 3800
Text GLabel 1050 3800 0    50   Input ~ 10
D37
Wire Wire Line
	2900 3900 3350 3900
Text GLabel 3350 3900 2    50   Input ~ 10
D38
Wire Wire Line
	1500 4000 1050 4000
Text GLabel 1050 4000 0    50   Input ~ 10
D41
Wire Wire Line
	3350 4000 2900 4000
Text GLabel 3350 4000 2    50   Input ~ 10
D40
Wire Wire Line
	1500 3900 1050 3900
Text GLabel 1050 3900 0    50   Input ~ 10
D39
Wire Wire Line
	1500 4400 1050 4400
Text GLabel 1050 4400 0    50   Input ~ 10
D49
Wire Wire Line
	2900 4400 3350 4400
Text GLabel 3350 4400 2    50   Input ~ 10
D48
Wire Wire Line
	1500 4300 1050 4300
Text GLabel 1050 4300 0    50   Input ~ 10
D47
Wire Wire Line
	2900 4300 3350 4300
Text GLabel 3350 4300 2    50   Input ~ 10
D46
Wire Wire Line
	1500 4200 1050 4200
Text GLabel 1050 4200 0    50   Input ~ 10
D45
Wire Wire Line
	2900 4200 3350 4200
Text GLabel 3350 4200 2    50   Input ~ 10
D44
Text GLabel 1050 4100 0    50   Input ~ 10
D43
Wire Wire Line
	2900 4100 3350 4100
Text GLabel 3350 4100 2    50   Input ~ 10
D42
Text Label 2900 1200 0    50   ~ 10
Aref
$Comp
L Device:C C1
U 1 1 63A46BCC
P 3650 1200
F 0 "C1" H 3765 1246 50  0000 L CNN
F 1 "100nF-ceramics" H 3765 1155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3688 1050 50  0001 C CNN
F 3 "~" H 3650 1200 50  0001 C CNN
F 4 "C1525" H 0   0   50  0001 C CNN "LCSC"
	1    3650 1200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 63A7D15A
P 3900 1200
F 0 "#PWR0122" H 3900 950 50  0001 C CNN
F 1 "GND" H 3905 1027 50  0000 C CNN
F 2 "" H 3900 1200 50  0001 C CNN
F 3 "" H 3900 1200 50  0001 C CNN
	1    3900 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 5600 6250 5600
Wire Wire Line
	6250 5600 6250 5550
Wire Wire Line
	6500 5900 6250 5900
Wire Wire Line
	6250 5900 6250 5950
Text Label 6250 5700 2    50   ~ 10
SCL
Text Label 6250 5800 2    50   ~ 10
SDA
$Comp
L power:GND #PWR0123
U 1 1 64890261
P 6250 5950
F 0 "#PWR0123" H 6250 5700 50  0001 C CNN
F 1 "GND" H 6255 5777 50  0000 C CNN
F 2 "" H 6250 5950 50  0001 C CNN
F 3 "" H 6250 5950 50  0001 C CNN
	1    6250 5950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0124
U 1 1 649B1115
P 6250 5550
F 0 "#PWR0124" H 6250 5400 50  0001 C CNN
F 1 "+5V" H 6265 5723 50  0000 C CNN
F 2 "" H 6250 5550 50  0001 C CNN
F 3 "" H 6250 5550 50  0001 C CNN
	1    6250 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5600 4750 5600
Wire Wire Line
	4750 5600 4750 5550
Wire Wire Line
	5000 5900 4750 5900
Wire Wire Line
	4750 5900 4750 5950
Wire Wire Line
	5000 5700 4750 5700
Wire Wire Line
	5000 5800 4750 5800
Text Label 4750 5700 2    50   ~ 10
SCL
Text Label 4750 5800 2    50   ~ 10
SDA
$Comp
L power:GND #PWR0125
U 1 1 64A43F69
P 4750 5950
F 0 "#PWR0125" H 4750 5700 50  0001 C CNN
F 1 "GND" H 4755 5777 50  0000 C CNN
F 2 "" H 4750 5950 50  0001 C CNN
F 3 "" H 4750 5950 50  0001 C CNN
	1    4750 5950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0126
U 1 1 64A43F6F
P 4750 5550
F 0 "#PWR0126" H 4750 5400 50  0001 C CNN
F 1 "+5V" H 4765 5723 50  0000 C CNN
F 2 "" H 4750 5550 50  0001 C CNN
F 3 "" H 4750 5550 50  0001 C CNN
	1    4750 5550
	1    0    0    -1  
$EndComp
Wire Notes Line
	4400 5250 4400 6300
Wire Notes Line
	7400 5250 4400 5250
Text Notes 4700 6250 0    50   ~ 10
Use connector pair for I2C if design has two MCUs\nadd a pair of 10k pull up per device\n
Wire Wire Line
	5250 1600 5150 1600
Wire Wire Line
	1400 8750 950  8750
Wire Wire Line
	1400 8850 950  8850
Wire Wire Line
	4650 8850 4200 8850
Wire Wire Line
	1400 8550 950  8550
Text Label 950  8750 0    50   ~ 10
Dpad_up
Text Label 950  8850 0    50   ~ 10
Dpad_left
Text Label 4650 8850 2    50   ~ 10
Dpad_down
Text Label 950  8550 0    50   ~ 10
select
$Comp
L power:GND #PWR0128
U 1 1 654CBB0F
P 850 8450
F 0 "#PWR0128" H 850 8200 50  0001 C CNN
F 1 "GND" H 855 8277 50  0000 C CNN
F 2 "" H 850 8450 50  0001 C CNN
F 3 "" H 850 8450 50  0001 C CNN
	1    850  8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 8350 850  8350
Text Label 3300 4700 2    50   ~ 10
UI_Control
Text Label 1050 2100 0    50   ~ 10
sleep_wake
Text Notes 14650 7900 0    50   ~ 10
motor 
Text Notes 5800 6400 0    50   ~ 10
buzzer\n
Text Notes 5450 9800 0    50   ~ 10
Drum lv\n
$Comp
L Connector_Generic:Conn_01x04 MOTOR1
U 1 1 6121A6FB
P 15550 9400
F 0 "MOTOR1" H 15630 9392 50  0000 L CNN
F 1 "JST_XH-A-1x04" H 15630 9301 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B4B-XH-AM_1x04_P2.50mm_Vertical" H 15550 9400 50  0001 C CNN
F 3 "~" H 15550 9400 50  0001 C CNN
F 4 "C144395" H 0   0   50  0001 C CNN "LCSC"
	1    15550 9400
	1    0    0    -1  
$EndComp
Text Label 14900 9500 0    50   ~ 10
motor_PWM
Wire Wire Line
	14900 9500 15350 9500
$Comp
L power:GND #PWR0133
U 1 1 61664815
P 6600 10800
F 0 "#PWR0133" H 6600 10550 50  0001 C CNN
F 1 "GND" H 6605 10627 50  0000 C CNN
F 2 "" H 6600 10800 50  0001 C CNN
F 3 "" H 6600 10800 50  0001 C CNN
	1    6600 10800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0134
U 1 1 61664826
P 6550 10000
F 0 "#PWR0134" H 6550 9850 50  0001 C CNN
F 1 "+5V" H 6565 10173 50  0000 C CNN
F 2 "" H 6550 10000 50  0001 C CNN
F 3 "" H 6550 10000 50  0001 C CNN
	1    6550 10000
	1    0    0    -1  
$EndComp
Text Label 6100 10500 0    50   ~ 10
hi_lv
Text Label 5250 6800 0    50   ~ 10
buzzer_sig
$Comp
L power:GND #PWR0135
U 1 1 61C08B9D
P 5500 10700
F 0 "#PWR0135" H 5500 10450 50  0001 C CNN
F 1 "GND" H 5505 10527 50  0000 C CNN
F 2 "" H 5500 10700 50  0001 C CNN
F 3 "" H 5500 10700 50  0001 C CNN
	1    5500 10700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 10450 5500 10450
Text Label 5350 10450 0    50   ~ 10
empty_lv
Text Label 3000 3400 0    50   ~ 10
empty_lv
$Comp
L Connector_Generic:Conn_01x04 XKC-Y25V1
U 1 1 61EE3CED
P 6800 10500
F 0 "XKC-Y25V1" H 6880 10542 50  0000 L CNN
F 1 "JST_XH-A-1x04" H 6880 10451 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B4B-XH-AM_1x04_P2.50mm_Vertical" H 6800 10500 50  0001 C CNN
F 3 "~" H 6800 10500 50  0001 C CNN
F 4 "C144395" H 0   0   50  0001 C CNN "LCSC"
	1    6800 10500
	1    0    0    -1  
$EndComp
Text Notes 7650 9400 0    50   ~ 10
view other driver option in v0.0
$Comp
L power:GND #PWR0136
U 1 1 629746C8
P 8000 10900
F 0 "#PWR0136" H 8000 10650 50  0001 C CNN
F 1 "GND" H 8005 10727 50  0000 C CNN
F 2 "" H 8000 10900 50  0001 C CNN
F 3 "" H 8000 10900 50  0001 C CNN
	1    8000 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	11600 10800 11600 10750
Wire Wire Line
	11600 10300 11600 10350
$Comp
L power:+5V #PWR0137
U 1 1 646A478B
P 11200 9700
F 0 "#PWR0137" H 11200 9550 50  0001 C CNN
F 1 "+5V" H 11215 9873 50  0000 C CNN
F 2 "" H 11200 9700 50  0001 C CNN
F 3 "" H 11200 9700 50  0001 C CNN
	1    11200 9700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R41
U 1 1 64868AF8
P 11350 9900
F 0 "R41" V 11557 9900 50  0000 C CNN
F 1 "200-0.25W" V 11466 9900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 11280 9900 50  0001 C CNN
F 3 "~" H 11350 9900 50  0001 C CNN
F 4 "C18002" H 0   0   50  0001 C CNN "LCSC"
	1    11350 9900
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0138
U 1 1 63F28972
P 11600 9700
F 0 "#PWR0138" H 11600 9550 50  0001 C CNN
F 1 "+12V" H 11615 9873 50  0000 C CNN
F 2 "" H 11600 9700 50  0001 C CNN
F 3 "" H 11600 9700 50  0001 C CNN
	1    11600 9700
	1    0    0    -1  
$EndComp
Wire Wire Line
	11200 9700 11200 9750
Wire Wire Line
	11000 10050 11000 10200
Wire Wire Line
	11000 10050 11200 10050
Wire Wire Line
	11200 10050 11200 10550
Wire Wire Line
	11200 10550 11300 10550
Wire Wire Line
	11000 10600 11000 10800
Wire Wire Line
	11000 10800 11600 10800
Wire Wire Line
	10700 10350 10700 10400
Wire Notes Line
	12550 11250 12500 11250
Text Label 1050 2200 0    50   ~ 10
motor_PWM
$Comp
L power:+12V #PWR0139
U 1 1 670F2159
P 15150 8850
F 0 "#PWR0139" H 15150 8700 50  0001 C CNN
F 1 "+12V" H 15165 9023 50  0000 C CNN
F 2 "" H 15150 8850 50  0001 C CNN
F 3 "" H 15150 8850 50  0001 C CNN
	1    15150 8850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0140
U 1 1 67168D76
P 14200 9650
F 0 "#PWR0140" H 14200 9400 50  0001 C CNN
F 1 "GND" H 14205 9477 50  0000 C CNN
F 2 "" H 14200 9650 50  0001 C CNN
F 3 "" H 14200 9650 50  0001 C CNN
	1    14200 9650
	1    0    0    -1  
$EndComp
Text Label 3050 3500 0    50   ~ 10
Dir
Wire Wire Line
	15350 9300 15200 9300
Text Label 3300 3800 2    50   ~ 10
lcd_back
Wire Notes Line
	7400 6300 7400 5250
$Comp
L Device:R R12
U 1 1 696D4C18
P 5800 5550
F 0 "R12" H 5870 5596 50  0000 L CNN
F 1 "10k-0.25W" H 5870 5505 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5730 5550 50  0001 C CNN
F 3 "~" H 5800 5550 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    5800 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 696D4C1E
P 6000 5550
F 0 "R13" H 6070 5596 50  0000 L CNN
F 1 "10k-0.25W" H 6070 5505 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5930 5550 50  0001 C CNN
F 3 "~" H 6000 5550 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6000 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5700 6500 5700
Wire Wire Line
	5800 5800 5800 5700
Wire Wire Line
	5800 5800 6500 5800
Wire Wire Line
	5800 5400 6000 5400
Wire Wire Line
	6000 5400 6200 5400
Wire Wire Line
	6200 5400 6200 5600
Wire Wire Line
	6200 5600 6250 5600
Connection ~ 6000 5400
Connection ~ 6250 5600
Wire Wire Line
	3450 10750 3450 10900
Text Label 3550 10900 0    50   ~ 10
heat_control
Wire Wire Line
	3450 10900 4000 10900
Wire Notes Line
	16150 8000 16150 8050
Text Notes 600  9500 0    50   ~ 10
heating pwm
Text Notes 550  7850 0    50   ~ 10
UI controls
Text Notes 4750 300  0    50   ~ 10
valve control
Text Notes 9900 250  0    50   ~ 10
tanks
Wire Notes Line
	11550 4500 11550 -300
Wire Notes Line
	7250 9600 5300 9600
$Comp
L power:GND #PWR0142
U 1 1 61139568
P 13050 4100
F 0 "#PWR0142" H 13050 3850 50  0001 C CNN
F 1 "GND" H 13055 3927 50  0000 C CNN
F 2 "" H 13050 4100 50  0001 C CNN
F 3 "" H 13050 4100 50  0001 C CNN
	1    13050 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 7V-PSU-IN1
U 1 1 6113802D
P 2550 6000
F 0 "7V-PSU-IN1" H 2630 5992 50  0000 L CNN
F 1 "WJ128V-5.0-2P" H 2630 5901 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 2550 6000 50  0001 C CNN
F 3 "~" H 2550 6000 50  0001 C CNN
F 4 "C8269" H 0   0   50  0001 C CNN "LCSC"
	1    2550 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 6000 2350 6000
Wire Wire Line
	2250 6100 2350 6100
Text Label 12900 7600 0    50   ~ 10
reset
$Comp
L power:+5V #PWR0144
U 1 1 62B7FC5F
P 13700 7400
F 0 "#PWR0144" H 13700 7250 50  0001 C CNN
F 1 "+5V" H 13715 7573 50  0000 C CNN
F 2 "" H 13700 7400 50  0001 C CNN
F 3 "" H 13700 7400 50  0001 C CNN
	1    13700 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0145
U 1 1 62B0796C
P 13700 7600
F 0 "#PWR0145" H 13700 7350 50  0001 C CNN
F 1 "GND" H 13705 7427 50  0000 C CNN
F 2 "" H 13700 7600 50  0001 C CNN
F 3 "" H 13700 7600 50  0001 C CNN
	1    13700 7600
	1    0    0    -1  
$EndComp
Text Label 13800 7500 2    50   ~ 10
MOSI
Text Label 12900 7500 0    50   ~ 10
SCK
Text Label 12900 7400 0    50   ~ 10
MISO
Wire Wire Line
	14200 9650 14200 9600
Wire Wire Line
	10700 9650 10500 9650
Text Label 10500 9650 0    50   ~ 10
pump3_con
Wire Wire Line
	13200 8550 13800 8550
Text Label 13200 8550 0    50   ~ 10
motor_on
Text Notes 14650 8050 0    50   ~ 10
0.6A, any mosfet will be fine
$Comp
L Transistor_FET:IRF540N Q34
U 1 1 62F30DFD
P 11500 10550
F 0 "Q34" H 11704 10596 50  0000 L CNN
F 1 "IRF540NPBF" H 11704 10505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 11750 10475 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 11500 10550 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    11500 10550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 10350 9200 10400
Text Label 9000 9650 0    50   ~ 10
pump2_con
Wire Wire Line
	8000 10800 8000 10900
Wire Wire Line
	8650 10300 8650 10350
$Comp
L power:+5V #PWR0146
U 1 1 6393F1AD
P 8250 9700
F 0 "#PWR0146" H 8250 9550 50  0001 C CNN
F 1 "+5V" H 8265 9873 50  0000 C CNN
F 2 "" H 8250 9700 50  0001 C CNN
F 3 "" H 8250 9700 50  0001 C CNN
	1    8250 9700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R33
U 1 1 6393F1B3
P 8450 9900
F 0 "R33" V 8657 9900 50  0000 C CNN
F 1 "200-0.25W" V 8566 9900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8380 9900 50  0001 C CNN
F 3 "~" H 8450 9900 50  0001 C CNN
F 4 "C18002" H 0   0   50  0001 C CNN "LCSC"
	1    8450 9900
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0147
U 1 1 6393F1B9
P 8650 9700
F 0 "#PWR0147" H 8650 9550 50  0001 C CNN
F 1 "+12V" H 8665 9873 50  0000 C CNN
F 2 "" H 8650 9700 50  0001 C CNN
F 3 "" H 8650 9700 50  0001 C CNN
	1    8650 9700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 9700 8250 9750
Wire Wire Line
	8050 10050 8050 10200
Wire Wire Line
	8050 10050 8250 10050
Wire Wire Line
	8250 10050 8250 10550
Wire Wire Line
	8250 10550 8350 10550
$Comp
L Device:R R30
U 1 1 6393F1C5
P 7750 10200
F 0 "R30" V 7957 10200 50  0000 C CNN
F 1 "10k-0.25W" V 7866 10200 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7680 10200 50  0001 C CNN
F 3 "~" H 7750 10200 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    7750 10200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 10350 7750 10400
$Comp
L Transistor_FET:IRF540N Q20
U 1 1 6393F1E4
P 8550 10550
F 0 "Q20" H 8754 10596 50  0000 L CNN
F 1 "IRF540NPBF" H 8754 10505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 8800 10475 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 8550 10550 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    8550 10550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 10600 8050 10800
Wire Wire Line
	7550 9650 7750 9650
Text Label 7550 9650 0    50   ~ 10
pump1_con
Wire Wire Line
	7750 9650 7750 9750
Connection ~ 11000 10800
Wire Wire Line
	10100 10800 11000 10800
Wire Wire Line
	10100 10750 10100 10800
Connection ~ 10100 10800
Wire Wire Line
	9500 10800 10100 10800
Wire Wire Line
	9500 10600 9500 10800
Connection ~ 9500 10800
$Comp
L Transistor_FET:IRF540N Q31
U 1 1 633576A8
P 10000 10550
F 0 "Q31" H 10204 10596 50  0000 L CNN
F 1 "IRF540NPBF" H 10204 10505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 10250 10475 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 10000 10550 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    10000 10550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q30
U 1 1 633576A2
P 9400 10400
F 0 "Q30" H 9591 10446 50  0000 L CNN
F 1 "BC847" H 9591 10355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9600 10325 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 9400 10400 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    9400 10400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 10550 9800 10550
Wire Wire Line
	9700 10050 9700 10550
Wire Wire Line
	9700 9700 9700 9750
$Comp
L power:+12V #PWR0148
U 1 1 63357679
P 10100 9700
F 0 "#PWR0148" H 10100 9550 50  0001 C CNN
F 1 "+12V" H 10115 9873 50  0000 C CNN
F 2 "" H 10100 9700 50  0001 C CNN
F 3 "" H 10100 9700 50  0001 C CNN
	1    10100 9700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R37
U 1 1 63357673
P 9850 9900
F 0 "R37" V 10057 9900 50  0000 C CNN
F 1 "200-0.25W" V 9966 9900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9780 9900 50  0001 C CNN
F 3 "~" H 9850 9900 50  0001 C CNN
F 4 "C18002" H 0   0   50  0001 C CNN "LCSC"
	1    9850 9900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0149
U 1 1 6335766D
P 9700 9700
F 0 "#PWR0149" H 9700 9550 50  0001 C CNN
F 1 "+5V" H 9715 9873 50  0000 C CNN
F 2 "" H 9700 9700 50  0001 C CNN
F 3 "" H 9700 9700 50  0001 C CNN
	1    9700 9700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 10300 10100 10350
Wire Wire Line
	9000 9650 9200 9650
$Comp
L Transistor_BJT:BC847 Q13
U 1 1 6393F1DE
P 7950 10400
F 0 "Q13" H 8141 10446 50  0000 L CNN
F 1 "BC847" H 8141 10355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8150 10325 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 7950 10400 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    7950 10400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 10800 8050 10800
Connection ~ 8050 10800
Wire Wire Line
	8050 10800 8650 10800
Wire Wire Line
	8650 10750 8650 10800
Connection ~ 8650 10800
Wire Wire Line
	8650 10800 9500 10800
Text Notes 8550 11100 0    50   ~ 10
500uA base drive 50mA at Collector
Wire Wire Line
	13800 9100 14000 9100
Text Label 13200 8800 0    50   ~ 10
Dir
$Comp
L Transistor_BJT:BC847 Q35
U 1 1 64E1C644
P 14200 9000
F 0 "Q35" V 14435 9000 50  0000 C CNN
F 1 "BC847" V 14526 9000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 14400 8925 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 14200 9000 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    14200 9000
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:IRF540N Q36
U 1 1 64E1C64A
P 14400 9300
F 0 "Q36" V 14649 9300 50  0000 C CNN
F 1 "IRF540NPBF" V 14740 9300 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 14650 9225 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 14400 9300 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    14400 9300
	0    1    1    0   
$EndComp
Text Label 1150 3500 0    50   ~ 10
motor_on
$Comp
L Transistor_FET:IRF540N Q38
U 1 1 6554DC4E
P 14700 9500
F 0 "Q38" V 14949 9500 50  0000 C CNN
F 1 "IRF540NPBF" V 15040 9500 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 14950 9425 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 14700 9500 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    14700 9500
	0    1    1    0   
$EndComp
Wire Wire Line
	15150 8850 15200 8850
Wire Wire Line
	14900 9600 15350 9600
Wire Wire Line
	14200 9600 14500 9600
Wire Wire Line
	14700 9300 14700 8900
Wire Wire Line
	14200 9400 14200 9600
Connection ~ 14200 9600
$Comp
L Transistor_BJT:BC847 Q37
U 1 1 6611F22C
P 14500 8800
F 0 "Q37" V 14735 8800 50  0000 C CNN
F 1 "BC847" V 14826 8800 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 14700 8725 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 14500 8800 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    14500 8800
	0    1    1    0   
$EndComp
Wire Wire Line
	14300 8900 13800 8900
Wire Wire Line
	13800 8900 13800 9100
Connection ~ 13800 9100
Wire Wire Line
	13800 9600 14200 9600
Wire Wire Line
	13800 9100 13800 9600
Wire Wire Line
	14500 8550 14500 8600
Wire Wire Line
	14700 8900 14700 8600
Wire Wire Line
	14700 8600 14750 8600
Connection ~ 14700 8900
Wire Wire Line
	15050 8600 15600 8600
Wire Wire Line
	15600 8450 15600 8600
Wire Wire Line
	15600 8450 15400 8450
Wire Wire Line
	14400 8450 14400 9100
Wire Wire Line
	14400 8450 15100 8450
Connection ~ 14400 9100
$Comp
L Device:R R43
U 1 1 675742EF
P 13800 8350
F 0 "R43" V 14007 8350 50  0000 C CNN
F 1 "10k-0.25W" V 13916 8350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 13730 8350 50  0001 C CNN
F 3 "~" H 13800 8350 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    13800 8350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R42
U 1 1 676B49AC
P 13550 8350
F 0 "R42" V 13757 8350 50  0000 C CNN
F 1 "10k-0.25W" V 13666 8350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 13480 8350 50  0001 C CNN
F 3 "~" H 13550 8350 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    13550 8350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0151
U 1 1 6771F2F7
P 13650 8100
F 0 "#PWR0151" H 13650 7950 50  0001 C CNN
F 1 "+5V" H 13665 8273 50  0000 C CNN
F 2 "" H 13650 8100 50  0001 C CNN
F 3 "" H 13650 8100 50  0001 C CNN
	1    13650 8100
	1    0    0    -1  
$EndComp
Wire Wire Line
	13550 8200 13550 8100
Wire Wire Line
	13550 8100 13650 8100
Wire Wire Line
	13800 8100 13800 8200
Connection ~ 13650 8100
Wire Wire Line
	13650 8100 13800 8100
Wire Wire Line
	13550 8500 13550 8800
Connection ~ 13550 8800
Wire Wire Line
	13550 8800 13200 8800
Wire Wire Line
	13800 8500 13800 8550
Connection ~ 13800 8550
Wire Notes Line
	12950 9950 13000 9950
$Comp
L Connector_Generic:Conn_01x04 XKC-Y26A-V1
U 1 1 61AD6797
P 5850 10450
F 0 "XKC-Y26A-V1" H 5930 10492 50  0000 L CNN
F 1 "JST_XH-A-1x04" H 5930 10401 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B4B-XH-AM_1x04_P2.50mm_Vertical" H 5850 10450 50  0001 C CNN
F 3 "~" H 5850 10450 50  0001 C CNN
F 4 "C144395" H 0   0   50  0001 C CNN "LCSC"
	1    5850 10450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 10550 5500 10550
Wire Wire Line
	5500 10550 5500 10650
Wire Wire Line
	5650 10650 5500 10650
Connection ~ 5500 10650
Wire Wire Line
	5500 10650 5500 10700
$Comp
L Device:R R11
U 1 1 6836F5FC
P 5500 10250
F 0 "R11" V 5707 10250 50  0000 C CNN
F 1 "10k-0.25W" V 5616 10250 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5430 10250 50  0001 C CNN
F 3 "~" H 5500 10250 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    5500 10250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 10400 5500 10450
Connection ~ 5500 10450
Wire Wire Line
	5500 10450 5350 10450
$Comp
L power:+5V #PWR0152
U 1 1 6822B3E7
P 5600 10050
F 0 "#PWR0152" H 5600 9900 50  0001 C CNN
F 1 "+5V" H 5615 10223 50  0000 C CNN
F 2 "" H 5600 10050 50  0001 C CNN
F 3 "" H 5600 10050 50  0001 C CNN
	1    5600 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 10100 5500 10050
Wire Wire Line
	5500 10050 5600 10050
Wire Wire Line
	5650 10050 5650 10350
Connection ~ 5600 10050
Wire Wire Line
	5600 10050 5650 10050
$Comp
L Transistor_BJT:BC847 Q32
U 1 1 62F2E344
P 10900 10400
F 0 "Q32" H 11091 10446 50  0000 L CNN
F 1 "BC847" H 11091 10355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 11100 10325 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 10900 10400 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    10900 10400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 10050 10700 9750
$Comp
L Device:R R38
U 1 1 6514C2E0
P 10700 10200
F 0 "R38" V 10907 10200 50  0000 C CNN
F 1 "10k-0.25W" V 10816 10200 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10630 10200 50  0001 C CNN
F 3 "~" H 10700 10200 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    10700 10200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 10050 9500 10200
Wire Wire Line
	9500 10050 9700 10050
Wire Wire Line
	9200 9650 9200 9750
$Comp
L Device:R R36
U 1 1 63357686
P 9450 9750
F 0 "R36" V 9657 9750 50  0000 C CNN
F 1 "10k-0.25W" V 9566 9750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9380 9750 50  0001 C CNN
F 3 "~" H 9450 9750 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    9450 9750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	15350 9600 15900 9600
Wire Wire Line
	15900 9600 15900 9450
Connection ~ 15350 9600
Wire Wire Line
	11600 9700 11600 9800
Wire Wire Line
	11600 10300 11900 10300
Wire Wire Line
	11900 10300 12050 10350
$Comp
L Device:R R34
U 1 1 6270BD83
P 6000 7150
F 0 "R34" V 6207 7150 50  0000 C CNN
F 1 "1k-0.25W" V 6116 7150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5930 7150 50  0001 C CNN
F 3 "~" H 6000 7150 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    6000 7150
	1    0    0    -1  
$EndComp
Text Label 1150 3900 0    50   ~ 10
pump1_con
Text Label 2950 4000 0    50   ~ 10
pump2_con
Text Label 1150 4000 0    50   ~ 10
pump3_con
Text Label 1400 3400 2    50   ~ 10
hi_lv
Text Label 1100 2300 0    50   ~ 10
remove_s2
Text Label 2950 2400 0    50   ~ 10
remove_s1
Wire Wire Line
	1500 3500 1050 3500
Wire Wire Line
	2900 3500 3350 3500
Text Label 1100 2400 0    50   ~ 10
remove_s0
$Comp
L Device:Buzzer BZ1
U 1 1 63B41A34
P 5900 6900
F 0 "BZ1" H 6052 6929 50  0000 L CNN
F 1 "SFN-1207PA7.6" H 6052 6838 50  0000 L CNN
F 2 "Buzzer_Beeper:Buzzer_12.6x7.0P7.5" V 5875 7000 50  0001 C CNN
F 3 "~" V 5875 7000 50  0001 C CNN
F 4 "C360605" H 0   0   50  0001 C CNN "LCSC"
	1    5900 6900
	1    0    0    -1  
$EndComp
Text Label 3200 4200 2    50   ~ 0
DB4
Text Label 1200 4200 0    50   ~ 0
DB5
Text Label 3200 4300 2    50   ~ 0
DB6
Text Label 1200 4300 0    50   ~ 0
DB7
Text Label 1400 3800 2    50   ~ 0
lcd_int
Text Label 1200 4100 0    50   ~ 0
lcd_en
Text Label 3200 4100 2    50   ~ 0
lcd_RS
Text Label 1450 5100 2    50   ~ 10
buzzer_sig
Text Label 1400 4400 2    50   ~ 10
led_woke
Text Label 1400 5400 2    50   ~ 10
AC_zero
$Comp
L Connector_Generic:Conn_01x10 LCD_SHORT_OUT1
U 1 1 63A906E4
P 7200 7600
F 0 "LCD_SHORT_OUT1" H 7280 7642 50  0000 L CNN
F 1 "JST_XH-A-1x10" H 7280 7551 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B10B-XH-A_1x10_P2.50mm_Vertical" H 7200 7600 50  0001 C CNN
F 3 "~" H 7200 7600 50  0001 C CNN
F 4 "C144400" H 0   0   50  0001 C CNN "LCSC"
	1    7200 7600
	1    0    0    1   
$EndComp
Wire Wire Line
	7000 7500 6700 7500
Wire Wire Line
	7000 7600 6700 7600
Wire Wire Line
	7000 7700 6700 7700
Wire Wire Line
	7000 7800 6700 7800
Text Label 6700 7500 0    50   ~ 0
DB4
Text Label 6700 7600 0    50   ~ 0
DB5
Text Label 6700 7700 0    50   ~ 0
DB6
Text Label 6700 7800 0    50   ~ 0
DB7
Wire Wire Line
	7000 7300 6700 7300
Text Label 6700 7300 0    50   ~ 0
lcd_RS
Text Label 6700 7400 0    50   ~ 0
lcd_en
Wire Wire Line
	7000 7400 6700 7400
Wire Wire Line
	7000 7200 6700 7200
Text Label 4800 3300 0    50   ~ 10
remove_s1
$Comp
L Connector_Generic:Conn_01x02 ADD_PUMP1
U 1 1 63357666
P 10300 10200
F 0 "ADD_PUMP1" H 10380 10192 50  0000 L CNN
F 1 "WJ128V-5.0-2P" H 10380 10101 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 10300 10200 50  0001 C CNN
F 3 "~" H 10300 10200 50  0001 C CNN
F 4 "C8269" H 0   0   50  0001 C CNN "LCSC"
	1    10300 10200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 SOAK_PUMP1
U 1 1 6393F1A6
P 8850 10200
F 0 "SOAK_PUMP1" H 8930 10192 50  0000 L CNN
F 1 "WJ128V-5.0-2P" H 8930 10101 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 8850 10200 50  0001 C CNN
F 3 "~" H 8850 10200 50  0001 C CNN
F 4 "C8269" H 0   0   50  0001 C CNN "LCSC"
	1    8850 10200
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N5819 D5
U 1 1 63D59866
P 15900 9300
F 0 "D5" V 15854 9380 50  0000 L CNN
F 1 "1N5819HW-7-F" V 15945 9380 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 15900 9125 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 15900 9300 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    15900 9300
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5819 D4
U 1 1 640CDF1D
P 12050 10200
F 0 "D4" V 12004 10280 50  0000 L CNN
F 1 "1N5819HW-7-F" V 12095 10280 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 12050 10025 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 12050 10200 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    12050 10200
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5819 D3
U 1 1 64161479
P 10500 10150
F 0 "D3" V 10454 10230 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10545 10230 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10500 9975 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10500 10150 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10500 10150
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5819 D2
U 1 1 641F4AF0
P 9000 10150
F 0 "D2" V 8954 10230 50  0000 L CNN
F 1 "1N5819HW-7-F" V 9045 10230 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 9000 9975 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 9000 10150 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    9000 10150
	0    1    1    0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x06 REMOVE_VALVE1
U 1 1 6115A9FF
P 10000 3250
F 0 "REMOVE_VALVE1" H 10080 3242 50  0000 L CNN
F 1 "WJ25C-B-7.62-6P" H 10080 3151 50  0000 L CNN
F 2 "TerminalBlock:WJ25C-B-7.62-6P" H 10000 3250 50  0001 C CNN
F 3 "~" H 10000 3250 50  0001 C CNN
F 4 "C14864" H 0   0   50  0001 C CNN "LCSC"
	1    10000 3250
	1    0    0    -1  
$EndComp
Text Notes 7500 50   0    50   ~ 0
can make sure all valves are closed \nwhen ABC are either 1 or 0
$Comp
L Connector_Generic:Conn_02x08_Odd_Even SD_LOGGER1
U 1 1 6469E86F
P 8400 5500
F 0 "SD_LOGGER1" H 8450 6017 50  0000 C CNN
F 1 "321016SG0ABK00A01" H 8450 5926 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x08_P2.54mm_Latch_Vertical" H 8400 5500 50  0001 C CNN
F 3 "~" H 8400 5500 50  0001 C CNN
F 4 "C429960" H 0   0   50  0001 C CNN "LCSC"
	1    8400 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0154
U 1 1 64744EEB
P 3450 6150
F 0 "#PWR0154" H 3450 5900 50  0001 C CNN
F 1 "GND" H 3455 5977 50  0000 C CNN
F 2 "" H 3450 6150 50  0001 C CNN
F 3 "" H 3450 6150 50  0001 C CNN
	1    3450 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0156
U 1 1 6486C300
P 3450 6050
F 0 "#PWR0156" H 3450 5900 50  0001 C CNN
F 1 "+5V" H 3465 6223 50  0000 C CNN
F 2 "" H 3450 6050 50  0001 C CNN
F 3 "" H 3450 6050 50  0001 C CNN
	1    3450 6050
	1    0    0    -1  
$EndComp
Text Notes 3600 11150 0    50   ~ 0
screw terminal to heating \n
Text Notes 2600 9550 0    50   ~ 0
AC + gnd are from screw terminal plug 
$Comp
L Connector_Generic:Conn_01x04 MCU_heating_in1
U 1 1 613E5102
P 2950 10850
F 0 "MCU_heating_in1" H 3030 10842 50  0000 L CNN
F 1 "JST_XH-A-1x04" H 3030 10751 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B4B-XH-AM_1x04_P2.50mm_Vertical" H 2950 10850 50  0001 C CNN
F 3 "~" H 2950 10850 50  0001 C CNN
F 4 "C144395" H 0   0   50  0001 C CNN "LCSC"
	1    2950 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 10950 2300 10650
Wire Wire Line
	2550 10450 2550 10850
Wire Wire Line
	2550 10850 2750 10850
Wire Wire Line
	2550 10450 2600 10450
Wire Wire Line
	2300 10950 2750 10950
Wire Wire Line
	2750 11050 2150 11050
Connection ~ 2150 11050
Text Label 1100 3300 0    50   ~ 10
temp_bus
Wire Wire Line
	1050 4600 1500 4600
$Comp
L power:+5V #PWR0161
U 1 1 628A9772
P 7900 5400
F 0 "#PWR0161" H 7900 5250 50  0001 C CNN
F 1 "+5V" H 7915 5573 50  0000 C CNN
F 2 "" H 7900 5400 50  0001 C CNN
F 3 "" H 7900 5400 50  0001 C CNN
	1    7900 5400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0162
U 1 1 629438D7
P 8050 5300
F 0 "#PWR0162" H 8050 5150 50  0001 C CNN
F 1 "+3.3V" H 8065 5473 50  0000 C CNN
F 2 "" H 8050 5300 50  0001 C CNN
F 3 "" H 8050 5300 50  0001 C CNN
	1    8050 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5300 8200 5300
Wire Wire Line
	7900 5400 8200 5400
Connection ~ 8200 5400
Wire Wire Line
	8200 5400 8700 5400
Wire Wire Line
	8200 5300 8700 5300
Connection ~ 8200 5300
Wire Wire Line
	8700 5900 8200 5900
Text Label 9050 5500 2    50   ~ 10
SS
Text Label 9050 5700 2    50   ~ 10
SCK
Text Label 9050 5600 2    50   ~ 10
MOSI
Text Label 9050 5800 2    50   ~ 10
MISO
Wire Wire Line
	8700 5800 9050 5800
Wire Wire Line
	8700 5500 9050 5500
Wire Wire Line
	8700 5600 9050 5600
Wire Wire Line
	9050 5700 8700 5700
Wire Wire Line
	8200 5600 8700 5600
Connection ~ 8700 5600
Wire Wire Line
	8700 5700 8200 5700
Connection ~ 8700 5700
Wire Wire Line
	8200 5800 8700 5800
Connection ~ 8700 5800
Wire Wire Line
	4800 3400 5150 3400
Wire Wire Line
	5650 4400 5850 4400
Wire Wire Line
	5550 4400 5650 4400
Connection ~ 5650 4400
$Comp
L Analog_Switch:CD4051B REMOVE_DEMUX1
U 1 1 6113DEC3
P 5650 3700
F 0 "REMOVE_DEMUX1" H 5650 4581 50  0000 C CNN
F 1 "CD4051BM96" H 5650 4490 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5800 2950 50  0001 L CNN
F 3 "https://datasheet.lcsc.com/lcsc/1806151615_Texas-Instruments-CD4051BNSR_C87646.pdf" H 5630 3800 50  0001 C CNN
F 4 "C21379" H 0   0   50  0001 C CNN "LCSC"
	1    5650 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	14000 8800 14200 8800
Wire Wire Line
	13700 8800 13550 8800
Wire Wire Line
	13800 8550 13950 8550
Wire Wire Line
	14250 8550 14500 8550
$Comp
L power:GND #PWR0163
U 1 1 65930FC4
P 4000 2400
F 0 "#PWR0163" H 4000 2150 50  0001 C CNN
F 1 "GND" H 4005 2227 50  0000 C CNN
F 2 "" H 4000 2400 50  0001 C CNN
F 3 "" H 4000 2400 50  0001 C CNN
	1    4000 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2400 4000 2300
Wire Wire Line
	3700 2100 3650 2100
Connection ~ 3650 2100
$Comp
L power:+5V #PWR0164
U 1 1 65D14D15
P 3650 1750
F 0 "#PWR0164" H 3650 1600 50  0001 C CNN
F 1 "+5V" H 3665 1923 50  0000 C CNN
F 2 "" H 3650 1750 50  0001 C CNN
F 3 "" H 3650 1750 50  0001 C CNN
	1    3650 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1800 3650 1750
Text Label 4350 1900 2    50   ~ 10
heat_PWMo
Text Label 3300 2100 2    50   ~ 10
heat_PWM
Wire Wire Line
	2900 5000 3350 5000
Wire Wire Line
	6550 10000 6600 10000
Wire Wire Line
	6600 10000 6600 10400
$Comp
L Device:R R35
U 1 1 66CB82FF
P 9200 10200
F 0 "R35" V 9407 10200 50  0000 C CNN
F 1 "10k-0.25W" V 9316 10200 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9130 10200 50  0001 C CNN
F 3 "~" H 9200 10200 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    9200 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R39
U 1 1 66E05ECA
P 10950 9750
F 0 "R39" V 11157 9750 50  0000 C CNN
F 1 "10k-0.25W" V 11066 9750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10880 9750 50  0001 C CNN
F 3 "~" H 10950 9750 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    10950 9750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R32
U 1 1 66EACAD7
P 8000 9750
F 0 "R32" V 8207 9750 50  0000 C CNN
F 1 "10k-0.25W" V 8116 9750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7930 9750 50  0001 C CNN
F 3 "~" H 8000 9750 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    8000 9750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10800 9750 10700 9750
Connection ~ 10700 9750
Wire Wire Line
	10700 9750 10700 9650
Wire Wire Line
	11100 9750 11200 9750
Wire Wire Line
	8150 9750 8250 9750
Wire Wire Line
	7850 9750 7750 9750
Connection ~ 7750 9750
Wire Wire Line
	7750 9750 7750 10050
Wire Wire Line
	9700 9750 9600 9750
Wire Wire Line
	9300 9750 9200 9750
Connection ~ 9200 9750
Wire Wire Line
	9200 9750 9200 10050
$Comp
L Device:R R15
U 1 1 62F072B3
P 6400 10350
F 0 "R15" V 6607 10350 50  0000 C CNN
F 1 "10k-0.25W" V 6516 10350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6330 10350 50  0001 C CNN
F 3 "~" H 6400 10350 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6400 10350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 10500 6400 10500
$Comp
L power:GND #PWR0166
U 1 1 654EB7DA
P 6600 7100
F 0 "#PWR0166" H 6600 6850 50  0001 C CNN
F 1 "GND" H 6605 6927 50  0000 C CNN
F 2 "" H 6600 7100 50  0001 C CNN
F 3 "" H 6600 7100 50  0001 C CNN
	1    6600 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 7100 7000 7100
Wire Wire Line
	6700 7200 6700 7000
$Comp
L power:+5V #PWR0167
U 1 1 640D51EE
P 6700 6950
F 0 "#PWR0167" H 6700 6800 50  0001 C CNN
F 1 "+5V" H 6715 7123 50  0000 C CNN
F 2 "" H 6700 6950 50  0001 C CNN
F 3 "" H 6700 6950 50  0001 C CNN
	1    6700 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R45
U 1 1 66AFA044
P 14100 8550
F 0 "R45" V 14307 8550 50  0000 C CNN
F 1 "10k-0.25W" V 14216 8550 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 14030 8550 50  0001 C CNN
F 3 "~" H 14100 8550 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    14100 8550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R44
U 1 1 64E1C62E
P 13850 8800
F 0 "R44" V 14057 8800 50  0000 C CNN
F 1 "10k-0.25W" V 13966 8800 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 13780 8800 50  0001 C CNN
F 3 "~" H 13850 8800 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    13850 8800
	0    -1   -1   0   
$EndComp
Text Label 6450 7600 2    50   ~ 10
lcd_back
Wire Wire Line
	7000 7900 6700 7900
Wire Wire Line
	5250 6800 5800 6800
$Comp
L Device:R R31
U 1 1 626CFDED
P 5450 7150
F 0 "R31" V 5657 7150 50  0000 C CNN
F 1 "220-0.25W" V 5566 7150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5380 7150 50  0001 C CNN
F 3 "~" H 5450 7150 50  0001 C CNN
F 4 "C17957" H 0   0   50  0001 C CNN "LCSC"
	1    5450 7150
	1    0    0    -1  
$EndComp
Text Notes 5450 300  0    50   ~ 0
solenoid require about 1 amp to drive\nneed BJT to boost the gate speed
$Comp
L power:GND #PWR0171
U 1 1 639FE8F3
P 7050 2350
F 0 "#PWR0171" H 7050 2100 50  0001 C CNN
F 1 "GND" H 7055 2177 50  0000 C CNN
F 2 "" H 7050 2350 50  0001 C CNN
F 3 "" H 7050 2350 50  0001 C CNN
	1    7050 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2150 7050 2350
$Comp
L power:GND #PWR0172
U 1 1 631A1719
P 5050 3700
F 0 "#PWR0172" H 5050 3450 50  0001 C CNN
F 1 "GND" H 5055 3527 50  0000 C CNN
F 2 "" H 5050 3700 50  0001 C CNN
F 3 "" H 5050 3700 50  0001 C CNN
	1    5050 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3700 5050 3700
Wire Wire Line
	4800 3300 5150 3300
Wire Wire Line
	4800 3200 5150 3200
$Comp
L Transistor_BJT:BC847 Q10
U 1 1 63F70C02
P 7850 1550
F 0 "Q10" V 8085 1550 50  0000 C CNN
F 1 "BC847" V 8176 1550 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8050 1475 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 7850 1550 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    7850 1550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q12
U 1 1 64207F61
P 8050 1800
F 0 "Q12" V 8285 1800 50  0000 C CNN
F 1 "BC847" V 8376 1800 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8250 1725 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 8050 1800 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    8050 1800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q16
U 1 1 642AD327
P 8300 1950
F 0 "Q16" V 8535 1950 50  0000 C CNN
F 1 "BC847" V 8626 1950 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8500 1875 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 8300 1950 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    8300 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2150 7050 2150
Connection ~ 7350 2150
Wire Wire Line
	7350 2150 7550 2150
Connection ~ 7550 2150
Wire Wire Line
	7550 2150 7750 2150
Wire Wire Line
	8400 2150 8150 2150
Connection ~ 7750 2150
Connection ~ 7950 2150
Wire Wire Line
	7950 2150 7750 2150
Connection ~ 8150 2150
Wire Wire Line
	8150 2150 7950 2150
$Comp
L Transistor_FET:IRF540N Q29
U 1 1 63FB71F1
P 9400 1650
F 0 "Q29" H 9604 1696 50  0000 L CNN
F 1 "IRF540NPBF" H 9604 1605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9650 1575 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 9400 1650 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    9400 1650
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF540N Q27
U 1 1 63F14C3C
P 9250 1500
F 0 "Q27" H 9454 1546 50  0000 L CNN
F 1 "IRF540NPBF" H 9454 1455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9500 1425 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 9250 1500 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    9250 1500
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF540N Q25
U 1 1 63E7254C
P 9100 1350
F 0 "Q25" H 9304 1396 50  0000 L CNN
F 1 "IRF540NPBF" H 9304 1305 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9350 1275 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 9100 1350 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    9100 1350
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF540N Q23
U 1 1 63DCFC77
P 8950 1200
F 0 "Q23" H 9154 1246 50  0000 L CNN
F 1 "IRF540NPBF" H 9154 1155 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9200 1125 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 8950 1200 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    8950 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 800  7650 800 
Wire Wire Line
	8150 800  8400 800 
Wire Wire Line
	8050 800  8050 850 
Wire Wire Line
	8050 850  8150 850 
$Comp
L Connector:Screw_Terminal_01x06 ADD_VALVE1
U 1 1 61154A07
P 9900 1150
F 0 "ADD_VALVE1" H 9980 1142 50  0000 L CNN
F 1 "WJ25C-B-7.62-6P" H 9980 1051 50  0000 L CNN
F 2 "TerminalBlock:WJ25C-B-7.62-6P" H 9900 1150 50  0001 C CNN
F 3 "~" H 9900 1150 50  0001 C CNN
F 4 "C14864" H 0   0   50  0001 C CNN "LCSC"
	1    9900 1150
	1    0    0    -1  
$EndComp
Connection ~ 8400 2150
Wire Wire Line
	8900 1250 8800 1250
Wire Wire Line
	9050 1400 8950 1400
Wire Wire Line
	8950 2150 8800 2150
Connection ~ 8800 2150
Wire Wire Line
	9100 2150 8950 2150
Connection ~ 8950 2150
Wire Wire Line
	9350 1700 9250 1700
Wire Wire Line
	9250 2150 9100 2150
Connection ~ 9100 2150
Wire Wire Line
	9500 2150 9250 2150
Connection ~ 9250 2150
Wire Wire Line
	9350 1300 9450 1300
Wire Wire Line
	9450 1300 9450 1350
Wire Wire Line
	9450 1350 9700 1350
Wire Wire Line
	9200 1150 9500 1150
Wire Wire Line
	9500 1150 9500 1250
Wire Wire Line
	9500 1250 9700 1250
Wire Wire Line
	9050 1000 9550 1000
Wire Wire Line
	9550 1000 9550 1150
Wire Wire Line
	9550 1150 9700 1150
Wire Wire Line
	8900 850  9600 850 
Wire Wire Line
	9600 850  9600 1050
Wire Wire Line
	9600 1050 9700 1050
Wire Wire Line
	8750 750  9700 750 
Wire Wire Line
	9700 750  9700 950 
Wire Wire Line
	5150 1500 5250 1500
Wire Wire Line
	7650 950  7650 800 
Wire Wire Line
	7750 800  7750 1050
Wire Wire Line
	7850 1200 7750 1200
Wire Wire Line
	7850 800  7850 1200
Wire Wire Line
	7950 800  7950 1350
Connection ~ 7750 1050
Wire Wire Line
	7550 1050 7750 1050
$Comp
L Transistor_FET:IRF540N Q18
U 1 1 632FD95A
P 8650 950
F 0 "Q18" H 8854 996 50  0000 L CNN
F 1 "IRF540NPBF" H 8854 905 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 8900 875 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 8650 950 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    8650 950 
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF540N Q21
U 1 1 63D2CE2F
P 8800 1050
F 0 "Q21" H 9004 1096 50  0000 L CNN
F 1 "IRF540NPBF" H 9004 1005 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9050 975 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 8800 1050 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    8800 1050
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q8
U 1 1 63E1800F
P 7650 1400
F 0 "Q8" V 7885 1400 50  0000 C CNN
F 1 "BC847" V 7976 1400 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7850 1325 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 7650 1400 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    7650 1400
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q6
U 1 1 63D7320A
P 7450 1250
F 0 "Q6" V 7685 1250 50  0000 C CNN
F 1 "BC847" V 7776 1250 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7650 1175 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 7450 1250 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    7450 1250
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q4
U 1 1 6379903F
P 7250 1000
F 0 "Q4" V 7485 1000 50  0000 C CNN
F 1 "BC847" V 7576 1000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7450 925 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 7250 1000 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    7250 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 61D93802
P 7050 1150
F 0 "R18" H 7120 1196 50  0000 L CNN
F 1 "1k-0.25W" H 7120 1105 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6980 1150 50  0001 C CNN
F 3 "~" H 7050 1150 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7050 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1200 5250 1200
Wire Wire Line
	4900 1100 5250 1100
Wire Wire Line
	4900 1300 5250 1300
Text Label 4900 1200 0    50   ~ 10
add_s1
Text Label 4900 1300 0    50   ~ 10
add_s2
Text Label 4900 1100 0    50   ~ 10
add_s0
Wire Wire Line
	5150 1600 5150 1500
Connection ~ 5150 1600
$Comp
L Device:R R20
U 1 1 6A645AF3
P 7250 1400
F 0 "R20" H 7320 1446 50  0000 L CNN
F 1 "1k-0.25W" H 7320 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7180 1400 50  0001 C CNN
F 3 "~" H 7250 1400 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7250 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R23
U 1 1 6A6FDBE4
P 7450 1550
F 0 "R23" H 7520 1596 50  0000 L CNN
F 1 "1k-0.25W" H 7520 1505 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7380 1550 50  0001 C CNN
F 3 "~" H 7450 1550 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7450 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 1550 7250 1600
$Comp
L Device:R R28
U 1 1 6AE3C6B6
P 7850 1950
F 0 "R28" H 7920 1996 50  0000 L CNN
F 1 "1k-0.25W" H 7920 1905 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7780 1950 50  0001 C CNN
F 3 "~" H 7850 1950 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7850 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 6AEF2AC0
P 7450 2000
F 0 "R24" H 7520 2046 50  0000 L CNN
F 1 "1k-0.25W" H 7520 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7380 2000 50  0001 C CNN
F 3 "~" H 7450 2000 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7450 2000
	0    1    -1   0   
$EndComp
Wire Wire Line
	7350 1200 7350 2150
Wire Wire Line
	7550 1450 7550 2150
Wire Wire Line
	7750 1600 7750 2150
Wire Wire Line
	7950 1750 7950 2150
Wire Wire Line
	8150 2000 8150 2150
Wire Wire Line
	7100 1800 7100 1850
Wire Wire Line
	7100 1850 7650 1850
Wire Wire Line
	7100 1900 7100 2100
Wire Wire Line
	7100 2100 7850 2100
Wire Wire Line
	7600 2000 8100 2000
Wire Wire Line
	8100 2000 8100 1950
Wire Wire Line
	8800 1250 8800 2150
Wire Wire Line
	9200 1550 9100 1550
Wire Wire Line
	8400 2150 8600 2150
Wire Wire Line
	8600 1150 8600 2150
Wire Wire Line
	9500 1850 9500 2150
Wire Wire Line
	9250 1700 9250 2150
Wire Wire Line
	9100 1550 9100 2150
Wire Wire Line
	8950 1400 8950 2150
$Comp
L power:GND #PWR0175
U 1 1 6D2661D4
P 7150 4450
F 0 "#PWR0175" H 7150 4200 50  0001 C CNN
F 1 "GND" H 7155 4277 50  0000 C CNN
F 2 "" H 7150 4450 50  0001 C CNN
F 3 "" H 7150 4450 50  0001 C CNN
	1    7150 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4250 7150 4450
$Comp
L Transistor_BJT:BC847 Q9
U 1 1 6D2661DB
P 7950 3650
F 0 "Q9" V 8185 3650 50  0000 C CNN
F 1 "BC847" V 8276 3650 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8150 3575 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 7950 3650 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    7950 3650
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q11
U 1 1 6D2661E1
P 8150 3900
F 0 "Q11" V 8385 3900 50  0000 C CNN
F 1 "BC847" V 8476 3900 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8350 3825 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 8150 3900 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    8150 3900
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q14
U 1 1 6D2661E7
P 8400 4050
F 0 "Q14" V 8635 4050 50  0000 C CNN
F 1 "BC847" V 8726 4050 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8600 3975 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 8400 4050 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    8400 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4250 7150 4250
Connection ~ 7450 4250
Wire Wire Line
	7450 4250 7650 4250
Connection ~ 7650 4250
Wire Wire Line
	7650 4250 7850 4250
Wire Wire Line
	8500 4250 8250 4250
Connection ~ 7850 4250
Connection ~ 8050 4250
Wire Wire Line
	8050 4250 7850 4250
Connection ~ 8250 4250
Wire Wire Line
	8250 4250 8050 4250
$Comp
L Transistor_FET:IRF540N Q26
U 1 1 6D266204
P 9350 3600
F 0 "Q26" H 9554 3646 50  0000 L CNN
F 1 "IRF540NPBF" H 9554 3555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9600 3525 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 9350 3600 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    9350 3600
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF540N Q24
U 1 1 6D26620A
P 9200 3450
F 0 "Q24" H 9404 3496 50  0000 L CNN
F 1 "IRF540NPBF" H 9404 3405 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9450 3375 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 9200 3450 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    9200 3450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF540N Q22
U 1 1 6D266210
P 9050 3300
F 0 "Q22" H 9254 3346 50  0000 L CNN
F 1 "IRF540NPBF" H 9254 3255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9300 3225 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 9050 3300 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    9050 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2900 7750 2900
Wire Wire Line
	8250 2900 8500 2900
Wire Wire Line
	8150 2900 8150 2950
Wire Wire Line
	8150 2950 8250 2950
Connection ~ 8500 4250
Wire Wire Line
	9000 3350 8900 3350
Wire Wire Line
	9150 3500 9050 3500
Wire Wire Line
	9050 4250 8900 4250
Connection ~ 8900 4250
Wire Wire Line
	9200 4250 9050 4250
Connection ~ 9050 4250
Wire Wire Line
	9450 3800 9350 3800
Wire Wire Line
	9350 4250 9200 4250
Connection ~ 9200 4250
Wire Wire Line
	9600 4250 9350 4250
Connection ~ 9350 4250
Wire Wire Line
	9600 3550 9800 3550
Wire Wire Line
	9450 3400 9550 3400
Wire Wire Line
	9550 3400 9550 3450
Wire Wire Line
	9550 3450 9800 3450
Wire Wire Line
	9300 3250 9600 3250
Wire Wire Line
	9600 3250 9600 3350
Wire Wire Line
	9600 3350 9800 3350
Wire Wire Line
	9150 3100 9650 3100
Wire Wire Line
	9650 3100 9650 3250
Wire Wire Line
	9650 3250 9800 3250
Wire Wire Line
	9000 2950 9700 2950
Wire Wire Line
	9700 2950 9700 3150
Wire Wire Line
	9700 3150 9800 3150
Wire Wire Line
	8850 2850 9800 2850
Wire Wire Line
	7750 3050 7750 2900
Wire Wire Line
	7850 2900 7850 3150
Wire Wire Line
	7950 3300 7850 3300
Wire Wire Line
	7950 2900 7950 3300
Wire Wire Line
	8050 2900 8050 3450
Connection ~ 7850 3150
Wire Wire Line
	7650 3150 7850 3150
$Comp
L Transistor_FET:IRF540N Q17
U 1 1 6D266244
P 8750 3050
F 0 "Q17" H 8954 3096 50  0000 L CNN
F 1 "IRF540NPBF" H 8954 3005 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9000 2975 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 8750 3050 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    8750 3050
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF540N Q19
U 1 1 6D26624A
P 8900 3150
F 0 "Q19" H 9104 3196 50  0000 L CNN
F 1 "IRF540NPBF" H 9104 3105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9150 3075 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 8900 3150 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    8900 3150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q7
U 1 1 6D266252
P 7750 3500
F 0 "Q7" V 7985 3500 50  0000 C CNN
F 1 "BC847" V 8076 3500 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7950 3425 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 7750 3500 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    7750 3500
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q5
U 1 1 6D266258
P 7550 3350
F 0 "Q5" V 7785 3350 50  0000 C CNN
F 1 "BC847" V 7876 3350 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7750 3275 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 7550 3350 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    7550 3350
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q3
U 1 1 6D26625E
P 7350 3100
F 0 "Q3" V 7585 3100 50  0000 C CNN
F 1 "BC847" V 7676 3100 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7550 3025 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 7350 3100 50  0001 L CNN
F 4 "C391423" H 0   0   50  0001 C CNN "LCSC"
	1    7350 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 6D266264
P 7150 3250
F 0 "R17" H 7220 3296 50  0000 L CNN
F 1 "1k-0.25W" H 7220 3205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7080 3250 50  0001 C CNN
F 3 "~" H 7150 3250 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7150 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 6D266283
P 7350 3500
F 0 "R19" H 7420 3546 50  0000 L CNN
F 1 "1k-0.25W" H 7420 3455 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7280 3500 50  0001 C CNN
F 3 "~" H 7350 3500 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7350 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 6D266289
P 7550 3650
F 0 "R21" H 7620 3696 50  0000 L CNN
F 1 "1k-0.25W" H 7620 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7480 3650 50  0001 C CNN
F 3 "~" H 7550 3650 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7550 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R25
U 1 1 6D26628F
P 7750 3800
F 0 "R25" H 7820 3846 50  0000 L CNN
F 1 "1k-0.25W" H 7820 3755 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7680 3800 50  0001 C CNN
F 3 "~" H 7750 3800 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7750 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3600 7150 3400
Wire Wire Line
	7350 3650 7350 3700
$Comp
L Device:R R27
U 1 1 6D266297
P 7950 4050
F 0 "R27" H 8020 4096 50  0000 L CNN
F 1 "1k-0.25W" H 8020 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7880 4050 50  0001 C CNN
F 3 "~" H 7950 4050 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7950 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R22
U 1 1 6D26629D
P 7550 4100
F 0 "R22" H 7620 4146 50  0000 L CNN
F 1 "1k-0.25W" H 7620 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7480 4100 50  0001 C CNN
F 3 "~" H 7550 4100 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7550 4100
	0    1    -1   0   
$EndComp
Wire Wire Line
	7450 3300 7450 4250
Wire Wire Line
	7650 3550 7650 4250
Wire Wire Line
	7850 3700 7850 4250
Wire Wire Line
	8050 3850 8050 4250
Wire Wire Line
	8250 4100 8250 4250
Wire Wire Line
	7200 3900 7200 3950
Wire Wire Line
	7200 3950 7750 3950
Wire Wire Line
	7200 4000 7200 4200
Wire Wire Line
	7200 4200 7950 4200
Wire Wire Line
	7700 4100 8200 4100
Wire Wire Line
	8200 4100 8200 4050
Wire Wire Line
	8900 3350 8900 4250
Wire Wire Line
	9300 3650 9200 3650
Wire Wire Line
	8500 4250 8700 4250
Wire Wire Line
	8700 3250 8700 4250
Wire Wire Line
	9600 3950 9600 4250
Wire Wire Line
	9350 3800 9350 4250
Wire Wire Line
	9200 3650 9200 4250
Wire Wire Line
	9050 3500 9050 4250
Wire Wire Line
	9800 3050 9800 2850
Wire Wire Line
	5050 3600 5050 3700
Wire Wire Line
	5050 3600 5150 3600
Connection ~ 5050 3700
$Comp
L Transistor_FET:IRF540N Q28
U 1 1 6D2661FE
P 9500 3750
F 0 "Q28" H 9704 3796 50  0000 L CNN
F 1 "IRF540NPBF" H 9704 3705 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9750 3675 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 9500 3750 50  0001 L CNN
F 4 "C2566" H 0   0   50  0001 C CNN "LCSC"
	1    9500 3750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF540N Q15
U 1 1 6D9D0C02
P 5600 7500
F 0 "Q15" H 5804 7546 50  0000 L CNN
F 1 "IRF510PBF" H 5804 7455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5850 7425 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 5600 7500 50  0001 L CNN
F 4 "C727603" H 0   0   50  0001 C CNN "LCSC"
	1    5600 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0176
U 1 1 6DC394C5
P 5550 7800
F 0 "#PWR0176" H 5550 7550 50  0001 C CNN
F 1 "GND" H 5555 7627 50  0000 C CNN
F 2 "" H 5550 7800 50  0001 C CNN
F 3 "" H 5550 7800 50  0001 C CNN
	1    5550 7800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 7800 5700 7800
Wire Wire Line
	5400 7500 5200 7500
Wire Wire Line
	5450 7300 5700 7300
Wire Wire Line
	5700 7700 5700 7800
Text Label 4950 7500 0    50   ~ 10
buzzer_loud
$Comp
L Device:R R29
U 1 1 6E8AD6CE
P 5200 7250
F 0 "R29" H 5270 7296 50  0000 L CNN
F 1 "10k-0.25W" H 5270 7205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5130 7250 50  0001 C CNN
F 3 "~" H 5200 7250 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    5200 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0177
U 1 1 6F86D218
P 5200 7100
F 0 "#PWR0177" H 5200 6950 50  0001 C CNN
F 1 "+5V" H 5215 7273 50  0000 C CNN
F 2 "" H 5200 7100 50  0001 C CNN
F 3 "" H 5200 7100 50  0001 C CNN
	1    5200 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 7400 5200 7500
Connection ~ 5200 7500
Wire Wire Line
	5200 7500 4950 7500
Wire Wire Line
	5450 7000 5800 7000
Wire Wire Line
	5800 7000 6000 7000
Connection ~ 5800 7000
Wire Wire Line
	6000 7300 6000 7800
Wire Wire Line
	6000 7800 5700 7800
Connection ~ 5700 7800
Text Label 2900 5100 0    50   ~ 10
buzzer_loud
Wire Notes Line
	4600 4450 11550 4450
Text Label 1100 4700 0    50   ~ 10
A_highref
$Comp
L Device:R R1
U 1 1 6177BCCC
P 750 4550
F 0 "R1" V 957 4550 50  0000 C CNN
F 1 "10k-0.25W" V 866 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 680 4550 50  0001 C CNN
F 3 "~" H 750 4550 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    750  4550
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0179
U 1 1 6177BCD2
P 750 4350
F 0 "#PWR0179" H 750 4200 50  0001 C CNN
F 1 "+5V" H 765 4523 50  0000 C CNN
F 2 "" H 750 4350 50  0001 C CNN
F 3 "" H 750 4350 50  0001 C CNN
	1    750  4350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	750  4400 750  4350
Wire Wire Line
	1500 4700 750  4700
Text Label 3300 4800 2    50   ~ 10
A_lowref
$Comp
L Device:R R8
U 1 1 622452AF
P 3650 4950
F 0 "R8" V 3857 4950 50  0000 C CNN
F 1 "10k-0.25W" V 3766 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3580 4950 50  0001 C CNN
F 3 "~" H 3650 4950 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    3650 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0180
U 1 1 6231A557
P 3650 5100
F 0 "#PWR0180" H 3650 4850 50  0001 C CNN
F 1 "GND" H 3655 4927 50  0000 C CNN
F 2 "" H 3650 5100 50  0001 C CNN
F 3 "" H 3650 5100 50  0001 C CNN
	1    3650 5100
	1    0    0    -1  
$EndComp
$Comp
L MEGA_PRO_EMBED_CH340G___ATMEGA2560:MEGA_PRO_EMBED_CH340G___ATMEGA2560 U2
U 1 1 61543782
P 2200 3200
F 0 "U2" H 2200 5867 50  0000 C CNN
F 1 "MEGA_PRO_EMBED_CH340G___ATMEGA2560" H 2200 5776 50  0000 C CNN
F 2 "" H 2200 3200 50  0001 L BNN
F 3 "" H 2200 3200 50  0001 L BNN
F 4 "Manufacturer Recommendations" H 2200 3200 50  0001 L BNN "STANDARD"
F 5 "Robotdyn" H 2200 3200 50  0001 L BNN "MANUFACTURER"
F 6 "12/May/2017" H 2200 3200 50  0001 L BNN "PARTREV"
	1    2200 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 5600 2900 5600
Wire Wire Line
	4350 1900 4000 1900
Text Label 1300 1400 0    50   ~ 10
MOSI
Text Label 1300 1500 0    50   ~ 10
MISO
Wire Wire Line
	1300 1500 1500 1500
Text Label 1300 1600 0    50   ~ 10
SCK
Wire Wire Line
	1300 1600 1500 1600
Text Label 1300 1700 0    50   ~ 10
reset
Wire Wire Line
	1500 1700 1300 1700
$Comp
L power:+3.3V #PWR0181
U 1 1 68EC9E6F
P 3950 1000
F 0 "#PWR0181" H 3950 850 50  0001 C CNN
F 1 "+3.3V" H 3965 1173 50  0000 C CNN
F 2 "" H 3950 1000 50  0001 C CNN
F 3 "" H 3950 1000 50  0001 C CNN
	1    3950 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  9750 1350 9750
Wire Wire Line
	1000 9850 1450 9850
Wire Wire Line
	1450 9850 1450 9750
Wire Wire Line
	1650 9850 1650 9750
Wire Wire Line
	1650 9850 2050 9850
Wire Wire Line
	2000 9750 2000 9600
Wire Wire Line
	2000 9600 1550 9600
Wire Wire Line
	1550 9600 1550 9750
$Comp
L Connector_Generic:Conn_01x04 MCU_HEAT_OUT1
U 1 1 6185FBE1
P 3150 6950
F 0 "MCU_HEAT_OUT1" H 3230 6942 50  0000 L CNN
F 1 "JST_XH-A-1x04" H 3230 6851 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B4B-XH-AM_1x04_P2.50mm_Vertical" H 3150 6950 50  0001 C CNN
F 3 "~" H 3150 6950 50  0001 C CNN
F 4 "C144395" H 0   0   50  0001 C CNN "LCSC"
	1    3150 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 619280E4
P 2950 7150
F 0 "#PWR0110" H 2950 6900 50  0001 C CNN
F 1 "GND" H 2955 6977 50  0000 C CNN
F 2 "" H 2950 7150 50  0001 C CNN
F 3 "" H 2950 7150 50  0001 C CNN
	1    2950 7150
	1    0    0    -1  
$EndComp
Text Label 2600 7050 0    50   ~ 10
AC_zero
Text Label 2500 6950 0    50   ~ 10
heat_PWMo
$Comp
L power:+5V #PWR0111
U 1 1 61B803E5
P 2950 6850
F 0 "#PWR0111" H 2950 6700 50  0001 C CNN
F 1 "+5V" H 2965 7023 50  0000 C CNN
F 2 "" H 2950 6850 50  0001 C CNN
F 3 "" H 2950 6850 50  0001 C CNN
	1    2950 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 7050 2950 7050
Wire Wire Line
	2500 6950 2950 6950
$Comp
L power:GND #PWR0112
U 1 1 620FF77F
P 450 7050
F 0 "#PWR0112" H 450 6800 50  0001 C CNN
F 1 "GND" H 455 6877 50  0000 C CNN
F 2 "" H 450 7050 50  0001 C CNN
F 3 "" H 450 7050 50  0001 C CNN
	1    450  7050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 PSU_12VOUT1
U 1 1 620FF78C
P 650 6950
F 0 "PSU_12VOUT1" H 730 6942 50  0000 L CNN
F 1 "WJ128V-5.0-2P" H 730 6851 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 650 6950 50  0001 C CNN
F 3 "~" H 650 6950 50  0001 C CNN
F 4 "C8269" H 0   0   50  0001 C CNN "LCSC"
	1    650  6950
	1    0    0    -1  
$EndComp
Text Notes 150  6600 0    50   ~ 0
12V output to 5V buck converter\n
Text Notes 3350 5800 0    50   ~ 0
extra 5V port\n
Text Notes 1450 6800 0    50   ~ 0
wired to 12V PSU\n
Wire Wire Line
	6350 8750 6700 8750
Text Label 6700 8750 2    50   ~ 10
led_woke
$Comp
L power:+5V #PWR0114
U 1 1 62F3920F
P 5600 8750
F 0 "#PWR0114" H 5600 8600 50  0001 C CNN
F 1 "+5V" H 5615 8923 50  0000 C CNN
F 2 "" H 5600 8750 50  0001 C CNN
F 3 "" H 5600 8750 50  0001 C CNN
	1    5600 8750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 63002CAF
P 6600 9150
F 0 "#PWR0115" H 6600 8900 50  0001 C CNN
F 1 "GND" H 6605 8977 50  0000 C CNN
F 2 "" H 6600 9150 50  0001 C CNN
F 3 "" H 6600 9150 50  0001 C CNN
	1    6600 9150
	1    0    0    -1  
$EndComp
Text Label 6850 8850 2    50   ~ 10
select
Text Label 6850 8950 2    50   ~ 10
cancel
Text Label 6850 9050 2    50   ~ 10
sleep_wake
$Comp
L Connector_Generic:Conn_02x05_Odd_Even UI_PCB1
U 1 1 634C3021
P 6050 8950
F 0 "UI_PCB1" H 6100 9367 50  0000 C CNN
F 1 "321010SG0ABK00A01" H 6100 9276 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x05_P2.54mm_Vertical" H 6050 8950 50  0001 C CNN
F 3 "~" H 6050 8950 50  0001 C CNN
F 4 "C429962" H 0   0   50  0001 C CNN "LCSC"
	1    6050 8950
	1    0    0    -1  
$EndComp
Text Label 5400 9150 0    50   ~ 10
Dpad_down
Text Label 5400 9050 0    50   ~ 10
Dpad_right
Text Label 5400 8950 0    50   ~ 10
Dpad_left
Text Label 5400 8850 0    50   ~ 10
Dpad_up
Wire Wire Line
	6600 9150 6350 9150
Wire Wire Line
	5600 8750 5850 8750
Wire Wire Line
	3900 1200 3800 1200
$Comp
L Device:Fuse F3
U 1 1 656D2A7F
P 3900 800
F 0 "F3" V 3703 800 50  0000 C CNN
F 1 "BSMD1206-050-13.2V" V 3794 800 50  0000 C CNN
F 2 "Fuse:Fuse_1206_3216Metric" V 3830 800 50  0001 C CNN
F 3 "~" H 3900 800 50  0001 C CNN
F 4 "C883123" V 3900 800 50  0001 C CNN "LCSC"
	1    3900 800 
	0    1    1    0   
$EndComp
$Comp
L Device:R R60
U 1 1 66353213
P 6500 1250
F 0 "R60" H 6570 1296 50  0000 L CNN
F 1 "10k-0.25W" H 6570 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6430 1250 50  0001 C CNN
F 3 "~" H 6500 1250 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6500 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R62
U 1 1 667B1B75
P 6600 1250
F 0 "R62" H 6670 1296 50  0000 L CNN
F 1 "10k-0.25W" H 6670 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6530 1250 50  0001 C CNN
F 3 "~" H 6600 1250 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6600 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R64
U 1 1 6688B542
P 6700 1250
F 0 "R64" H 6770 1296 50  0000 L CNN
F 1 "10k-0.25W" H 6770 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6630 1250 50  0001 C CNN
F 3 "~" H 6700 1250 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6700 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R66
U 1 1 66964EA6
P 6800 1250
F 0 "R66" H 6870 1296 50  0000 L CNN
F 1 "10k-0.25W" H 6870 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6730 1250 50  0001 C CNN
F 3 "~" H 6800 1250 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6800 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R67
U 1 1 66A3E81A
P 6900 1250
F 0 "R67" H 6970 1296 50  0000 L CNN
F 1 "10k-0.25W" H 6970 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6830 1250 50  0001 C CNN
F 3 "~" H 6900 1250 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6900 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2000 6900 2000
Wire Wire Line
	6250 1900 6800 1900
Wire Wire Line
	6250 1800 6700 1800
$Comp
L Device:R R58
U 1 1 66B22B3F
P 6400 1250
F 0 "R58" H 6470 1296 50  0000 L CNN
F 1 "10k-0.25W" H 6470 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6330 1250 50  0001 C CNN
F 3 "~" H 6400 1250 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6400 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R57
U 1 1 66BF7FB1
P 6350 3350
F 0 "R57" H 6420 3396 50  0000 L CNN
F 1 "10k-0.25W" H 6420 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6280 3350 50  0001 C CNN
F 3 "~" H 6350 3350 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6350 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R59
U 1 1 66BF7FB7
P 6450 3350
F 0 "R59" H 6520 3396 50  0000 L CNN
F 1 "10k-0.25W" H 6520 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6380 3350 50  0001 C CNN
F 3 "~" H 6450 3350 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6450 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R61
U 1 1 66BF7FBD
P 6550 3350
F 0 "R61" H 6620 3396 50  0000 L CNN
F 1 "10k-0.25W" H 6620 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6480 3350 50  0001 C CNN
F 3 "~" H 6550 3350 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6550 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R63
U 1 1 66BF7FC3
P 6650 3350
F 0 "R63" H 6720 3396 50  0000 L CNN
F 1 "10k-0.25W" H 6720 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6580 3350 50  0001 C CNN
F 3 "~" H 6650 3350 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6650 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R65
U 1 1 66BF7FC9
P 6750 3350
F 0 "R65" H 6820 3396 50  0000 L CNN
F 1 "10k-0.25W" H 6820 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6680 3350 50  0001 C CNN
F 3 "~" H 6750 3350 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6750 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R56
U 1 1 66BF7FCF
P 6250 3350
F 0 "R56" H 6320 3396 50  0000 L CNN
F 1 "10k-0.25W" H 6320 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6180 3350 50  0001 C CNN
F 3 "~" H 6250 3350 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6250 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 4100 6750 4100
Wire Wire Line
	6150 4000 6650 4000
Wire Wire Line
	6150 3900 6550 3900
Wire Wire Line
	6400 1100 6500 1100
Connection ~ 6500 1100
Wire Wire Line
	6500 1100 6600 1100
Connection ~ 6600 1100
Wire Wire Line
	6600 1100 6700 1100
Connection ~ 6700 1100
Wire Wire Line
	6700 1100 6800 1100
Connection ~ 6800 1100
Wire Wire Line
	6800 1100 6900 1100
Wire Wire Line
	6900 1400 6900 2000
Connection ~ 6900 2000
Wire Wire Line
	6900 2000 7300 2000
Wire Wire Line
	6800 1400 6800 1900
Connection ~ 6800 1900
Wire Wire Line
	6800 1900 7100 1900
Wire Wire Line
	6700 1800 6700 1400
Connection ~ 6700 1800
Wire Wire Line
	6700 1800 7100 1800
Wire Wire Line
	6550 3500 6550 3900
Connection ~ 6550 3900
Wire Wire Line
	6550 3900 7200 3900
Wire Wire Line
	6650 3500 6650 4000
Connection ~ 6650 4000
Wire Wire Line
	6650 4000 7200 4000
Wire Wire Line
	6750 3500 6750 4100
Connection ~ 6750 4100
Wire Wire Line
	6750 4100 7400 4100
Wire Wire Line
	6750 3200 6650 3200
Connection ~ 6350 3200
Wire Wire Line
	6350 3200 6250 3200
Connection ~ 6450 3200
Wire Wire Line
	6450 3200 6350 3200
Connection ~ 6550 3200
Wire Wire Line
	6550 3200 6450 3200
Connection ~ 6650 3200
Wire Wire Line
	6650 3200 6550 3200
Connection ~ 6250 3200
$Comp
L Device:R R70
U 1 1 68071672
P 7750 2750
F 0 "R70" H 7820 2796 50  0000 L CNN
F 1 "150-0.25W" H 7820 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7680 2750 50  0001 C CNN
F 3 "~" H 7750 2750 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    7750 2750
	1    0    0    -1  
$EndComp
Connection ~ 7750 2900
$Comp
L Device:R R72
U 1 1 683F6C84
P 7850 2750
F 0 "R72" H 7920 2796 50  0000 L CNN
F 1 "150-0.25W" H 7920 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7780 2750 50  0001 C CNN
F 3 "~" H 7850 2750 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    7850 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R74
U 1 1 684D7C8D
P 7950 2750
F 0 "R74" H 8020 2796 50  0000 L CNN
F 1 "150-0.25W" H 8020 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7880 2750 50  0001 C CNN
F 3 "~" H 7950 2750 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    7950 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R76
U 1 1 685B8C96
P 8050 2750
F 0 "R76" H 8120 2796 50  0000 L CNN
F 1 "150-0.25W" H 8120 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7980 2750 50  0001 C CNN
F 3 "~" H 8050 2750 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    8050 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R78
U 1 1 68699CB9
P 8150 2750
F 0 "R78" H 8220 2796 50  0000 L CNN
F 1 "150-0.25W" H 8220 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8080 2750 50  0001 C CNN
F 3 "~" H 8150 2750 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    8150 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R79
U 1 1 6877AD16
P 8250 2750
F 0 "R79" H 8320 2796 50  0000 L CNN
F 1 "150-0.25W" H 8320 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8180 2750 50  0001 C CNN
F 3 "~" H 8250 2750 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    8250 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R68
U 1 1 6885C018
P 7650 650
F 0 "R68" H 7720 696 50  0000 L CNN
F 1 "150-0.25W" H 7720 605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7580 650 50  0001 C CNN
F 3 "~" H 7650 650 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    7650 650 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R69
U 1 1 6893D021
P 7750 650
F 0 "R69" H 7820 696 50  0000 L CNN
F 1 "150-0.25W" H 7820 605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7680 650 50  0001 C CNN
F 3 "~" H 7750 650 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    7750 650 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R71
U 1 1 68A1E0F1
P 7850 650
F 0 "R71" H 7920 696 50  0000 L CNN
F 1 "150-0.25W" H 7920 605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7780 650 50  0001 C CNN
F 3 "~" H 7850 650 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    7850 650 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R73
U 1 1 68AFF1BC
P 7950 650
F 0 "R73" H 8020 696 50  0000 L CNN
F 1 "150-0.25W" H 8020 605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7880 650 50  0001 C CNN
F 3 "~" H 7950 650 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    7950 650 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R75
U 1 1 68BE0396
P 8050 650
F 0 "R75" H 8120 696 50  0000 L CNN
F 1 "150-0.25W" H 8120 605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7980 650 50  0001 C CNN
F 3 "~" H 8050 650 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    8050 650 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R77
U 1 1 68CC1486
P 8150 650
F 0 "R77" H 8220 696 50  0000 L CNN
F 1 "150-0.25W" H 8220 605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8080 650 50  0001 C CNN
F 3 "~" H 8150 650 50  0001 C CNN
F 4 "C17917" H 0   0   50  0001 C CNN "LCSC"
	1    8150 650 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2600 8150 2600
Wire Wire Line
	7750 2600 7750 2500
Connection ~ 7750 2600
Connection ~ 7850 2600
Wire Wire Line
	7850 2600 7750 2600
Connection ~ 7950 2600
Wire Wire Line
	7950 2600 7850 2600
Connection ~ 8050 2600
Wire Wire Line
	8050 2600 7950 2600
Connection ~ 8150 2600
Wire Wire Line
	8150 2600 8050 2600
Wire Wire Line
	8150 500  8050 500 
Wire Wire Line
	7650 500  7650 400 
Connection ~ 7650 500 
Connection ~ 7750 500 
Wire Wire Line
	7750 500  7650 500 
Connection ~ 7850 500 
Wire Wire Line
	7850 500  7750 500 
Connection ~ 7950 500 
Wire Wire Line
	7950 500  7850 500 
Connection ~ 8050 500 
Wire Wire Line
	8050 500  7950 500 
Wire Wire Line
	1500 3200 1050 3200
Text Notes 13450 600  0    50   ~ 10
All DAC shared the same WR and CS so all data are updated at the same time
$Comp
L Device:R R7
U 1 1 65B25D3F
P 3650 1950
F 0 "R7" V 3857 1950 50  0000 C CNN
F 1 "10k-0.25W" V 3766 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3580 1950 50  0001 C CNN
F 3 "~" H 3650 1950 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    3650 1950
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF540N Q1
U 1 1 65930FBA
P 3900 2100
F 0 "Q1" H 4104 2146 50  0000 L CNN
F 1 "IRF510PBF" H 4104 2055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4150 2025 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 3900 2100 50  0001 L CNN
F 4 "C727603" H 0   0   50  0001 C CNN "LCSC"
	1    3900 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R26
U 1 1 6A7B644E
P 7650 1700
F 0 "R26" H 7720 1746 50  0000 L CNN
F 1 "1k-0.25W" H 7720 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7580 1700 50  0001 C CNN
F 3 "~" H 7650 1700 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    7650 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 850  8150 1500
Wire Wire Line
	8400 800  8400 1650
Wire Wire Line
	8250 2950 8250 3600
Wire Wire Line
	8500 2900 8500 3750
Wire Wire Line
	7650 950  8450 950 
Wire Wire Line
	7750 1050 8600 1050
Wire Wire Line
	8600 1150 8750 1150
Wire Wire Line
	8400 1650 9200 1650
Connection ~ 8400 1650
Wire Wire Line
	8400 1650 8400 1750
Wire Wire Line
	8150 1500 9050 1500
Connection ~ 8150 1500
Wire Wire Line
	8150 1500 8150 1600
Wire Wire Line
	7950 1350 8900 1350
Connection ~ 7950 1350
Wire Wire Line
	7850 1200 8750 1200
Connection ~ 7850 1200
Wire Wire Line
	8600 2150 8800 2150
Connection ~ 8600 2150
Wire Wire Line
	8550 3050 7750 3050
Wire Wire Line
	7850 3150 8700 3150
Wire Wire Line
	8700 3250 8850 3250
Wire Wire Line
	7950 3300 8850 3300
Connection ~ 7950 3300
Wire Wire Line
	8250 3600 9150 3600
Connection ~ 8250 3600
Wire Wire Line
	8250 3600 8250 3700
Wire Wire Line
	8050 3450 9000 3450
Connection ~ 8050 3450
Wire Wire Line
	8500 3750 9300 3750
Connection ~ 8500 3750
Wire Wire Line
	8500 3750 8500 3850
Wire Wire Line
	8700 4250 8900 4250
Connection ~ 8700 4250
NoConn ~ 6150 4200
NoConn ~ 6150 3500
NoConn ~ 6250 2100
NoConn ~ 6250 1400
$Comp
L Connector:Screw_Terminal_01x02 220VAC1
U 1 1 6402E5C4
P 12900 850
F 0 "220VAC1" H 12980 892 50  0000 L CNN
F 1 "WJ25C-B-7.62-2P" H 12980 801 50  0000 L CNN
F 2 "TerminalBlock:WJ25C-B-7.62-2P" H 12900 850 50  0001 C CNN
F 3 "~" H 12900 850 50  0001 C CNN
F 4 "C8422" H -50 300 50  0001 C CNN "LCSC"
	1    12900 850 
	1    0    0    1   
$EndComp
Text GLabel 12600 650  0    50   Input ~ 10
220VAC+
Text GLabel 12600 850  0    50   Input ~ 10
220VAC-
Wire Wire Line
	12600 650  12700 650 
Wire Wire Line
	12600 850  12700 850 
Text Notes 14350 10750 0    50   ~ 0
CP800 version 0.1\nfuse protection only\nable to demo all function\nread processing off SD card\nNot yet implement\nhold up capacitor\nreverse polarity protection\nundervoltage protection\nover voltage protection\n
$Comp
L Device:Fuse F9
U 1 1 61D5016B
P 15200 9000
F 0 "F9" H 15260 9046 50  0000 L CNN
F 1 "BSMD1206-075-16V" H 15260 8955 50  0000 L CNN
F 2 "Fuse:Fuse_1206_3216Metric" V 15130 9000 50  0001 C CNN
F 3 "~" H 15200 9000 50  0001 C CNN
F 4 "C883128" H 0   0   50  0001 C CNN "LCSC"
	1    15200 9000
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F8
U 1 1 61D53109
P 11600 9950
F 0 "F8" H 11660 9996 50  0000 L CNN
F 1 "BSMD1812-260-13.2V" H 11660 9905 50  0000 L CNN
F 2 "Fuse:Fuse_1812_4532Metric" V 11530 9950 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/2103231637_BHFUSE-BSMD1812-110-24V_C883149.pdf" H 11600 9950 50  0001 C CNN
F 4 "C883159" H 0   0   50  0001 C CNN "LCSC"
	1    11600 9950
	1    0    0    -1  
$EndComp
Text Notes 17900 5650 3    50   ~ 0
list of hardwares\n\n
Wire Wire Line
	15900 9150 15200 9150
Wire Wire Line
	15200 9300 15200 9150
Connection ~ 15200 9150
$Comp
L Device:Fuse F5
U 1 1 62611765
P 10100 9850
F 0 "F5" H 10160 9896 50  0000 L CNN
F 1 "BSMD1812-260-13.2V" H 10160 9805 50  0000 L CNN
F 2 "Fuse:Fuse_1812_4532Metric" V 10030 9850 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/2103231637_BHFUSE-BSMD1812-110-24V_C883149.pdf" H 10100 9850 50  0001 C CNN
F 4 "C883159" H 0   0   50  0001 C CNN "LCSC"
	1    10100 9850
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F4
U 1 1 626AA7FB
P 8650 9850
F 0 "F4" H 8710 9896 50  0000 L CNN
F 1 "BSMD1206-050-16V" H 8710 9805 50  0000 L CNN
F 2 "Fuse:Fuse_1206_3216Metric" V 8580 9850 50  0001 C CNN
F 3 "~" H 8650 9850 50  0001 C CNN
F 4 "C883124" H 0   0   50  0001 C CNN "LCSC"
	1    8650 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 10300 9000 10300
Wire Wire Line
	10100 10300 10500 10300
Wire Wire Line
	11600 10100 11950 10100
Wire Wire Line
	11950 10100 11950 10050
Wire Wire Line
	11950 10050 12050 10050
Connection ~ 11600 10100
Wire Wire Line
	10100 10000 10500 10000
Connection ~ 10100 10000
Wire Wire Line
	8650 10000 9000 10000
Connection ~ 8650 10000
$Comp
L Connector:Screw_Terminal_01x02 VALVE12V1
U 1 1 62CB9E0F
P 11500 1750
F 0 "VALVE12V1" H 11580 1742 50  0000 L CNN
F 1 "WJ25C-B-7.62-2P" H 11580 1651 50  0000 L CNN
F 2 "TerminalBlock:WJ25C-B-7.62-2P" H 11500 1750 50  0001 C CNN
F 3 "~" H 11500 1750 50  0001 C CNN
F 4 "C8422" H 0   0   50  0001 C CNN "LCSC"
	1    11500 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0141
U 1 1 62E93442
P 11000 750
F 0 "#PWR0141" H 11000 600 50  0001 C CNN
F 1 "+12V" H 11015 923 50  0000 C CNN
F 2 "" H 11000 750 50  0001 C CNN
F 3 "" H 11000 750 50  0001 C CNN
	1    11000 750 
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F7
U 1 1 63104A41
P 11100 950
F 0 "F7" H 11160 996 50  0000 L CNN
F 1 "BSMD1206-100-16V" H 11160 905 50  0000 L CNN
F 2 "Fuse:Fuse_1206_3216Metric" V 11030 950 50  0001 C CNN
F 3 "~" H 11100 950 50  0001 C CNN
F 4 "C883131" H 0   0   50  0001 C CNN "LCSC"
	1    11100 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F6
U 1 1 631A157B
P 11000 1300
F 0 "F6" H 11060 1346 50  0000 L CNN
F 1 "BSMD1206-100-16V" H 11060 1255 50  0000 L CNN
F 2 "Fuse:Fuse_1206_3216Metric" V 10930 1300 50  0001 C CNN
F 3 "~" H 11000 1300 50  0001 C CNN
F 4 "C883131" H 0   0   50  0001 C CNN "LCSC"
	1    11000 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 750  11100 750 
Wire Wire Line
	11100 750  11100 800 
Wire Wire Line
	11100 1100 11100 1250
Wire Wire Line
	11000 1150 11000 750 
Connection ~ 11000 750 
Wire Wire Line
	11000 1450 11000 1850
Wire Wire Line
	11000 1850 11250 1850
$Comp
L power:+12V #PWR0113
U 1 1 620FF785
P 450 6950
F 0 "#PWR0113" H 450 6800 50  0001 C CNN
F 1 "+12V" H 465 7123 50  0000 C CNN
F 2 "" H 450 6950 50  0001 C CNN
F 3 "" H 450 6950 50  0001 C CNN
	1    450  6950
	1    0    0    -1  
$EndComp
Connection ~ 10100 10300
Wire Wire Line
	10100 10000 10100 10200
Connection ~ 8650 10300
Wire Wire Line
	8650 10000 8650 10200
Wire Wire Line
	6350 8950 7100 8950
$Comp
L Mechanical:MountingHole H2
U 1 1 615435D2
P 12850 1250
F 0 "H2" H 12950 1296 50  0000 L CNN
F 1 "MountingHole" H 12950 1205 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 12850 1250 50  0001 C CNN
F 3 "~" H 12850 1250 50  0001 C CNN
	1    12850 1250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 615BC407
P 12800 1600
F 0 "H3" H 12900 1646 50  0000 L CNN
F 1 "MountingHole" H 12900 1555 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 12800 1600 50  0001 C CNN
F 3 "~" H 12800 1600 50  0001 C CNN
	1    12800 1600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 61635269
P 12800 1900
F 0 "H4" H 12900 1946 50  0000 L CNN
F 1 "MountingHole" H 12900 1855 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4" H 12800 1900 50  0001 C CNN
F 3 "~" H 12800 1900 50  0001 C CNN
	1    12800 1900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H5
U 1 1 61726FED
P 12500 2100
F 0 "H5" H 12600 2146 50  0000 L CNN
F 1 "MountingHole" H 12600 2055 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4_DIN965_Pad" H 12500 2100 50  0001 C CNN
F 3 "~" H 12500 2100 50  0001 C CNN
	1    12500 2100
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N5819 D11
U 1 1 6160AC8E
P 10350 2550
F 0 "D11" V 10304 2630 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10395 2630 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10350 2375 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10350 2550 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10350 2550
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5819 D12
U 1 1 61683CBA
P 10450 2650
F 0 "D12" V 10404 2730 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10495 2730 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10450 2475 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10450 2650 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10450 2650
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5819 D13
U 1 1 616FCB78
P 10550 2700
F 0 "D13" V 10504 2780 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10595 2780 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10550 2525 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10550 2700 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10550 2700
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5819 D14
U 1 1 617759B7
P 10650 2800
F 0 "D14" V 10604 2880 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10695 2880 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10650 2625 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10650 2800 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10650 2800
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5819 D15
U 1 1 617EE822
P 10750 2850
F 0 "D15" V 10704 2930 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10795 2930 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10750 2675 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10750 2850 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10750 2850
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5819 D16
U 1 1 61959D84
P 10850 2950
F 0 "D16" V 10804 3030 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10895 3030 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10850 2775 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10850 2950 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10850 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	11250 2150 10850 2150
Wire Wire Line
	10350 2150 10350 2400
Wire Wire Line
	10350 2700 10350 3050
Wire Wire Line
	10350 3050 9800 3050
Connection ~ 9800 3050
Wire Wire Line
	9800 3150 10450 3150
Wire Wire Line
	10450 3150 10450 2800
Connection ~ 9800 3150
Wire Wire Line
	9800 3250 10550 3250
Wire Wire Line
	10550 3250 10550 2850
Connection ~ 9800 3250
Wire Wire Line
	9800 3350 10650 3350
Wire Wire Line
	10650 3350 10650 2950
Connection ~ 9800 3350
Wire Wire Line
	9800 3450 10750 3450
Wire Wire Line
	10750 3450 10750 3000
Connection ~ 9800 3450
Wire Wire Line
	9800 3550 10850 3550
Wire Wire Line
	10850 3550 10850 3100
Connection ~ 9800 3550
Wire Wire Line
	10450 2500 10450 2150
Connection ~ 10450 2150
Wire Wire Line
	10450 2150 10350 2150
Wire Wire Line
	10550 2550 10550 2150
Connection ~ 10550 2150
Wire Wire Line
	10550 2150 10450 2150
Wire Wire Line
	10650 2650 10650 2150
Connection ~ 10650 2150
Wire Wire Line
	10650 2150 10550 2150
Wire Wire Line
	10750 2700 10750 2150
Connection ~ 10750 2150
Wire Wire Line
	10750 2150 10650 2150
Wire Wire Line
	10850 2800 10850 2150
Connection ~ 10850 2150
Wire Wire Line
	10850 2150 10750 2150
$Comp
L Diode:1N5819 D1
U 1 1 61FBE2B2
P 10300 950
F 0 "D1" V 10254 1030 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10345 1030 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10300 775 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10300 950 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10300 950 
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N5819 D6
U 1 1 6213FD55
P 10300 1050
F 0 "D6" V 10254 1130 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10345 1130 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10300 875 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10300 1050 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10300 1050
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N5819 D7
U 1 1 621BFC0C
P 10300 1150
F 0 "D7" V 10254 1230 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10345 1230 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10300 975 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10300 1150 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10300 1150
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N5819 D8
U 1 1 6223FA9C
P 10300 1250
F 0 "D8" V 10254 1330 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10345 1330 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10300 1075 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10300 1250 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10300 1250
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N5819 D9
U 1 1 622BFA86
P 10300 1350
F 0 "D9" V 10254 1430 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10345 1430 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10300 1175 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10300 1350 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10300 1350
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N5819 D10
U 1 1 6233F95A
P 10300 1450
F 0 "D10" V 10254 1530 50  0000 L CNN
F 1 "1N5819HW-7-F" V 10345 1530 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 10300 1275 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811121309_Diodes-Incorporated-1N5819HW-7-F_C82544.pdf" H 10300 1450 50  0001 C CNN
F 4 "C2891704" H 0   0   50  0001 C CNN "LCSC"
	1    10300 1450
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 950  10150 950 
Connection ~ 9700 950 
Wire Wire Line
	10150 1050 9700 1050
Connection ~ 9700 1050
Wire Wire Line
	9700 1150 10150 1150
Connection ~ 9700 1150
Wire Wire Line
	10150 1250 9700 1250
Connection ~ 9700 1250
Wire Wire Line
	9700 1350 10150 1350
Connection ~ 9700 1350
Wire Wire Line
	9500 1450 9700 1450
Connection ~ 9700 1450
Wire Wire Line
	9700 1450 10150 1450
Wire Wire Line
	10450 1450 10450 1350
Connection ~ 10450 1050
Wire Wire Line
	10450 1050 10450 950 
Connection ~ 10450 1150
Wire Wire Line
	10450 1150 10450 1050
Connection ~ 10450 1250
Wire Wire Line
	10450 1250 10450 1150
Connection ~ 10450 1350
Wire Wire Line
	10450 1350 10450 1250
Wire Wire Line
	11100 1250 10450 1250
$Comp
L Connector_Generic:Conn_01x03 HEAT_SENSE1
U 1 1 626AD580
P 4650 7150
F 0 "HEAT_SENSE1" H 4730 7192 50  0000 L CNN
F 1 "JST_XH-A-1x03" H 4730 7101 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 4650 7150 50  0001 C CNN
F 3 "~" H 4650 7150 50  0001 C CNN
F 4 "C144394" H 0   0   50  0001 C CNN "LCSC"
	1    4650 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0165
U 1 1 6273FEE3
P 4400 6650
F 0 "#PWR0165" H 4400 6500 50  0001 C CNN
F 1 "+5V" H 4415 6823 50  0000 C CNN
F 2 "" H 4400 6650 50  0001 C CNN
F 3 "" H 4400 6650 50  0001 C CNN
	1    4400 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 6650 4450 6650
Wire Wire Line
	4450 6650 4450 7050
$Comp
L Device:R R14
U 1 1 627D51D5
P 4250 6850
F 0 "R14" V 4457 6850 50  0000 C CNN
F 1 "4.7k-0.25W" V 4366 6850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4180 6850 50  0001 C CNN
F 3 "~" H 4250 6850 50  0001 C CNN
F 4 "C17936" H 0   0   50  0001 C CNN "LCSC"
	1    4250 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0168
U 1 1 62868C8C
P 4450 7250
F 0 "#PWR0168" H 4450 7000 50  0001 C CNN
F 1 "GND" H 4455 7077 50  0000 C CNN
F 2 "" H 4450 7250 50  0001 C CNN
F 3 "" H 4450 7250 50  0001 C CNN
	1    4450 7250
	1    0    0    -1  
$EndComp
Text Label 4050 7150 0    50   ~ 10
temp_bus
Wire Wire Line
	4050 7150 4250 7150
Wire Wire Line
	4250 7000 4250 7150
Connection ~ 4250 7150
Wire Wire Line
	4250 7150 4450 7150
Wire Wire Line
	4250 6700 4250 6650
Wire Wire Line
	4250 6650 4400 6650
Connection ~ 4400 6650
NoConn ~ 15100 1550
NoConn ~ 15100 1450
Wire Wire Line
	14550 2550 14600 2550
Wire Wire Line
	15200 2550 15100 2550
Wire Wire Line
	15550 2350 15100 2350
Text GLabel 15550 2350 2    50   Input ~ 10
A12
Text GLabel 15550 2450 2    50   Input ~ 10
A14
Wire Wire Line
	15550 2450 15100 2450
Text GLabel 14150 1750 0    50   Input ~ 10
D35
Text GLabel 14150 2350 0    50   Input ~ 10
A11
Text GLabel 14150 2450 0    50   Input ~ 10
A13
$Comp
L power:GND #PWR0121
U 1 1 6C70D94B
P 15200 2550
F 0 "#PWR0121" H 15200 2300 50  0001 C CNN
F 1 "GND" H 15205 2377 50  0000 C CNN
F 2 "" H 15200 2550 50  0001 C CNN
F 3 "" H 15200 2550 50  0001 C CNN
	1    15200 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 6B783A5C
P 14550 2550
F 0 "#PWR0120" H 14550 2300 50  0001 C CNN
F 1 "GND" H 14555 2377 50  0000 C CNN
F 2 "" H 14550 2550 50  0001 C CNN
F 3 "" H 14550 2550 50  0001 C CNN
	1    14550 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0119
U 1 1 6B477B52
P 14300 1550
F 0 "#PWR0119" H 14300 1400 50  0001 C CNN
F 1 "+3.3V" H 14315 1723 50  0000 C CNN
F 2 "" H 14300 1550 50  0001 C CNN
F 3 "" H 14300 1550 50  0001 C CNN
	1    14300 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0118
U 1 1 6B477B4C
P 14450 1450
F 0 "#PWR0118" H 14450 1300 50  0001 C CNN
F 1 "+5V" H 14465 1623 50  0000 C CNN
F 2 "" H 14450 1450 50  0001 C CNN
F 3 "" H 14450 1450 50  0001 C CNN
	1    14450 1450
	1    0    0    -1  
$EndComp
Text GLabel 14150 1850 0    50   Input ~ 10
D13
Wire Wire Line
	14600 2350 14150 2350
Wire Wire Line
	14600 2450 14150 2450
Wire Wire Line
	14450 1450 14600 1450
Wire Wire Line
	14300 1550 14600 1550
Wire Wire Line
	14600 1850 14150 1850
Wire Wire Line
	14600 1750 14150 1750
Wire Wire Line
	6400 10500 6600 10500
Connection ~ 6400 10500
Wire Wire Line
	6400 10200 6400 10000
Wire Wire Line
	6400 10000 6550 10000
Connection ~ 6550 10000
Wire Wire Line
	6600 10600 6600 10700
Connection ~ 6600 10700
Wire Wire Line
	6600 10700 6600 10800
Text Notes 6350 2950 0    50   ~ 0
selected - 0V\n
Text Notes 8500 2650 0    50   ~ 0
selected-5V
Text Notes 10200 3800 0    50   ~ 0
selected-0V - ON
Text Notes 9600 9350 0    50   ~ 0
output -high -> BC547-short -> IRF540 -open -> OFF
Text Label 15200 2450 0    50   ~ 10
heat1
Text Label 14200 2450 0    50   ~ 10
heat2
Text Label 15250 2250 0    50   ~ 10
heat5
Text Label 14200 1650 0    50   ~ 10
aux_temp
$Comp
L KBP206G:KBP206G BR1
U 1 1 61535737
P 1350 9750
F 0 "BR1" V 1738 9322 50  0000 R CNN
F 1 "KBP206G" V 1647 9322 50  0000 R CNN
F 2 "footprints:KBP206G" H 2100 9850 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds21205.pdf" H 2100 9750 50  0001 L CNN
F 4 "Diodes Inc KBP206G, Bridge Rectifier, 2A 600V, 4-Pin KBP" H 2100 9650 50  0001 L CNN "Description"
F 5 "Diodes Inc." H 2100 9450 50  0001 L CNN "Manufacturer_Name"
F 6 "KBP206G" H 2100 9350 50  0001 L CNN "Manufacturer_Part_Number"
F 7 "621-KBP206G" H 2100 9250 50  0001 L CNN "Mouser Part Number"
F 8 "https://www.mouser.co.uk/ProductDetail/Diodes-Incorporated/KBP206G?qs=zpnZCIghiEzeMWPzAF%2FQmA%3D%3D" H 2100 9150 50  0001 L CNN "Mouser Price/Stock"
F 9 "KBP206G" H 2100 9050 50  0001 L CNN "Arrow Part Number"
F 10 "https://www.arrow.com/en/products/kbp206g/diodes-incorporated?region=europe" H 2100 8950 50  0001 L CNN "Arrow Price/Stock"
F 11 "C244328" H 0   0   50  0001 C CNN "LCSC"
	1    1350 9750
	0    -1   -1   0   
$EndComp
Connection ~ 4700 8550
Wire Wire Line
	4800 8550 4700 8550
Wire Wire Line
	4800 8250 4800 8550
Connection ~ 4900 8450
Wire Wire Line
	4200 8350 4900 8350
Wire Wire Line
	4900 8350 4900 8450
Wire Wire Line
	4200 8450 4900 8450
Wire Wire Line
	4700 8650 4700 8550
Wire Wire Line
	4200 8650 4700 8650
Text Label 950  8650 0    50   ~ 10
cancel
Text Label 1400 8250 2    50   ~ 10
UI_Control
Wire Wire Line
	1400 8250 950  8250
Wire Wire Line
	4200 8250 4800 8250
$Comp
L power:GND #PWR0127
U 1 1 654CBB09
P 4900 8450
F 0 "#PWR0127" H 4900 8200 50  0001 C CNN
F 1 "GND" H 4905 8277 50  0000 C CNN
F 2 "" H 4900 8450 50  0001 C CNN
F 3 "" H 4900 8450 50  0001 C CNN
	1    4900 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 8550 4700 8550
$Comp
L 2021-11-07_07-37-06:TLC7528CDW PANEL_DECODE1
U 1 1 654CBAF2
P 1400 7950
F 0 "PANEL_DECODE1" H 2500 8337 60  0000 C CNN
F 1 "TLC7528" H 2500 8231 60  0000 C CNN
F 2 "footprints:TLC7528CDW" H 2500 8190 60  0001 C CNN
F 3 "" H 1400 7950 60  0000 C CNN
F 4 "C11359" H 0   0   50  0001 C CNN "LCSC"
	1    1400 7950
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  8650 1400 8650
Wire Wire Line
	4800 7950 4800 8250
Connection ~ 4800 8250
Wire Wire Line
	1400 8450 850  8450
Wire Wire Line
	850  8450 850  8350
Connection ~ 850  8450
Connection ~ 850  8350
Wire Wire Line
	1400 7950 850  7950
$Comp
L power:+5V #PWR0129
U 1 1 61E53512
P 1250 7900
F 0 "#PWR0129" H 1250 7750 50  0001 C CNN
F 1 "+5V" H 1265 8073 50  0000 C CNN
F 2 "" H 1250 7900 50  0001 C CNN
F 3 "" H 1250 7900 50  0001 C CNN
	1    1250 7900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 8050 1250 8050
Wire Wire Line
	1250 8050 1250 7900
Wire Wire Line
	850  7950 850  8350
$Comp
L power:+5V #PWR0130
U 1 1 622CF547
P 4800 7950
F 0 "#PWR0130" H 4800 7800 50  0001 C CNN
F 1 "+5V" H 4815 8123 50  0000 C CNN
F 2 "" H 4800 7950 50  0001 C CNN
F 3 "" H 4800 7950 50  0001 C CNN
	1    4800 7950
	1    0    0    -1  
$EndComp
Text Label 4650 8150 2    50   ~ 10
UI_Control2
Wire Wire Line
	4650 8150 4200 8150
Wire Wire Line
	4200 7950 4800 7950
Connection ~ 4800 7950
Wire Wire Line
	4650 8750 4200 8750
Text Label 4650 8750 2    50   ~ 10
Dpad_right
$Comp
L Transistor_FET:IRF540N Q33
U 1 1 630C81DE
P 6500 7800
F 0 "Q33" H 6704 7846 50  0000 L CNN
F 1 "IRF510PBF" H 6704 7755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6750 7725 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 6500 7800 50  0001 L CNN
F 4 "C727603" H 0   0   50  0001 C CNN "LCSC"
	1    6500 7800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 6335A349
P 6600 8000
F 0 "#PWR0131" H 6600 7750 50  0001 C CNN
F 1 "GND" H 6605 7827 50  0000 C CNN
F 2 "" H 6600 8000 50  0001 C CNN
F 3 "" H 6600 8000 50  0001 C CNN
	1    6600 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 8000 7000 8000
$Comp
L Device:R R16
U 1 1 635482C9
P 6500 7400
F 0 "R16" V 6707 7400 50  0000 C CNN
F 1 "10k-0.25W" V 6616 7400 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6430 7400 50  0001 C CNN
F 3 "~" H 6500 7400 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6500 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	11250 1850 11250 2150
Wire Wire Line
	11300 1850 11250 1850
Connection ~ 11250 1850
Wire Wire Line
	11300 1250 11100 1250
Wire Wire Line
	11300 1250 11300 1750
Connection ~ 11100 1250
Wire Wire Line
	12700 650  12700 750 
$Comp
L Device:R R50
U 1 1 64FB329E
P 5350 8700
F 0 "R50" V 5557 8700 50  0000 C CNN
F 1 "10k-0.25W" V 5466 8700 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5280 8700 50  0001 C CNN
F 3 "~" H 5350 8700 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    5350 8700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R52
U 1 1 6512C1B1
P 6950 8700
F 0 "R52" V 7157 8700 50  0000 C CNN
F 1 "10k-0.25W" V 7066 8700 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6880 8700 50  0001 C CNN
F 3 "~" H 6950 8700 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    6950 8700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R54
U 1 1 651E8B89
P 7100 8800
F 0 "R54" V 7307 8800 50  0000 C CNN
F 1 "10k-0.25W" V 7216 8800 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7030 8800 50  0001 C CNN
F 3 "~" H 7100 8800 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    7100 8800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R40
U 1 1 6541E9AB
P 5150 8850
F 0 "R40" V 5357 8850 50  0000 C CNN
F 1 "10k-0.25W" V 5266 8850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5080 8850 50  0001 C CNN
F 3 "~" H 5150 8850 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    5150 8850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R49
U 1 1 6541E9B1
P 5250 8800
F 0 "R49" V 5457 8800 50  0000 C CNN
F 1 "10k-0.25W" V 5366 8800 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5180 8800 50  0001 C CNN
F 3 "~" H 5250 8800 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    5250 8800
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D18
U 1 1 672337E8
P 12850 3650
F 0 "D18" V 12804 3730 50  0000 L CNN
F 1 "MM1Z7V5" V 12895 3730 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 12850 3650 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1810241824_ST-Semtech-MM1Z12_C86234.pdf" H 12850 3650 50  0001 C CNN
F 4 "C87634" V 12850 3650 50  0001 C CNN "LCSC"
	1    12850 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R87
U 1 1 67D3F915
P 12650 3950
F 0 "R87" H 12720 3996 50  0000 L CNN
F 1 "10k-0.25W" H 12720 3905 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 12580 3950 50  0001 C CNN
F 3 "~" H 12650 3950 50  0001 C CNN
F 4 "C17902" H -5400 400 50  0001 C CNN "LCSC"
	1    12650 3950
	1    0    0    -1  
$EndComp
Text GLabel 12050 3500 0    50   Input ~ 0
PSU_VIN
Text GLabel 12100 4100 0    50   Input ~ 0
PSU_5VGND
Text GLabel 2250 6100 0    50   Input ~ 0
PSU_5VGND
Text GLabel 2250 6000 0    50   Input ~ 0
PSU_VIN
Connection ~ 12650 4100
Connection ~ 12650 3800
Wire Wire Line
	12650 3800 12850 3800
$Comp
L power:GND #PWR0187
U 1 1 69C84747
P 15200 4100
F 0 "#PWR0187" H 15200 3850 50  0001 C CNN
F 1 "GND" H 15205 3927 50  0000 C CNN
F 2 "" H 15200 4100 50  0001 C CNN
F 3 "" H 15200 4100 50  0001 C CNN
	1    15200 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R86
U 1 1 69C84759
P 14800 3950
F 0 "R86" H 14870 3996 50  0000 L CNN
F 1 "10k-0.25W" H 14870 3905 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 14730 3950 50  0001 C CNN
F 3 "~" H 14800 3950 50  0001 C CNN
F 4 "C17902" H -3100 -650 50  0001 C CNN "LCSC"
	1    14800 3950
	1    0    0    -1  
$EndComp
Text GLabel 14300 3500 0    50   Input ~ 0
PSU_12V+
Text GLabel 14350 4100 0    50   Input ~ 0
PSU_12VGND
Connection ~ 14800 4100
Wire Wire Line
	14800 4100 15200 4100
Wire Wire Line
	14650 3800 14800 3800
Connection ~ 14800 3800
Wire Wire Line
	14800 3800 15050 3800
Wire Wire Line
	14300 3500 14400 3500
Connection ~ 15050 3500
$Comp
L Device:D_Zener D17
U 1 1 69C84753
P 15050 3650
F 0 "D17" V 15004 3730 50  0000 L CNN
F 1 "MM1Z12" V 15095 3730 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 15050 3650 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1810241824_ST-Semtech-MM1Z12_C86234.pdf" H 15050 3650 50  0001 C CNN
F 4 "C86234" H -3100 -650 50  0001 C CNN "LCSC"
	1    15050 3650
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR0188
U 1 1 69FC4334
P 15650 3500
F 0 "#PWR0188" H 15650 3350 50  0001 C CNN
F 1 "+12V" H 15665 3673 50  0000 C CNN
F 2 "" H 15650 3500 50  0001 C CNN
F 3 "" H 15650 3500 50  0001 C CNN
	1    15650 3500
	1    0    0    -1  
$EndComp
Text GLabel 1650 7250 0    50   Input ~ 0
PSU_12V+
Text GLabel 1650 7350 0    50   Input ~ 0
PSU_12VGND
$Comp
L Connector_Generic:Conn_01x02 PSU_12V1
U 1 1 646AF967
P 1850 7250
F 0 "PSU_12V1" H 1930 7242 50  0000 L CNN
F 1 "WJ128V-5.0-2P" H 1930 7151 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 1850 7250 50  0001 C CNN
F 3 "~" H 1850 7250 50  0001 C CNN
F 4 "C8269" H 0   0   50  0001 C CNN "LCSC"
	1    1850 7250
	1    0    0    -1  
$EndComp
Text Notes 12400 2800 0    50   ~ 0
if Gnd and V+ is swapped\nvolt drop across Zener is 0.7, \nthen Vgs>-1, thus fet is off\nand disconnect SU input\n
Text Notes 15100 5400 0    50   ~ 0
if 12V is swapped, both protection disconnect from PSU\nif 12V is not swaped, but 5V swapped,\nthen, GND is grounded by 12V PSU, \nand 5V PSU, push input to -5V at drain\nassume fet is on, then source short to drain, \nand make source -5V, which turn off the fet\nThus when only -5V is reversed, the connection to PSU is opened\n
$Comp
L Connector_Generic:Conn_01x04 I2C_TANK1
U 1 1 646DF242
P 6700 5700
F 0 "I2C_TANK1" H 6780 5692 50  0000 L CNN
F 1 "Conn_01x04" H 6780 5601 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 6700 5700 50  0001 C CNN
F 3 "~" H 6700 5700 50  0001 C CNN
F 4 "C2718488" H 0   0   50  0001 C CNN "LCSC"
	1    6700 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 I2C_CP8000
U 1 1 64A43F5B
P 5200 5700
F 0 "I2C_CP8000" H 5280 5692 50  0000 L CNN
F 1 "Conn_01x04" H 5280 5601 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 5200 5700 50  0001 C CNN
F 3 "~" H 5200 5700 50  0001 C CNN
F 4 "C2718488" H 0   0   50  0001 C CNN "LCSC"
	1    5200 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 PSU_5V1
U 1 1 646AF4B2
P 3650 6050
F 0 "PSU_5V1" H 3730 6042 50  0000 L CNN
F 1 "Conn_01x02" H 3730 5951 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 3650 6050 50  0001 C CNN
F 3 "~" H 3650 6050 50  0001 C CNN
F 4 "C49661" H 0   0   50  0001 C CNN "LCSC"
	1    3650 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 1500 6400 1500
Wire Wire Line
	6400 1500 6400 1400
Wire Wire Line
	6400 1500 7050 1500
Wire Wire Line
	7050 1500 7050 1300
Connection ~ 6400 1500
Wire Wire Line
	6250 1600 6500 1600
Wire Wire Line
	6500 1600 6500 1400
Wire Wire Line
	6250 1700 6600 1700
Wire Wire Line
	6600 1700 6600 1400
Wire Wire Line
	6500 1600 7250 1600
Connection ~ 6500 1600
Wire Wire Line
	6600 1700 7450 1700
Connection ~ 6600 1700
Wire Wire Line
	6150 3600 6250 3600
Wire Wire Line
	6250 3600 6250 3500
Wire Wire Line
	6150 3700 6350 3700
Wire Wire Line
	6350 3700 6350 3500
Wire Wire Line
	6150 3800 6450 3800
Wire Wire Line
	6450 3800 6450 3500
Wire Wire Line
	6250 3600 7150 3600
Connection ~ 6250 3600
Wire Wire Line
	7350 3700 6350 3700
Connection ~ 6350 3700
Wire Wire Line
	6450 3800 7550 3800
Connection ~ 6450 3800
Connection ~ 11600 10300
Wire Wire Line
	11600 10100 11600 10200
$Comp
L Connector_Generic:Conn_01x02 REMOVE_PUMP1
U 1 1 63F2896C
P 11800 10200
F 0 "REMOVE_PUMP1" H 11880 10192 50  0000 L CNN
F 1 "WJ128V-5.0-2P" H 11880 10101 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 11800 10200 50  0001 C CNN
F 3 "~" H 11800 10200 50  0001 C CNN
F 4 "C8269" H 0   0   50  0001 C CNN "LCSC"
	1    11800 10200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R51
U 1 1 6506F9FB
P 5050 9000
F 0 "R51" V 5257 9000 50  0000 C CNN
F 1 "10k-0.25W" V 5166 9000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4980 9000 50  0001 C CNN
F 3 "~" H 5050 9000 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    5050 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 9050 5400 9050
Wire Wire Line
	5050 9150 5850 9150
Wire Wire Line
	5150 9000 5400 9000
Wire Wire Line
	5400 9000 5400 9050
Wire Wire Line
	5250 8950 5850 8950
Wire Wire Line
	5350 8850 5850 8850
Wire Wire Line
	5600 8750 5600 8550
Wire Wire Line
	5600 8550 5350 8550
Connection ~ 5600 8750
Wire Wire Line
	5350 8550 5250 8550
Wire Wire Line
	5250 8550 5250 8650
Connection ~ 5350 8550
Wire Wire Line
	5150 8700 5050 8700
Wire Wire Line
	5050 8700 5050 8850
Wire Wire Line
	5150 8700 5250 8700
Wire Wire Line
	5250 8700 5250 8650
Connection ~ 5150 8700
Connection ~ 5250 8650
Wire Wire Line
	5600 8550 6950 8550
Connection ~ 5600 8550
Wire Wire Line
	6950 8550 7100 8550
Wire Wire Line
	7100 8550 7100 8650
Connection ~ 6950 8550
Wire Wire Line
	6350 8850 6950 8850
$Comp
L Device:R R88
U 1 1 650073B4
P 7250 8900
F 0 "R88" V 7457 8900 50  0000 C CNN
F 1 "10k-0.25W" V 7366 8900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7180 8900 50  0001 C CNN
F 3 "~" H 7250 8900 50  0001 C CNN
F 4 "C17902" H 0   0   50  0001 C CNN "LCSC"
	1    7250 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 9050 7250 9050
Wire Wire Line
	7250 8750 7250 8550
Wire Wire Line
	7250 8550 7100 8550
Connection ~ 7100 8550
Wire Wire Line
	6600 8000 6300 8000
Wire Wire Line
	6300 8000 6300 7900
Connection ~ 6600 8000
Wire Wire Line
	6500 7250 6500 7000
Wire Wire Line
	6500 7000 6700 7000
Connection ~ 6700 7000
Wire Wire Line
	6700 7000 6700 6950
Wire Wire Line
	6500 7550 6500 7600
Wire Wire Line
	6500 7600 6500 7850
Wire Wire Line
	6500 7850 6600 7850
Connection ~ 6500 7600
Wire Wire Line
	6450 7600 6500 7600
Text Label 2750 10750 2    50   ~ 0
5V+in
Text Label 2200 10050 2    50   ~ 0
5V+in
Wire Wire Line
	15100 1650 15550 1650
Text GLabel 15550 1650 2    50   Input ~ 10
D32
Wire Wire Line
	15100 1750 15550 1750
Text GLabel 15550 1750 2    50   Input ~ 10
D34
$Comp
L Connector_Generic:Conn_01x02 I2CA1
U 1 1 6256412B
P 5200 5600
F 0 "I2CA1" H 5280 5592 50  0000 L CNN
F 1 "Conn_01x02" H 5280 5501 50  0000 L CNN
F 2 "" H 5200 5600 50  0001 C CNN
F 3 "~" H 5200 5600 50  0001 C CNN
	1    5200 5600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 I2CB1
U 1 1 625FAE8C
P 5200 5800
F 0 "I2CB1" H 5280 5792 50  0000 L CNN
F 1 "Conn_01x02" H 5280 5701 50  0000 L CNN
F 2 "" H 5200 5800 50  0001 C CNN
F 3 "~" H 5200 5800 50  0001 C CNN
	1    5200 5800
	1    0    0    -1  
$EndComp
Connection ~ 5000 5800
Connection ~ 5000 5900
Connection ~ 5000 5600
Connection ~ 5000 5700
$Comp
L Connector_Generic:Conn_01x02 I2CTA1
U 1 1 628F40AE
P 6700 5600
F 0 "I2CTA1" H 6780 5592 50  0000 L CNN
F 1 "Conn_01x02" H 6780 5501 50  0000 L CNN
F 2 "" H 6700 5600 50  0001 C CNN
F 3 "~" H 6700 5600 50  0001 C CNN
	1    6700 5600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 I2CTB1
U 1 1 6298B243
P 6700 5800
F 0 "I2CTB1" H 6780 5792 50  0000 L CNN
F 1 "Conn_01x02" H 6780 5701 50  0000 L CNN
F 2 "" H 6700 5800 50  0001 C CNN
F 3 "~" H 6700 5800 50  0001 C CNN
	1    6700 5800
	1    0    0    -1  
$EndComp
Connection ~ 6500 5600
Connection ~ 6500 5700
Connection ~ 6500 5800
Connection ~ 6500 5900
$Comp
L Connector_Generic:Conn_01x02 MEGA39
U 1 1 62B50236
P 3600 600
F 0 "MEGA39" H 3680 592 50  0000 L CNN
F 1 "Conn_01x02" H 3680 501 50  0000 L CNN
F 2 "" H 3600 600 50  0001 C CNN
F 3 "~" H 3600 600 50  0001 C CNN
	1    3600 600 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA40
U 1 1 62EE07D0
P 3300 700
F 0 "MEGA40" H 3380 692 50  0000 L CNN
F 1 "Conn_01x02" H 3380 601 50  0000 L CNN
F 2 "" H 3300 700 50  0001 C CNN
F 3 "~" H 3300 700 50  0001 C CNN
	1    3300 700 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA41
U 1 1 62F78185
P 3000 800
F 0 "MEGA41" H 3080 792 50  0000 L CNN
F 1 "Conn_01x02" H 3080 701 50  0000 L CNN
F 2 "" H 3000 800 50  0001 C CNN
F 3 "~" H 3000 800 50  0001 C CNN
	1    3000 800 
	0    -1   -1   0   
$EndComp
Connection ~ 2900 900 
$Comp
L Connector_Generic:Conn_01x02 MEGA42
U 1 1 6314516D
P 2800 5400
F 0 "MEGA42" H 2880 5392 50  0000 L CNN
F 1 "Conn_01x02" H 2880 5301 50  0000 L CNN
F 2 "" H 2800 5400 50  0001 C CNN
F 3 "~" H 2800 5400 50  0001 C CNN
	1    2800 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2800 5600 2900 5600
Connection ~ 2900 5600
$Comp
L Connector_Generic:Conn_01x02 MEGA22
U 1 1 6327A12E
P 2150 1000
F 0 "MEGA22" H 2230 992 50  0000 L CNN
F 1 "Conn_01x02" H 2230 901 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 2150 1000 50  0001 C CNN
F 3 "~" H 2150 1000 50  0001 C CNN
	1    2150 1000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2150 1200 1500 1200
Connection ~ 1500 1200
$Comp
L Connector_Generic:Conn_01x02 MEGA3
U 1 1 63E0C735
P 1800 1900
F 0 "MEGA3" H 1880 1892 50  0000 L CNN
F 1 "Conn_01x02" H 1880 1801 50  0000 L CNN
F 2 "" H 1800 1900 50  0001 C CNN
F 3 "~" H 1800 1900 50  0001 C CNN
	1    1800 1900
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA4
U 1 1 63EA6CD9
P 1850 2000
F 0 "MEGA4" H 1930 1992 50  0000 L CNN
F 1 "Conn_01x02" H 1930 1901 50  0000 L CNN
F 2 "" H 1850 2000 50  0001 C CNN
F 3 "~" H 1850 2000 50  0001 C CNN
	1    1850 2000
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA9
U 1 1 63F4114C
P 1950 2100
F 0 "MEGA9" H 2030 2092 50  0000 L CNN
F 1 "Conn_01x02" H 2030 2001 50  0000 L CNN
F 2 "" H 1950 2100 50  0001 C CNN
F 3 "~" H 1950 2100 50  0001 C CNN
	1    1950 2100
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA12
U 1 1 63FDBE0C
P 2000 2200
F 0 "MEGA12" H 2080 2192 50  0000 L CNN
F 1 "Conn_01x02" H 2080 2101 50  0000 L CNN
F 2 "" H 2000 2200 50  0001 C CNN
F 3 "~" H 2000 2200 50  0001 C CNN
	1    2000 2200
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA16
U 1 1 640762C5
P 2050 2300
F 0 "MEGA16" H 2130 2292 50  0000 L CNN
F 1 "Conn_01x02" H 2130 2201 50  0000 L CNN
F 2 "" H 2050 2300 50  0001 C CNN
F 3 "~" H 2050 2300 50  0001 C CNN
	1    2050 2300
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA19
U 1 1 641106A7
P 2100 2400
F 0 "MEGA19" H 2180 2392 50  0000 L CNN
F 1 "Conn_01x02" H 2180 2301 50  0000 L CNN
F 2 "" H 2100 2400 50  0001 C CNN
F 3 "~" H 2100 2400 50  0001 C CNN
	1    2100 2400
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA23
U 1 1 641AAADE
P 2150 2500
F 0 "MEGA23" H 2230 2492 50  0000 L CNN
F 1 "Conn_01x02" H 2230 2401 50  0000 L CNN
F 2 "" H 2150 2500 50  0001 C CNN
F 3 "~" H 2150 2500 50  0001 C CNN
	1    2150 2500
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA26
U 1 1 64244EE3
P 2200 2600
F 0 "MEGA26" H 2280 2592 50  0000 L CNN
F 1 "Conn_01x02" H 2280 2501 50  0000 L CNN
F 2 "" H 2200 2600 50  0001 C CNN
F 3 "~" H 2200 2600 50  0001 C CNN
	1    2200 2600
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA29
U 1 1 642DF383
P 2250 2700
F 0 "MEGA29" H 2330 2692 50  0000 L CNN
F 1 "Conn_01x02" H 2330 2601 50  0000 L CNN
F 2 "" H 2250 2700 50  0001 C CNN
F 3 "~" H 2250 2700 50  0001 C CNN
	1    2250 2700
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA32
U 1 1 643797BF
P 2300 2800
F 0 "MEGA32" H 2380 2792 50  0000 L CNN
F 1 "Conn_01x02" H 2380 2701 50  0000 L CNN
F 2 "" H 2300 2800 50  0001 C CNN
F 3 "~" H 2300 2800 50  0001 C CNN
	1    2300 2800
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA34
U 1 1 64413C78
P 2350 2900
F 0 "MEGA34" H 2430 2892 50  0000 L CNN
F 1 "Conn_01x02" H 2430 2801 50  0000 L CNN
F 2 "" H 2350 2900 50  0001 C CNN
F 3 "~" H 2350 2900 50  0001 C CNN
	1    2350 2900
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA37
U 1 1 644AE190
P 2400 3000
F 0 "MEGA37" H 2480 2992 50  0000 L CNN
F 1 "Conn_01x02" H 2480 2901 50  0000 L CNN
F 2 "" H 2400 3000 50  0001 C CNN
F 3 "~" H 2400 3000 50  0001 C CNN
	1    2400 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 2100 1800 2100
Connection ~ 1500 2100
Wire Wire Line
	1900 2100 2900 2100
Connection ~ 2900 2100
Wire Wire Line
	2900 2100 3650 2100
Wire Wire Line
	2900 2200 1950 2200
Connection ~ 2900 2200
Wire Wire Line
	1850 2200 1500 2200
Connection ~ 1500 2200
Wire Wire Line
	1500 2300 1950 2300
Connection ~ 1500 2300
Wire Wire Line
	1500 2400 2000 2400
Connection ~ 1500 2400
Wire Wire Line
	2050 2500 1500 2500
Connection ~ 1500 2500
Wire Wire Line
	1500 2600 2100 2600
Connection ~ 1500 2600
Wire Wire Line
	2150 2700 1500 2700
Connection ~ 1500 2700
Wire Wire Line
	1500 2800 2200 2800
Connection ~ 1500 2800
Wire Wire Line
	2250 2900 1500 2900
Connection ~ 1500 2900
Wire Wire Line
	1500 3000 2300 3000
Connection ~ 1500 3000
Wire Wire Line
	2350 3100 1500 3100
Connection ~ 1500 3100
Wire Wire Line
	1500 3200 2400 3200
Connection ~ 1500 3200
Wire Wire Line
	2500 3200 2900 3200
Connection ~ 2900 3200
Wire Wire Line
	2900 3100 2450 3100
Connection ~ 2900 3100
Wire Wire Line
	2400 3000 2900 3000
Connection ~ 2900 3000
Wire Wire Line
	2900 2900 2350 2900
Connection ~ 2900 2900
Wire Wire Line
	2300 2800 2900 2800
Connection ~ 2900 2800
Wire Wire Line
	2900 2700 2250 2700
Connection ~ 2900 2700
Wire Wire Line
	2200 2600 2900 2600
Connection ~ 2900 2600
Wire Wire Line
	2900 2500 2150 2500
Connection ~ 2900 2500
Wire Wire Line
	2100 2400 2900 2400
Connection ~ 2900 2400
Wire Wire Line
	2900 2400 3350 2400
Wire Wire Line
	2900 2300 2050 2300
Connection ~ 2900 2300
$Comp
L Connector_Generic:Conn_01x02 MEGA6
U 1 1 654BA2E2
P 1900 3100
F 0 "MEGA6" H 1980 3092 50  0000 L CNN
F 1 "Conn_01x02" H 1980 3001 50  0000 L CNN
F 2 "" H 1900 3100 50  0001 C CNN
F 3 "~" H 1900 3100 50  0001 C CNN
	1    1900 3100
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA10
U 1 1 6556599B
P 1950 3200
F 0 "MEGA10" H 2030 3192 50  0000 L CNN
F 1 "Conn_01x02" H 2030 3101 50  0000 L CNN
F 2 "" H 1950 3200 50  0001 C CNN
F 3 "~" H 1950 3200 50  0001 C CNN
	1    1950 3200
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA13
U 1 1 65610F5A
P 2000 3300
F 0 "MEGA13" H 2080 3292 50  0000 L CNN
F 1 "Conn_01x02" H 2080 3201 50  0000 L CNN
F 2 "" H 2000 3300 50  0001 C CNN
F 3 "~" H 2000 3300 50  0001 C CNN
	1    2000 3300
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA17
U 1 1 656BC52D
P 2050 3400
F 0 "MEGA17" H 2130 3392 50  0000 L CNN
F 1 "Conn_01x02" H 2130 3301 50  0000 L CNN
F 2 "" H 2050 3400 50  0001 C CNN
F 3 "~" H 2050 3400 50  0001 C CNN
	1    2050 3400
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA20
U 1 1 65767998
P 2100 3500
F 0 "MEGA20" H 2180 3492 50  0000 L CNN
F 1 "Conn_01x02" H 2180 3401 50  0000 L CNN
F 2 "" H 2100 3500 50  0001 C CNN
F 3 "~" H 2100 3500 50  0001 C CNN
	1    2100 3500
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA24
U 1 1 65812CA0
P 2150 3600
F 0 "MEGA24" H 2230 3592 50  0000 L CNN
F 1 "Conn_01x02" H 2230 3501 50  0000 L CNN
F 2 "" H 2150 3600 50  0001 C CNN
F 3 "~" H 2150 3600 50  0001 C CNN
	1    2150 3600
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA27
U 1 1 658BDF62
P 2200 3700
F 0 "MEGA27" H 2280 3692 50  0000 L CNN
F 1 "Conn_01x02" H 2280 3601 50  0000 L CNN
F 2 "" H 2200 3700 50  0001 C CNN
F 3 "~" H 2200 3700 50  0001 C CNN
	1    2200 3700
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA30
U 1 1 65969328
P 2250 3800
F 0 "MEGA30" H 2330 3792 50  0000 L CNN
F 1 "Conn_01x02" H 2330 3701 50  0000 L CNN
F 2 "" H 2250 3800 50  0001 C CNN
F 3 "~" H 2250 3800 50  0001 C CNN
	1    2250 3800
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA33
U 1 1 65A1461C
P 2300 3900
F 0 "MEGA33" H 2380 3892 50  0000 L CNN
F 1 "Conn_01x02" H 2380 3801 50  0000 L CNN
F 2 "" H 2300 3900 50  0001 C CNN
F 3 "~" H 2300 3900 50  0001 C CNN
	1    2300 3900
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA35
U 1 1 65ABFA2D
P 2350 4000
F 0 "MEGA35" H 2430 3992 50  0000 L CNN
F 1 "Conn_01x02" H 2430 3901 50  0000 L CNN
F 2 "" H 2350 4000 50  0001 C CNN
F 3 "~" H 2350 4000 50  0001 C CNN
	1    2350 4000
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA38
U 1 1 65B6AD80
P 2400 4100
F 0 "MEGA38" H 2480 4092 50  0000 L CNN
F 1 "Conn_01x02" H 2480 4001 50  0000 L CNN
F 2 "" H 2400 4100 50  0001 C CNN
F 3 "~" H 2400 4100 50  0001 C CNN
	1    2400 4100
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA7
U 1 1 65C16317
P 1900 4200
F 0 "MEGA7" H 1980 4192 50  0000 L CNN
F 1 "Conn_01x02" H 1980 4101 50  0000 L CNN
F 2 "" H 1900 4200 50  0001 C CNN
F 3 "~" H 1900 4200 50  0001 C CNN
	1    1900 4200
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA31
U 1 1 65CC165B
P 2250 4300
F 0 "MEGA31" H 2330 4292 50  0000 L CNN
F 1 "Conn_01x02" H 2330 4201 50  0000 L CNN
F 2 "" H 2250 4300 50  0001 C CNN
F 3 "~" H 2250 4300 50  0001 C CNN
	1    2250 4300
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA14
U 1 1 65D6CEAE
P 2000 4400
F 0 "MEGA14" H 2080 4392 50  0000 L CNN
F 1 "Conn_01x02" H 2080 4301 50  0000 L CNN
F 2 "" H 2000 4400 50  0001 C CNN
F 3 "~" H 2000 4400 50  0001 C CNN
	1    2000 4400
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA36
U 1 1 65E18314
P 2400 1400
F 0 "MEGA36" H 2480 1392 50  0000 L CNN
F 1 "Conn_01x02" H 2480 1301 50  0000 L CNN
F 2 "" H 2400 1400 50  0001 C CNN
F 3 "~" H 2400 1400 50  0001 C CNN
	1    2400 1400
	1    0    0    -1  
$EndComp
Connection ~ 1500 4500
Wire Wire Line
	2350 4500 2900 4500
Connection ~ 2900 4600
Wire Wire Line
	2000 4600 1500 4600
Connection ~ 1500 4600
Wire Wire Line
	2250 1200 2900 1200
Connection ~ 2900 1200
Wire Wire Line
	2900 1200 3500 1200
Wire Wire Line
	2900 3300 2000 3300
Connection ~ 2900 3300
Wire Wire Line
	1900 3300 1500 3300
Connection ~ 1500 3300
Wire Wire Line
	1500 3400 1950 3400
Connection ~ 1500 3400
Wire Wire Line
	2000 3500 1500 3500
Connection ~ 1500 3500
Wire Wire Line
	2050 3400 2900 3400
Connection ~ 2900 3400
Wire Wire Line
	2900 3400 3350 3400
Wire Wire Line
	2900 3500 2100 3500
Connection ~ 2900 3500
Wire Wire Line
	2150 3600 2900 3600
Connection ~ 2900 3600
Wire Wire Line
	2900 3700 2200 3700
Connection ~ 2900 3700
Wire Wire Line
	2250 3800 2900 3800
Connection ~ 2900 3800
Wire Wire Line
	2900 3900 2300 3900
Connection ~ 2900 3900
Wire Wire Line
	2350 4000 2900 4000
Connection ~ 2900 4000
Wire Wire Line
	2900 4100 2400 4100
Connection ~ 2900 4100
Wire Wire Line
	2450 4200 2900 4200
Connection ~ 2900 4200
Wire Wire Line
	2900 4300 2500 4300
Connection ~ 2900 4300
Wire Wire Line
	2400 4300 1500 4300
Connection ~ 1500 4300
Wire Wire Line
	1500 4400 1900 4400
Connection ~ 1500 4400
Wire Wire Line
	2000 4400 2900 4400
Connection ~ 2900 4400
Wire Wire Line
	1500 4200 2350 4200
Connection ~ 1500 4200
Wire Wire Line
	1050 4100 1500 4100
Connection ~ 1500 4100
Wire Wire Line
	1500 4100 2300 4100
Wire Wire Line
	1500 4000 2250 4000
Connection ~ 1500 4000
Wire Wire Line
	2200 3900 1500 3900
Connection ~ 1500 3900
Wire Wire Line
	1500 3800 2150 3800
Connection ~ 1500 3800
Wire Wire Line
	2100 3700 1500 3700
Connection ~ 1500 3700
Wire Wire Line
	1500 3600 2050 3600
Connection ~ 1500 3600
$Comp
L Connector_Generic:Conn_01x02 MEGA2
U 1 1 67A07074
P 1400 5500
F 0 "MEGA2" H 1480 5492 50  0000 L CNN
F 1 "Conn_01x02" H 1480 5401 50  0000 L CNN
F 2 "" H 1400 5500 50  0001 C CNN
F 3 "~" H 1400 5500 50  0001 C CNN
	1    1400 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2800 5600 1600 5600
Connection ~ 2800 5600
Wire Wire Line
	1600 5500 1600 1700
Wire Wire Line
	1600 1700 1500 1700
Connection ~ 1500 1700
Wire Wire Line
	1500 4500 2250 4500
Wire Wire Line
	2100 4600 2900 4600
Wire Wire Line
	2200 900  2200 1400
Wire Wire Line
	2200 1500 1500 1500
Connection ~ 1500 1500
Wire Wire Line
	3350 4500 2900 4500
Connection ~ 2900 4500
$Comp
L Connector_Generic:Conn_01x02 MEGA1
U 1 1 660CA0D5
P 950 1450
F 0 "MEGA1" H 1030 1442 50  0000 L CNN
F 1 "Conn_01x02" H 1030 1351 50  0000 L CNN
F 2 "" H 950 1450 50  0001 C CNN
F 3 "~" H 950 1450 50  0001 C CNN
	1    950  1450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1150 1550 1300 1550
Wire Wire Line
	1300 1550 1300 1600
Wire Wire Line
	1150 1400 1150 1450
Wire Wire Line
	1150 1400 1500 1400
$Comp
L Connector_Generic:Conn_01x02 MEGA5
U 1 1 68505395
P 1850 4500
F 0 "MEGA5" H 1930 4492 50  0000 L CNN
F 1 "Conn_01x02" H 1930 4401 50  0000 L CNN
F 2 "" H 1850 4500 50  0001 C CNN
F 3 "~" H 1850 4500 50  0001 C CNN
	1    1850 4500
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA8
U 1 1 685CB0CA
P 1900 4600
F 0 "MEGA8" H 1980 4592 50  0000 L CNN
F 1 "Conn_01x02" H 1980 4501 50  0000 L CNN
F 2 "" H 1900 4600 50  0001 C CNN
F 3 "~" H 1900 4600 50  0001 C CNN
	1    1900 4600
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA11
U 1 1 68690DDC
P 1950 4700
F 0 "MEGA11" H 2030 4692 50  0000 L CNN
F 1 "Conn_01x02" H 2030 4601 50  0000 L CNN
F 2 "" H 1950 4700 50  0001 C CNN
F 3 "~" H 1950 4700 50  0001 C CNN
	1    1950 4700
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA15
U 1 1 68756ADA
P 2000 4800
F 0 "MEGA15" H 2080 4792 50  0000 L CNN
F 1 "Conn_01x02" H 2080 4701 50  0000 L CNN
F 2 "" H 2000 4800 50  0001 C CNN
F 3 "~" H 2000 4800 50  0001 C CNN
	1    2000 4800
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA18
U 1 1 6881C7FB
P 2050 4900
F 0 "MEGA18" H 2130 4892 50  0000 L CNN
F 1 "Conn_01x02" H 2130 4801 50  0000 L CNN
F 2 "" H 2050 4900 50  0001 C CNN
F 3 "~" H 2050 4900 50  0001 C CNN
	1    2050 4900
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA21
U 1 1 688E24EF
P 2100 5000
F 0 "MEGA21" H 2180 4992 50  0000 L CNN
F 1 "Conn_01x02" H 2180 4901 50  0000 L CNN
F 2 "" H 2100 5000 50  0001 C CNN
F 3 "~" H 2100 5000 50  0001 C CNN
	1    2100 5000
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA25
U 1 1 689A8251
P 2150 5100
F 0 "MEGA25" H 2230 5092 50  0000 L CNN
F 1 "Conn_01x02" H 2230 5001 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 2150 5100 50  0001 C CNN
F 3 "~" H 2150 5100 50  0001 C CNN
	1    2150 5100
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 MEGA28
U 1 1 68A6DFD1
P 2200 5200
F 0 "MEGA28" H 2280 5192 50  0000 L CNN
F 1 "Conn_01x02" H 2280 5101 50  0000 L CNN
F 2 "" H 2200 5200 50  0001 C CNN
F 3 "~" H 2200 5200 50  0001 C CNN
	1    2200 5200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 5400 2900 5400
Connection ~ 2900 5400
Wire Wire Line
	2900 5400 3350 5400
Wire Wire Line
	2200 5400 1500 5400
Connection ~ 1500 5400
Wire Wire Line
	2250 5300 2900 5300
Connection ~ 2900 5300
Wire Wire Line
	2900 5300 3350 5300
Wire Wire Line
	2200 5200 2900 5200
Connection ~ 2900 5200
Wire Wire Line
	2900 5200 3350 5200
Wire Wire Line
	2100 5200 1500 5200
Connection ~ 1500 5200
Wire Wire Line
	1500 5300 2150 5300
Connection ~ 1500 5300
Wire Wire Line
	1500 5100 2050 5100
Connection ~ 1500 5100
Wire Wire Line
	2000 5000 1500 5000
Connection ~ 1500 5000
Wire Wire Line
	1500 4900 1950 4900
Connection ~ 1500 4900
Wire Wire Line
	1900 4800 1500 4800
Connection ~ 1500 4800
Wire Wire Line
	1500 4700 1850 4700
Connection ~ 1500 4700
Wire Wire Line
	1950 4700 2900 4700
Connection ~ 2900 4700
Wire Wire Line
	2000 4800 2900 4800
Connection ~ 2900 4800
Wire Wire Line
	2900 4800 3650 4800
Wire Wire Line
	2050 4900 2900 4900
Connection ~ 2900 4900
Wire Wire Line
	2900 5000 2100 5000
Connection ~ 2900 5000
Wire Wire Line
	2150 5100 2900 5100
Connection ~ 2900 5100
$Comp
L Connector_Generic:Conn_01x02 MEGA43
U 1 1 6A3A1D43
P 1050 1800
F 0 "MEGA43" H 1130 1792 50  0000 L CNN
F 1 "Conn_01x02" H 1130 1701 50  0000 L CNN
F 2 "" H 1050 1800 50  0001 C CNN
F 3 "~" H 1050 1800 50  0001 C CNN
	1    1050 1800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1250 1800 1400 1800
Wire Wire Line
	1250 1900 1400 1900
Text GLabel 1400 1800 2    50   Input ~ 10
D0
Text GLabel 1400 1900 2    50   Input ~ 10
D1
Text Label 3050 3100 0    50   ~ 0
KEYA
Text Label 1200 3100 0    50   ~ 0
KEYB
Text Label 3050 3200 0    50   ~ 0
KEYC
Text Label 1200 3200 0    50   ~ 0
KEYD
Text Label 1200 4800 0    50   ~ 0
JOYX
Text Label 3050 5200 0    50   ~ 0
JOYY
Text Label 3050 3300 0    50   ~ 0
KEYK
Text Label 9100 8000 0    50   ~ 0
JOYX
Text Label 8050 8000 0    50   ~ 0
JOYY
$Comp
L power:+3.3V #PWR0108
U 1 1 62B7C9AA
P 8050 7900
F 0 "#PWR0108" H 8050 7750 50  0001 C CNN
F 1 "+3.3V" H 8065 8073 50  0000 C CNN
F 2 "" H 8050 7900 50  0001 C CNN
F 3 "" H 8050 7900 50  0001 C CNN
	1    8050 7900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	14600 1650 14150 1650
Text GLabel 14150 1650 0    50   Input ~ 10
D33
Wire Wire Line
	8950 7600 9400 7600
Text GLabel 9400 7600 2    50   Input ~ 10
D22
Wire Wire Line
	8950 7700 9400 7700
Text GLabel 9400 7700 2    50   Input ~ 10
D24
Text Label 9100 7600 0    50   ~ 0
KEYA
Text Label 9100 7700 0    50   ~ 0
KEYC
Wire Wire Line
	8450 7600 8000 7600
Text GLabel 8000 7600 0    50   Input ~ 10
D23
Text GLabel 8000 7700 0    50   Input ~ 10
D25
Wire Wire Line
	8450 7700 8000 7700
$Comp
L power:GND #PWR0109
U 1 1 63F7B2F9
P 7950 7500
F 0 "#PWR0109" H 7950 7250 50  0001 C CNN
F 1 "GND" H 7955 7327 50  0000 C CNN
F 2 "" H 7950 7500 50  0001 C CNN
F 3 "" H 7950 7500 50  0001 C CNN
	1    7950 7500
	0    1    1    0   
$EndComp
Text GLabel 8000 8000 0    50   Input ~ 10
A10
Text GLabel 9400 8000 2    50   Input ~ 10
A3
Wire Wire Line
	8450 8000 8000 8000
Wire Wire Line
	9400 8000 8950 8000
Text Label 8200 7600 0    50   ~ 0
KEYB
Text Label 8200 7700 0    50   ~ 0
KEYD
Text Label 9100 7900 0    50   ~ 0
KEYK
Text GLabel 9400 7900 2    50   Input ~ 10
D26
Wire Wire Line
	9400 7900 8950 7900
$Comp
L power:GND #PWR0116
U 1 1 6640ADAA
P 8100 5900
F 0 "#PWR0116" H 8100 5650 50  0001 C CNN
F 1 "GND" H 8105 5727 50  0000 C CNN
F 2 "" H 8100 5900 50  0001 C CNN
F 3 "" H 8100 5900 50  0001 C CNN
	1    8100 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 5900 8200 5900
Wire Wire Line
	7950 7500 8450 7500
Wire Wire Line
	8450 7900 8050 7900
Wire Notes Line
	3150 6250 10350 6250
$Comp
L Device:R R46
U 1 1 664C7E00
P 14900 8600
F 0 "R46" V 15107 8600 50  0000 C CNN
F 1 "200-0.25W" V 15016 8600 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 14830 8600 50  0001 C CNN
F 3 "~" H 14900 8600 50  0001 C CNN
F 4 "C18002" H 0   0   50  0001 C CNN "LCSC"
	1    14900 8600
	0    1    -1   0   
$EndComp
$Comp
L Device:R R48
U 1 1 64E1C61B
P 15250 8450
F 0 "R48" V 15457 8450 50  0000 C CNN
F 1 "200-0.25W" V 15366 8450 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 15180 8450 50  0001 C CNN
F 3 "~" H 15250 8450 50  0001 C CNN
F 4 "C18002" H 0   0   50  0001 C CNN "LCSC"
	1    15250 8450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	14600 9400 15350 9400
Wire Wire Line
	8450 7800 8000 7800
Text Label 8200 7800 0    50   ~ 0
KEYF
Wire Wire Line
	8950 7800 9400 7800
Text Label 9100 7800 0    50   ~ 0
KEYE
$Comp
L Device:LED D22
U 1 1 62F09018
P 13200 3650
F 0 "D22" V 13239 3532 50  0000 R CNN
F 1 "WLED" V 13148 3532 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 13200 3650 50  0001 C CNN
F 3 "~" H 13200 3650 50  0001 C CNN
F 4 "C2290" H -5300 400 50  0001 C CNN "LCSC"
	1    13200 3650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R81
U 1 1 636FC42C
P 13200 3950
F 0 "R81" H 13270 3996 50  0000 L CNN
F 1 "4.7k-0.25W" H 13270 3905 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 13130 3950 50  0001 C CNN
F 3 "~" H 13200 3950 50  0001 C CNN
F 4 "C17936" H -5300 400 50  0001 C CNN "LCSC"
	1    13200 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D21
U 1 1 639A3301
P 15500 3650
F 0 "D21" V 15539 3532 50  0000 R CNN
F 1 "WLED" V 15448 3532 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 15500 3650 50  0001 C CNN
F 3 "~" H 15500 3650 50  0001 C CNN
F 4 "C2290" H -2900 -650 50  0001 C CNN "LCSC"
	1    15500 3650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R80
U 1 1 639A3307
P 15500 3950
F 0 "R80" H 15570 3996 50  0000 L CNN
F 1 "4.7k-0.25W" H 15570 3905 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 15430 3950 50  0001 C CNN
F 3 "~" H 15500 3950 50  0001 C CNN
F 4 "C17936" H -2900 -650 50  0001 C CNN "LCSC"
	1    15500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	15500 4100 15200 4100
Connection ~ 15200 4100
Connection ~ 13200 3500
Connection ~ 15500 3500
$Comp
L Device:LED D19
U 1 1 641C173B
P 14400 3650
F 0 "D19" V 14347 3730 50  0000 L CNN
F 1 "RLED" V 14438 3730 50  0000 L CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 14400 3650 50  0001 C CNN
F 3 "~" H 14400 3650 50  0001 C CNN
F 4 "C2286" H -3100 -650 50  0001 C CNN "LCSC"
	1    14400 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R53
U 1 1 641C1741
P 14400 3950
F 0 "R53" H 14470 3996 50  0000 L CNN
F 1 "4.7k-0.25W" H 14470 3905 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 14330 3950 50  0001 C CNN
F 3 "~" H 14400 3950 50  0001 C CNN
F 4 "C17936" H -3100 -650 50  0001 C CNN "LCSC"
	1    14400 3950
	1    0    0    -1  
$EndComp
Connection ~ 14400 3500
Wire Wire Line
	14400 3500 14450 3500
$Comp
L Device:LED D20
U 1 1 64474728
P 12150 3650
F 0 "D20" V 12097 3730 50  0000 L CNN
F 1 "RLED" V 12188 3730 50  0000 L CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 12150 3650 50  0001 C CNN
F 3 "~" H 12150 3650 50  0001 C CNN
F 4 "C2286" H -5500 400 50  0001 C CNN "LCSC"
	1    12150 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R55
U 1 1 6447472E
P 12150 3950
F 0 "R55" H 12220 3996 50  0000 L CNN
F 1 "4.7k-0.25W" H 12220 3905 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 12080 3950 50  0001 C CNN
F 3 "~" H 12150 3950 50  0001 C CNN
F 4 "C17936" H -5500 400 50  0001 C CNN "LCSC"
	1    12150 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	12100 4100 12150 4100
Connection ~ 12150 4100
Wire Wire Line
	12150 4100 12650 4100
Wire Wire Line
	14350 4100 14400 4100
Connection ~ 14400 4100
Wire Wire Line
	14400 4100 14800 4100
Wire Wire Line
	15050 3500 15500 3500
Wire Wire Line
	15500 3500 15650 3500
Wire Wire Line
	13200 3500 13500 3500
Wire Wire Line
	2200 900  2900 900 
Wire Wire Line
	2900 900  3300 900 
Wire Wire Line
	3400 900  3500 900 
Wire Wire Line
	3100 1000 3950 1000
Wire Wire Line
	2900 1000 3000 1000
Wire Wire Line
	3100 1000 3000 1000
Connection ~ 3100 1000
Connection ~ 3000 1000
Wire Wire Line
	3400 900  3300 900 
Connection ~ 3400 900 
Connection ~ 3300 900 
Wire Wire Line
	2900 800  3600 800 
Connection ~ 3600 800 
Wire Wire Line
	3600 800  3700 800 
Connection ~ 3700 800 
Wire Wire Line
	3700 800  3750 800 
Text GLabel 4050 800  2    50   Input ~ 0
PSU_V+
Text GLabel 13500 3500 2    50   Input ~ 0
PSU_V+
$Comp
L Regulator_Linear:AZ1117-5.0 U4
U 1 1 6493A402
P 10450 5050
F 0 "U4" H 10450 5292 50  0000 C CNN
F 1 "AZ1117-5.0" H 10450 5201 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223" H 10450 5300 50  0001 C CIN
F 3 "https://www.diodes.com/assets/Datasheets/AZ1117.pdf" H 10450 5050 50  0001 C CNN
F 4 "C92105" H 10450 5050 50  0001 C CNN "LCSC"
	1    10450 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Polarized C4
U 1 1 64A21DDE
P 10000 5200
F 0 "C4" H 10118 5246 50  0000 L CNN
F 1 "1.0uF" H 10118 5155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10038 5050 50  0001 C CNN
F 3 "~" H 10000 5200 50  0001 C CNN
F 4 "C52923" H 0   0   50  0001 C CNN "LCSC"
	1    10000 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 5350 10000 5500
$Comp
L Device:C_Polarized C5
U 1 1 64B091FF
P 10850 5200
F 0 "C5" H 10968 5246 50  0000 L CNN
F 1 "1.0uF" H 10968 5155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10888 5050 50  0001 C CNN
F 3 "~" H 10850 5200 50  0001 C CNN
F 4 "C52923" H 0   0   50  0001 C CNN "LCSC"
	1    10850 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 5350 10850 5500
Text GLabel 9850 5050 0    50   Input ~ 0
PSU_V+
Wire Wire Line
	9850 5050 10000 5050
Connection ~ 10000 5050
Wire Wire Line
	10000 5050 10150 5050
Wire Wire Line
	10750 5050 10850 5050
Connection ~ 10850 5050
Wire Wire Line
	10850 5050 11050 5050
Wire Wire Line
	10000 5500 10450 5500
Wire Wire Line
	10450 5350 10450 5500
Connection ~ 10450 5500
Wire Wire Line
	10450 5500 10850 5500
$Comp
L power:GND #PWR0143
U 1 1 656D002A
P 10000 5500
F 0 "#PWR0143" H 10000 5250 50  0001 C CNN
F 1 "GND" H 10005 5327 50  0000 C CNN
F 2 "" H 10000 5500 50  0001 C CNN
F 3 "" H 10000 5500 50  0001 C CNN
	1    10000 5500
	1    0    0    -1  
$EndComp
Connection ~ 10000 5500
Text GLabel 11050 5050 2    50   Input ~ 0
5V_EX
Text GLabel 7650 400  2    50   Input ~ 0
5V_EX
Text GLabel 7750 2500 2    50   Input ~ 0
5V_EX
Text GLabel 15600 8450 2    50   Input ~ 0
5V_EX
Text GLabel 11350 9750 1    50   Input ~ 0
5V_EX
Wire Wire Line
	11350 10050 11200 10050
Connection ~ 11200 10050
Text GLabel 9850 9750 1    50   Input ~ 0
5V_EX
Text GLabel 8450 9750 1    50   Input ~ 0
5V_EX
Wire Wire Line
	8450 10050 8250 10050
Connection ~ 8250 10050
Wire Wire Line
	9850 10050 9700 10050
Connection ~ 9700 10050
Text Notes 10300 4850 2    50   ~ 0
basic part C6187
Text Label 10000 7550 0    50   ~ 10
Dpad_down
Text Label 10000 7450 0    50   ~ 10
Dpad_right
Text Label 10000 7650 0    50   ~ 10
Dpad_left
Text Label 10000 7750 0    50   ~ 10
Dpad_up
Wire Wire Line
	10450 7450 10000 7450
Wire Wire Line
	10000 7750 10450 7750
Text Label 10250 7950 2    50   ~ 10
select
Text Label 10250 7850 2    50   ~ 10
cancel
Text Label 10400 7350 2    50   ~ 10
sleep_wake
Wire Wire Line
	10250 7850 10450 7850
Wire Wire Line
	10250 7950 10450 7950
Wire Wire Line
	10000 7350 10450 7350
Wire Wire Line
	10000 7650 10450 7650
Wire Wire Line
	10000 7550 10450 7550
Text Label 10350 7250 2    50   ~ 10
led_woke
Wire Wire Line
	10000 7250 10450 7250
$Comp
L power:+5V #PWR0150
U 1 1 651A0B40
P 11150 6850
F 0 "#PWR0150" H 11150 6700 50  0001 C CNN
F 1 "+5V" H 11165 7023 50  0000 C CNN
F 2 "" H 11150 6850 50  0001 C CNN
F 3 "" H 11150 6850 50  0001 C CNN
	1    11150 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0153
U 1 1 652A6451
P 10750 8750
F 0 "#PWR0153" H 10750 8500 50  0001 C CNN
F 1 "GND" H 10755 8577 50  0000 C CNN
F 2 "" H 10750 8750 50  0001 C CNN
F 3 "" H 10750 8750 50  0001 C CNN
	1    10750 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 6850 11150 6850
Text Label 11650 7150 0    50   ~ 0
UI_Serin
Text Label 10050 8150 0    50   ~ 0
parallelload
Wire Wire Line
	10050 8150 10450 8150
Text Label 10050 8350 0    50   ~ 0
loadpulses
Wire Wire Line
	10450 8350 10050 8350
$Comp
L Device:C C6
U 1 1 66881A7D
P 11400 7850
F 0 "C6" H 11515 7896 50  0000 L CNN
F 1 "0.1uF" H 11515 7805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 11438 7700 50  0001 C CNN
F 3 "~" H 11400 7850 50  0001 C CNN
F 4 "C1525" H -1250 -650 50  0001 C CNN "LCSC"
	1    11400 7850
	1    0    0    -1  
$EndComp
Wire Wire Line
	11150 6850 11150 7700
Wire Wire Line
	11150 7700 11400 7700
Connection ~ 11150 6850
Wire Wire Line
	11400 8000 11400 8750
Wire Wire Line
	9950 7150 10450 7150
$Comp
L power:GND #PWR0155
U 1 1 66BA9F4C
P 9950 7150
F 0 "#PWR0155" H 9950 6900 50  0001 C CNN
F 1 "GND" H 9955 6977 50  0000 C CNN
F 2 "" H 9950 7150 50  0001 C CNN
F 3 "" H 9950 7150 50  0001 C CNN
	1    9950 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R47
U 1 1 66CB5346
P 11550 7000
F 0 "R47" V 11757 7000 50  0000 C CNN
F 1 "10k-0.25W" V 11666 7000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 11480 7000 50  0001 C CNN
F 3 "~" H 11550 7000 50  0001 C CNN
F 4 "C17902" H -1250 -650 50  0001 C CNN "LCSC"
	1    11550 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	11150 6850 11550 6850
Wire Wire Line
	11450 7150 11550 7150
Connection ~ 11550 7150
Wire Wire Line
	11550 7150 11650 7150
Wire Wire Line
	9950 8450 10450 8450
$Comp
L power:GND #PWR0157
U 1 1 666688E3
P 9950 8450
F 0 "#PWR0157" H 9950 8200 50  0001 C CNN
F 1 "GND" H 9955 8277 50  0000 C CNN
F 2 "" H 9950 8450 50  0001 C CNN
F 3 "" H 9950 8450 50  0001 C CNN
	1    9950 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 8750 10950 8750
Wire Wire Line
	11400 8750 10950 8750
Connection ~ 10950 8750
$Comp
L 74xx:74HC165 U5
U 1 1 628C70B7
P 10950 7750
F 0 "U5" H 10950 8831 50  0000 C CNN
F 1 "SN74HC165" H 10950 8740 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 10950 7750 50  0001 C CNN
F 3 "https://www.ti.com/cn/lit/ds/symlink/sn74hc165.pdf?ts=1652165456518" H 10950 7750 50  0001 C CNN
F 4 "C61060" H 10950 7750 50  0001 C CNN "LCSC"
	1    10950 7750
	1    0    0    -1  
$EndComp
Text Label 1050 2700 0    50   ~ 0
UI_Serin
Text Label 1050 2600 0    50   ~ 0
parallelload
Text Label 2950 2700 0    50   ~ 0
loadpulses
$Comp
L power:Earth #PWR0158
U 1 1 6A2F4008
P 12500 2200
F 0 "#PWR0158" H 12500 1950 50  0001 C CNN
F 1 "Earth" H 12500 2050 50  0001 C CNN
F 2 "" H 12500 2200 50  0001 C CNN
F 3 "~" H 12500 2200 50  0001 C CNN
	1    12500 2200
	1    0    0    -1  
$EndComp
Text Label 3150 3900 2    50   ~ 10
GPX
Text Label 3250 4400 2    50   ~ 10
BT_int
Text GLabel 15550 2250 2    50   Input ~ 10
A4
$Comp
L Connector_Generic:Conn_02x12_Odd_Even EXTRA1
U 1 1 6CC89DA4
P 14800 1950
F 0 "EXTRA1" H 14850 2967 50  0000 C CNN
F 1 "321024RG0ABK00A06" H 14850 2876 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x12_P2.54mm_Horizontal" H 14800 1950 50  0001 C CNN
F 3 "~" H 14800 1950 50  0001 C CNN
F 4 "C601956" H 14800 1950 50  0001 C CNN "LCSC"
	1    14800 1950
	1    0    0    -1  
$EndComp
Text Label 14200 2350 0    50   ~ 10
heat4
Text Label 15200 2350 0    50   ~ 10
heat3
Wire Wire Line
	14600 2050 14150 2050
Wire Wire Line
	15550 1950 15100 1950
Wire Wire Line
	14150 2250 14600 2250
Wire Wire Line
	14150 2150 14600 2150
Wire Wire Line
	15550 1850 15100 1850
Wire Wire Line
	14600 1950 14150 1950
Text Label 14200 2050 0    50   ~ 10
RXD2
Text GLabel 15550 1850 0    50   Input ~ 10
D6
Text GLabel 14150 1950 0    50   Input ~ 10
D4
Text Label 15200 1950 0    50   ~ 10
TXD2
Text GLabel 15550 1950 2    50   Input ~ 10
D16
Text GLabel 15550 2050 2    50   Input ~ 10
D18
Wire Wire Line
	15550 2050 15100 2050
Wire Wire Line
	15550 2150 15100 2150
Text GLabel 15550 2150 2    50   Input ~ 10
D20
Text Label 15500 2050 2    50   ~ 10
TXD1
Text Label 15500 2150 2    50   ~ 10
SDA
Text Label 14200 2250 0    50   ~ 10
SCL
Text Label 14200 2150 0    50   ~ 10
RXD1
Text GLabel 14150 2250 0    50   Input ~ 10
D21
Text GLabel 14150 2150 0    50   Input ~ 10
D19
Text GLabel 14150 2050 0    50   Input ~ 10
D17
Wire Wire Line
	15100 2250 15550 2250
Text Label 3800 2700 2    50   ~ 10
TXD3
Text Label 850  2700 2    50   ~ 10
RXD3
Wire Wire Line
	600  2700 1500 2700
Wire Wire Line
	2900 2700 3800 2700
$Comp
L Connector_Generic:Conn_01x06 BT_PWR1
U 1 1 6F3F4960
P 13050 5850
F 0 "BT_PWR1" H 13130 5842 50  0000 L CNN
F 1 "Conn_01x06" H 13130 5751 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 13050 5850 50  0001 C CNN
F 3 "~" H 13050 5850 50  0001 C CNN
F 4 "C40877" H -350 500 50  0001 C CNN "LCSC"
	1    13050 5850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 BT_A1
U 1 1 6F3F79B3
P 13050 6650
F 0 "BT_A1" H 13130 6642 50  0000 L CNN
F 1 "Conn_01x06" H 13130 6551 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 13050 6650 50  0001 C CNN
F 3 "~" H 13050 6650 50  0001 C CNN
F 4 "C40877" H -350 500 50  0001 C CNN "LCSC"
	1    13050 6650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 BT_D2
U 1 1 6F5083DB
P 14400 5750
F 0 "BT_D2" H 14480 5742 50  0000 L CNN
F 1 "Conn_01x08" H 14480 5651 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 14400 5750 50  0001 C CNN
F 3 "~" H 14400 5750 50  0001 C CNN
F 4 "C27438" H -350 500 50  0001 C CNN "LCSC"
	1    14400 5750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 BT_D1
U 1 1 6F50B613
P 14400 6650
F 0 "BT_D1" H 14480 6642 50  0000 L CNN
F 1 "Conn_01x08" H 14480 6551 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 14400 6650 50  0001 C CNN
F 3 "~" H 14400 6650 50  0001 C CNN
F 4 "C27438" H -350 500 50  0001 C CNN "LCSC"
	1    14400 6650
	1    0    0    -1  
$EndComp
Text GLabel 2850 500  0    50   Input ~ 0
Vin
Wire Wire Line
	2850 500  2900 500 
Wire Wire Line
	2900 500  2900 800 
Connection ~ 2900 800 
Text GLabel 12850 6150 0    50   Input ~ 0
Vin
$Comp
L power:GND #PWR0159
U 1 1 6FB7EFCD
P 12550 6050
F 0 "#PWR0159" H 12550 5800 50  0001 C CNN
F 1 "GND" H 12555 5877 50  0000 C CNN
F 2 "" H 12550 6050 50  0001 C CNN
F 3 "" H 12550 6050 50  0001 C CNN
	1    12550 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	12850 6050 12550 6050
Wire Wire Line
	12550 5950 12850 5950
Wire Wire Line
	12550 5950 12550 6050
Connection ~ 12550 6050
$Comp
L power:+5V #PWR0160
U 1 1 6FFD0617
P 12550 5850
F 0 "#PWR0160" H 12550 5700 50  0001 C CNN
F 1 "+5V" H 12565 6023 50  0000 C CNN
F 2 "" H 12550 5850 50  0001 C CNN
F 3 "" H 12550 5850 50  0001 C CNN
	1    12550 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0170
U 1 1 6FFD061D
P 12700 5750
F 0 "#PWR0170" H 12700 5600 50  0001 C CNN
F 1 "+3.3V" H 12715 5923 50  0000 C CNN
F 2 "" H 12700 5750 50  0001 C CNN
F 3 "" H 12700 5750 50  0001 C CNN
	1    12700 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	12700 5750 12850 5750
Wire Wire Line
	12550 5850 12850 5850
Text Label 12600 5550 0    50   ~ 10
reset
Wire Wire Line
	12800 5550 12600 5550
Wire Wire Line
	12800 5550 12800 5650
Wire Wire Line
	12800 5650 12850 5650
Text Label 14000 5450 0    50   ~ 10
Aref
Wire Wire Line
	14000 5450 14200 5450
Text Label 14100 6050 2    50   ~ 10
BT_int
Text Label 14100 5950 2    50   ~ 10
SS
Wire Wire Line
	14100 5950 14200 5950
Wire Wire Line
	14100 6050 14200 6050
$Comp
L power:GND #PWR0174
U 1 1 7102FCCB
P 13950 5550
F 0 "#PWR0174" H 13950 5300 50  0001 C CNN
F 1 "GND" H 13955 5377 50  0000 C CNN
F 2 "" H 13950 5550 50  0001 C CNN
F 3 "" H 13950 5550 50  0001 C CNN
	1    13950 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	14200 5550 13950 5550
Text Notes 12850 5400 0    50   ~ 0
dimension of shield pinout\n 20 pins(inclusive) wide by\n 17 pin(long) gpioside y\n13 pin (short) power aide 
Text Notes 14150 7700 0    50   ~ 0
the position of the SPI pins are\n1 3 5 pin along the bottom position of the sides headers\npin 1,2 is at 9th pin from longside\npin 5,6 is at 10th pin from short side \ntotal width is 9+10+1 = 20 (consistnet)\n
Wire Wire Line
	5550 2300 5650 2300
Wire Wire Line
	5650 2300 5750 2300
Connection ~ 5650 2300
$Comp
L Analog_Switch:CD4051B ADD_DEMUX1
U 1 1 6113BBC0
P 5750 1600
F 0 "ADD_DEMUX1" H 5750 2481 50  0000 C CNN
F 1 "CD4051BM96" H 5750 2390 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5900 850 50  0001 L CNN
F 3 "https://datasheet.lcsc.com/lcsc/1806151615_Texas-Instruments-CD4051BNSR_C87646.pdf" H 5730 1700 50  0001 C CNN
F 4 "C21379" H 0   0   50  0001 C CNN "LCSC"
	1    5750 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3000 6250 3200
Wire Wire Line
	6500 900  6500 1100
Wire Wire Line
	12050 3500 12150 3500
Connection ~ 12150 3500
Wire Wire Line
	6500 900  6100 900 
Wire Wire Line
	5850 900  6100 900 
Connection ~ 6100 900 
$Comp
L power:+5V #PWR0169
U 1 1 62E7F071
P 6100 900
F 0 "#PWR0169" H 6100 750 50  0001 C CNN
F 1 "+5V" H 6115 1073 50  0000 C CNN
F 2 "" H 6100 900 50  0001 C CNN
F 3 "" H 6100 900 50  0001 C CNN
	1    6100 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3000 5950 3000
Wire Wire Line
	5950 3000 6250 3000
Connection ~ 5950 3000
$Comp
L power:+5V #PWR0173
U 1 1 6287557F
P 5950 3000
F 0 "#PWR0173" H 5950 2850 50  0001 C CNN
F 1 "+5V" H 5965 3173 50  0000 C CNN
F 2 "" H 5950 3000 50  0001 C CNN
F 3 "" H 5950 3000 50  0001 C CNN
	1    5950 3000
	1    0    0    -1  
$EndComp
Text Notes 4900 1000 0    50   ~ 0
use gray code - minimal change each time\n001 - 1\n011 - 3\n010 - 2\n110 - 6\n100 - 4\n101 - 5
Wire Wire Line
	8200 5500 8700 5500
Connection ~ 8700 5500
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J2
U 1 1 62D8E6C1
P -1700 4900
F 0 "J2" V -1696 5080 50  0000 L CNN
F 1 "Conn_02x03_Odd_Even" V -1605 5080 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x03_P2.54mm_Vertical" H -1700 4900 50  0001 C CNN
F 3 "~" H -1700 4900 50  0001 C CNN
F 4 "C2897404" H 0   0   50  0001 C CNN "LCSC"
	1    -1700 4900
	0    1    -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J3
U 1 1 62F69E47
P -1050 4900
F 0 "J3" V -1046 5080 50  0000 L CNN
F 1 "Conn_02x03_Odd_Even" V -955 5080 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x03_P2.54mm_Vertical" H -1050 4900 50  0001 C CNN
F 3 "~" H -1050 4900 50  0001 C CNN
F 4 "C2897404" H 0   0   50  0001 C CNN "LCSC"
	1    -1050 4900
	0    1    -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_02x16_Odd_Even J4
U 1 1 632354D8
P -300 4100
F 0 "J4" H -250 5017 50  0000 C CNN
F 1 "Conn_02x16_Odd_Even" H -250 4926 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x16_P2.54mm_Vertical" H -300 4100 50  0001 C CNN
F 3 "~" H -300 4100 50  0001 C CNN
F 4 "C24778" H 0   0   50  0001 C CNN "LCSC"
	1    -300 4100
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J1
U 1 1 63237265
P -2300 3850
F 0 "J1" H -2250 4967 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H -2250 4876 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H -2300 3850 50  0001 C CNN
F 3 "~" H -2300 3850 50  0001 C CNN
F 4 "C50982" H 0   0   50  0001 C CNN "LCSC"
	1    -2300 3850
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 PSU_5V2
U 1 1 6323BEDD
P -2300 2850
F 0 "PSU_5V2" H -2220 2842 50  0000 L CNN
F 1 "Conn_01x02" H -2220 2751 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H -2300 2850 50  0001 C CNN
F 3 "~" H -2300 2850 50  0001 C CNN
F 4 "C49661" H 0   0   50  0001 C CNN "LCSC"
	1    -2300 2850
	0    1    1    0   
$EndComp
Text GLabel -2450 2350 0    50   Input ~ 0
Vin
Wire Wire Line
	-2450 2350 -2400 2350
Wire Wire Line
	-2400 2350 -2400 2650
Wire Wire Line
	-2300 2650 -2400 2650
Connection ~ -2400 2650
Wire Wire Line
	-1600 5100 -1600 5200
$Comp
L power:+5V #PWR0104
U 1 1 63BAB2AA
P -1600 5200
F 0 "#PWR0104" H -1600 5050 50  0001 C CNN
F 1 "+5V" H -1585 5373 50  0000 C CNN
F 2 "" H -1600 5200 50  0001 C CNN
F 3 "" H -1600 5200 50  0001 C CNN
	1    -1600 5200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 63BAB2B0
P -1800 5200
F 0 "#PWR0117" H -1800 4950 50  0001 C CNN
F 1 "GND" H -1795 5027 50  0000 C CNN
F 2 "" H -1800 5200 50  0001 C CNN
F 3 "" H -1800 5200 50  0001 C CNN
	1    -1800 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	-1800 5100 -1800 5200
Text Label -1700 5300 1    50   ~ 10
MOSI
Wire Wire Line
	-1700 5100 -1700 5300
Text Label -1800 4400 3    50   ~ 10
reset
Wire Wire Line
	-1800 4600 -1800 4400
Text Label -1700 4400 3    50   ~ 10
SCK
Wire Wire Line
	-1700 4400 -1700 4600
Text Label -1600 4400 3    50   ~ 10
MISO
Wire Wire Line
	-1600 4400 -1600 4600
$Comp
L power:GND #PWR0132
U 1 1 63F818DD
P -1900 2950
F 0 "#PWR0132" H -1900 2700 50  0001 C CNN
F 1 "GND" H -1895 2777 50  0000 C CNN
F 2 "" H -1900 2950 50  0001 C CNN
F 3 "" H -1900 2950 50  0001 C CNN
	1    -1900 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2100 2950 -1900 2950
Wire Wire Line
	-2100 2950 -2600 2950
Connection ~ -2100 2950
$Comp
L power:+3.3V #PWR0178
U 1 1 6425C2FB
P -1750 3150
F 0 "#PWR0178" H -1750 3000 50  0001 C CNN
F 1 "+3.3V" H -1735 3323 50  0000 C CNN
F 2 "" H -1750 3150 50  0001 C CNN
F 3 "" H -1750 3150 50  0001 C CNN
	1    -1750 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2600 3150 -2100 3150
Connection ~ -2100 3150
Wire Wire Line
	-2100 3150 -1750 3150
$Comp
L power:+5V #PWR0182
U 1 1 64445E74
P -2700 3050
F 0 "#PWR0182" H -2700 2900 50  0001 C CNN
F 1 "+5V" H -2685 3223 50  0000 C CNN
F 2 "" H -2700 3050 50  0001 C CNN
F 3 "" H -2700 3050 50  0001 C CNN
	1    -2700 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2700 3050 -2600 3050
Wire Wire Line
	-2100 3050 -2600 3050
Connection ~ -2600 3050
Text Label -2800 3250 0    50   ~ 10
reset
Wire Wire Line
	-2600 3250 -2800 3250
Text Label -2100 3250 0    50   ~ 10
Aref
Wire Wire Line
	-2100 3250 -1500 3250
Wire Wire Line
	-2100 3350 -1950 3350
Wire Wire Line
	-2600 3350 -2750 3350
Text GLabel -1950 3350 2    50   Input ~ 10
D0
Text GLabel -2750 3350 0    50   Input ~ 10
D1
Text GLabel -100 3400 2    50   Input ~ 10
A0
Text GLabel -2100 3750 2    50   Input ~ 10
D8
Text GLabel -2100 3850 2    50   Input ~ 10
D10
Text GLabel -2100 3950 2    50   Input ~ 10
D12
Text GLabel -100 3600 2    50   Input ~ 10
A4
Text GLabel -100 3500 2    50   Input ~ 10
A2
Text GLabel -100 3700 2    50   Input ~ 10
A6
Text GLabel -2100 3550 2    50   Input ~ 10
D4
Text GLabel -2100 3650 2    50   Input ~ 10
D6
Text GLabel -100 3800 2    50   Input ~ 10
A8
Text GLabel -100 3900 2    50   Input ~ 10
A10
Text GLabel -100 4000 2    50   Input ~ 10
A12
Text GLabel -100 4100 2    50   Input ~ 10
A14
Text GLabel -2100 4550 2    50   Input ~ 10
D24
Text GLabel -2100 4650 2    50   Input ~ 10
D26
Text GLabel -2100 4750 2    50   Input ~ 10
D28
Text GLabel -1150 5400 1    50   Input ~ 10
D52
Text GLabel -1050 5400 1    50   Input ~ 10
D50
Text GLabel -2100 4850 2    50   Input ~ 10
D30
Text GLabel -100 4200 2    50   Input ~ 10
D32
Text GLabel -100 4300 2    50   Input ~ 10
D34
Text GLabel -100 4400 2    50   Input ~ 10
D36
Text GLabel -100 4500 2    50   Input ~ 10
D38
Text GLabel -100 4600 2    50   Input ~ 10
D40
Text GLabel -950 5400 1    50   Input ~ 10
D48
Text GLabel -100 4900 2    50   Input ~ 10
D46
Text GLabel -100 4800 2    50   Input ~ 10
D44
Text GLabel -100 4700 2    50   Input ~ 10
D42
Text GLabel -2100 4450 2    50   Input ~ 10
D22
Text GLabel -2100 4350 2    50   Input ~ 10
D20
Text GLabel -2100 4250 2    50   Input ~ 10
D18
Text GLabel -2100 4050 2    50   Input ~ 10
D14
Text GLabel -2100 4150 2    50   Input ~ 10
D16
Text GLabel -2100 3450 2    50   Input ~ 10
D2
Text GLabel -2600 3650 0    50   Input ~ 10
D7
Text GLabel -2600 3750 0    50   Input ~ 10
D9
Text GLabel -2600 4150 0    50   Input ~ 10
D17
Text GLabel -2600 3850 0    50   Input ~ 10
D11
Text GLabel -600 3500 0    50   Input ~ 10
A3
Text GLabel -600 3600 0    50   Input ~ 10
A5
Text GLabel -600 3400 0    50   Input ~ 10
A1
Text GLabel -600 3700 0    50   Input ~ 10
A7
Text GLabel -2600 3550 0    50   Input ~ 10
D5
Text GLabel -2600 3450 0    50   Input ~ 10
D3
Text GLabel -2600 3950 0    50   Input ~ 10
D13
Text GLabel -2600 4050 0    50   Input ~ 10
D15
Text GLabel -2600 4250 0    50   Input ~ 10
D19
Text GLabel -2600 4350 0    50   Input ~ 10
D21
Text GLabel -600 3800 0    50   Input ~ 10
A9
Text GLabel -600 3900 0    50   Input ~ 10
A11
Text GLabel -600 4000 0    50   Input ~ 10
A13
Text GLabel -600 4100 0    50   Input ~ 10
A15
Text GLabel -2600 4450 0    50   Input ~ 10
D23
Text GLabel -2600 4550 0    50   Input ~ 10
D25
Text GLabel -2600 4650 0    50   Input ~ 10
D27
Text GLabel -2600 4750 0    50   Input ~ 10
D29
Text GLabel -1150 4350 3    50   Input ~ 10
D53
Text GLabel -1050 4350 3    50   Input ~ 10
D51
Text GLabel -2600 4850 0    50   Input ~ 10
D31
Text GLabel -600 4200 0    50   Input ~ 10
D33
Text GLabel -600 4300 0    50   Input ~ 10
D35
Text GLabel -600 4400 0    50   Input ~ 10
D37
Text GLabel -600 4600 0    50   Input ~ 10
D41
Text GLabel -600 4500 0    50   Input ~ 10
D39
Text GLabel -950 4350 3    50   Input ~ 10
D49
Text GLabel -600 4900 0    50   Input ~ 10
D47
Text GLabel -600 4800 0    50   Input ~ 10
D45
Text GLabel -600 4700 0    50   Input ~ 10
D43
Wire Wire Line
	-950 4600 -950 4350
Wire Wire Line
	-1050 4350 -1050 4600
Wire Wire Line
	-1150 4350 -1150 4600
Wire Wire Line
	-1150 5400 -1150 5100
Wire Wire Line
	-1050 5400 -1050 5100
Wire Wire Line
	-950 5400 -950 5100
$Comp
L Connector_Generic:Conn_02x06_Odd_Even JOYSTICK2R1
U 1 1 6780509F
P 8650 7700
F 0 "JOYSTICK2R1" H 8700 8117 50  0000 C CNN
F 1 "Conn_02x06_Odd_Even" H 8700 8026 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x06_P2.54mm_Vertical" H 8650 7700 50  0001 C CNN
F 3 "~" H 8650 7700 50  0001 C CNN
F 4 "C36191" H 0   0   50  0001 C CNN "LCSC"
	1    8650 7700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 ICSPb1
U 1 1 61AEF8DE
P 13300 7300
F 0 "ICSPb1" H 13380 7292 50  0000 L CNN
F 1 "Conn_01x02" H 13380 7201 50  0000 L CNN
F 2 "" H 13300 7300 50  0001 C CNN
F 3 "~" H 13300 7300 50  0001 C CNN
	1    13300 7300
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 ICSPa1
U 1 1 619C9E2C
P 13300 7200
F 0 "ICSPa1" H 13380 7192 50  0000 L CNN
F 1 "Conn_01x02" H 13380 7101 50  0000 L CNN
F 2 "" H 13300 7200 50  0001 C CNN
F 3 "~" H 13300 7200 50  0001 C CNN
	1    13300 7200
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 ICSPc1
U 1 1 61A5CDFC
P 13300 7400
F 0 "ICSPc1" H 13380 7392 50  0000 L CNN
F 1 "Conn_01x02" H 13380 7301 50  0000 L CNN
F 2 "" H 13300 7400 50  0001 C CNN
F 3 "~" H 13300 7400 50  0001 C CNN
	1    13300 7400
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even ICSP1
U 1 1 628AEF2D
P 13450 7500
F 0 "ICSP1" H 13500 7817 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 13500 7726 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x03_P2.54mm_Vertical" H 13450 7500 50  0001 C CNN
F 3 "~" H 13450 7500 50  0001 C CNN
F 4 "C2897404" H -350 500 50  0001 C CNN "LCSC"
	1    13450 7500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	12900 7400 13150 7400
Wire Wire Line
	12900 7500 13150 7500
Wire Wire Line
	13400 7500 13650 7500
Wire Wire Line
	13400 7600 13650 7600
Wire Wire Line
	13400 7400 13650 7400
Wire Wire Line
	12900 7600 13150 7600
Connection ~ 13150 7400
Wire Wire Line
	13150 7400 13300 7400
Connection ~ 13150 7500
Wire Wire Line
	13150 7500 13300 7500
Connection ~ 13150 7600
Wire Wire Line
	13150 7600 13300 7600
Connection ~ 13650 7400
Wire Wire Line
	13650 7400 13700 7400
Connection ~ 13650 7500
Wire Wire Line
	13650 7500 13800 7500
Connection ~ 13650 7600
Wire Wire Line
	13650 7600 13700 7600
$Comp
L AON6411:AON6411 Q46
U 1 1 629348A8
P 12550 3500
F 0 "Q46" V 12940 3500 50  0000 C CNN
F 1 "AON6411" V 12849 3500 50  0000 C CNN
F 2 "ALOM_DFN5X6_8L_EP1_P" H 12550 3500 50  0001 L BNN
F 3 "" H 12550 3500 50  0001 L BNN
F 4 "Alpha & Omega Semiconductor" H 12550 3500 50  0001 L BNN "MANUFACTURER"
F 5 "C81007" V 12550 3500 50  0001 C CNN "LCSC"
	1    12550 3500
	0    1    -1   0   
$EndComp
Wire Wire Line
	12250 3400 12150 3500
Wire Wire Line
	12850 3400 12850 3500
Wire Wire Line
	12450 3800 12650 3800
$Comp
L AON6411:AON6411 Q45
U 1 1 633188FE
P 14750 3500
F 0 "Q45" V 15140 3500 50  0000 C CNN
F 1 "AON6411" V 15049 3500 50  0000 C CNN
F 2 "ALOM_DFN5X6_8L_EP1_P" H 14750 3500 50  0001 L BNN
F 3 "" H 14750 3500 50  0001 L BNN
F 4 "Alpha & Omega Semiconductor" H 14750 3500 50  0001 L BNN "MANUFACTURER"
F 5 "C81007" V 14750 3500 50  0001 C CNN "LCSC"
	1    14750 3500
	0    1    -1   0   
$EndComp
Wire Wire Line
	15050 3400 15050 3500
Wire Wire Line
	14450 3400 14450 3500
Wire Wire Line
	12650 4100 13050 4100
Connection ~ 12850 3500
Wire Wire Line
	12850 3500 13200 3500
Connection ~ 13050 4100
Wire Wire Line
	13050 4100 13200 4100
$EndSCHEMATC
