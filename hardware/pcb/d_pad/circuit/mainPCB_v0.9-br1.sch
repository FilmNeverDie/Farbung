EESchema Schematic File Version 4
LIBS:mainPCB_v0.9-b-cache
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
Wire Notes Line
	12550 11250 12500 11250
Wire Notes Line
	12950 9950 13000 9950
$Comp
L Mechanical:MountingHole H2
U 1 1 615435D2
P 11050 5150
F 0 "H2" H 11150 5196 50  0000 L CNN
F 1 "MountingHole" H 11150 5105 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 11050 5150 50  0001 C CNN
F 3 "~" H 11050 5150 50  0001 C CNN
	1    11050 5150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 615BC407
P 11000 5500
F 0 "H3" H 11100 5546 50  0000 L CNN
F 1 "MountingHole" H 11100 5455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 11000 5500 50  0001 C CNN
F 3 "~" H 11000 5500 50  0001 C CNN
	1    11000 5500
	1    0    0    -1  
$EndComp
Text Notes 9200 9300 0    50   ~ 0
output -high -> BC547-short -> IRF540 -open -> OFF
$Comp
L Connector_Generic:Conn_01x16 lcd_socket1
U 1 1 6301FA72
P 9900 7250
F 0 "lcd_socket1" H 9980 7242 50  0000 L CNN
F 1 "Conn_01x16" H 9980 7151 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x16_P2.54mm_Vertical" H 9900 7250 50  0001 C CNN
F 3 "~" H 9900 7250 50  0001 C CNN
F 4 "C49661" H 0   0   50  0001 C CNN "LCSC"
	1    9900 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0132
U 1 1 63736B91
P 9400 6400
F 0 "#PWR0132" H 9400 6250 50  0001 C CNN
F 1 "+5V" H 9415 6573 50  0000 C CNN
F 2 "" H 9400 6400 50  0001 C CNN
F 3 "" H 9400 6400 50  0001 C CNN
	1    9400 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0153
U 1 1 637DB2E5
P 9200 7000
F 0 "#PWR0153" H 9200 6750 50  0001 C CNN
F 1 "GND" H 9205 6827 50  0000 C CNN
F 2 "" H 9200 7000 50  0001 C CNN
F 3 "" H 9200 7000 50  0001 C CNN
	1    9200 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 6650 9400 6650
Wire Wire Line
	9400 6650 9400 6450
$Comp
L Device:R_Potentiometer_Trim RV1
U 1 1 61963342
P 9300 6750
F 0 "RV1" H 9231 6796 50  0000 R CNN
F 1 "R_Potentiometer_Trim" H 9231 6705 50  0000 R CNN
F 2 "Potentiometer_SMD:VG039NCHXTB102" H 9300 6750 50  0001 C CNN
F 3 "~" H 9300 6750 50  0001 C CNN
F 4 "C128543" H 0   0   50  0001 C CNN "LCSC"
	1    9300 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 6750 9450 6750
Wire Wire Line
	9200 6550 9200 6900
Wire Wire Line
	9300 6900 9200 6900
Connection ~ 9200 6900
Wire Wire Line
	9200 6900 9200 7000
Wire Wire Line
	9300 6900 9300 6950
Wire Wire Line
	9300 6950 9700 6950
Connection ~ 9300 6900
Wire Wire Line
	9300 6600 9300 6450
Wire Wire Line
	9300 6450 9400 6450
Connection ~ 9400 6450
Wire Wire Line
	9400 6450 9400 6400
Wire Wire Line
	9700 6550 9200 6550
Wire Wire Line
	9300 6450 9100 6450
Connection ~ 9300 6450
Wire Wire Line
	9700 7950 9100 7950
Wire Wire Line
	9100 7950 9100 6450
Wire Wire Line
	9700 8050 9400 8050
$Comp
L Connector_Generic:Conn_01x10 lcd_short_in1
U 1 1 6253BBAE
P 8500 8550
F 0 "lcd_short_in1" H 8580 8592 50  0000 L CNN
F 1 "JST_XH-A-1x10" H 8580 8501 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B10B-XH-A_1x10_P2.50mm_Vertical" H 8500 8550 50  0001 C CNN
F 3 "~" H 8500 8550 50  0001 C CNN
F 4 "C144400" H 0   0   50  0001 C CNN "LCSC"
	1    8500 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 8550 8000 8550
Wire Wire Line
	8300 8650 8000 8650
Wire Wire Line
	8300 8750 8000 8750
Wire Wire Line
	8300 8850 8000 8850
Text Label 8000 8550 0    50   ~ 0
DB4i
Text Label 8000 8650 0    50   ~ 0
DB5i
Text Label 8000 8750 0    50   ~ 0
DB6i
Text Label 8000 8850 0    50   ~ 0
DB7i
Wire Wire Line
	8300 8350 8000 8350
Text Label 8000 8350 0    50   ~ 0
lcd_RSi
Text Label 8000 8450 0    50   ~ 0
lcd_eni
Wire Wire Line
	8300 8450 8000 8450
Wire Wire Line
	8300 8250 8000 8250
$Comp
L power:GND #PWR0157
U 1 1 6253BBC1
P 7900 8150
F 0 "#PWR0157" H 7900 7900 50  0001 C CNN
F 1 "GND" H 7905 7977 50  0000 C CNN
F 2 "" H 7900 8150 50  0001 C CNN
F 3 "" H 7900 8150 50  0001 C CNN
	1    7900 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 8150 8300 8150
Wire Wire Line
	8000 8250 8000 8000
$Comp
L power:+5V #PWR0160
U 1 1 6253BBC9
P 8000 8000
F 0 "#PWR0160" H 8000 7850 50  0001 C CNN
F 1 "+5V" H 8015 8173 50  0000 C CNN
F 2 "" H 8000 8000 50  0001 C CNN
F 3 "" H 8000 8000 50  0001 C CNN
	1    8000 8000
	1    0    0    -1  
$EndComp
Text Label 8000 8950 0    50   ~ 0
lcd_backi
$Comp
L power:GND #PWR0170
U 1 1 6253BBD1
P 7900 9050
F 0 "#PWR0170" H 7900 8800 50  0001 C CNN
F 1 "GND" H 7905 8877 50  0000 C CNN
F 2 "" H 7900 9050 50  0001 C CNN
F 3 "" H 7900 9050 50  0001 C CNN
	1    7900 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 9050 8300 9050
Wire Wire Line
	9700 7550 9400 7550
Wire Wire Line
	9700 7650 9400 7650
Wire Wire Line
	9700 7750 9400 7750
Wire Wire Line
	9700 7850 9400 7850
Text Label 9400 7550 0    50   ~ 0
DB4i
Text Label 9400 7650 0    50   ~ 0
DB5i
Text Label 9400 7750 0    50   ~ 0
DB6i
Text Label 9400 7850 0    50   ~ 0
DB7i
Wire Wire Line
	9700 6850 9400 6850
Text Label 9400 6850 0    50   ~ 0
lcd_RSi
Text Label 9400 7050 0    50   ~ 0
lcd_eni
Wire Wire Line
	9700 7050 9400 7050
NoConn ~ 9700 7150
NoConn ~ 9700 7250
NoConn ~ 9700 7350
NoConn ~ 9700 7450
Wire Wire Line
	11350 8550 11700 8550
Text Label 11700 8550 2    50   ~ 10
led_wokei
$Comp
L power:+5V #PWR0182
U 1 1 62FC15DB
P 10600 8550
F 0 "#PWR0182" H 10600 8400 50  0001 C CNN
F 1 "+5V" H 10615 8723 50  0000 C CNN
F 2 "" H 10600 8550 50  0001 C CNN
F 3 "" H 10600 8550 50  0001 C CNN
	1    10600 8550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0183
U 1 1 62FC15E1
P 11600 8950
F 0 "#PWR0183" H 11600 8700 50  0001 C CNN
F 1 "GND" H 11605 8777 50  0000 C CNN
F 2 "" H 11600 8950 50  0001 C CNN
F 3 "" H 11600 8950 50  0001 C CNN
	1    11600 8950
	1    0    0    -1  
$EndComp
Text Label 11850 8650 2    50   ~ 10
selecti
Text Label 11850 8750 2    50   ~ 10
canceli
Text Label 11850 8850 2    50   ~ 10
sleep_wakei
$Comp
L Connector_Generic:Conn_02x05_Odd_Even UI_PCB_in1
U 1 1 62FC15EA
P 11050 8750
F 0 "UI_PCB_in1" H 11100 9167 50  0000 C CNN
F 1 "321010SG0ABK00A01" H 11100 9076 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x05_P2.54mm_Vertical" H 11050 8750 50  0001 C CNN
F 3 "~" H 11050 8750 50  0001 C CNN
F 4 "C49661" H 0   0   50  0001 C CNN "LCSC"
	1    11050 8750
	1    0    0    -1  
$EndComp
Text Label 10400 8950 0    50   ~ 10
Dpad_downi
Text Label 10400 8850 0    50   ~ 10
Dpad_righti
Text Label 10400 8750 0    50   ~ 10
Dpad_lefti
Text Label 10400 8650 0    50   ~ 10
Dpad_upi
Wire Wire Line
	10850 8950 10400 8950
Wire Wire Line
	10850 8850 10400 8850
Wire Wire Line
	10400 8750 10850 8750
Wire Wire Line
	10850 8650 10400 8650
Wire Wire Line
	11850 8850 11350 8850
Wire Wire Line
	11850 8650 11350 8650
Wire Wire Line
	11600 8950 11350 8950
Wire Wire Line
	10600 8550 10850 8550
Wire Wire Line
	11350 8750 11850 8750
Text Label 10650 6850 0    50   ~ 10
Dpad_downi
Text Label 10650 6750 0    50   ~ 10
Dpad_righti
Text Label 10650 6650 0    50   ~ 10
Dpad_lefti
Text Label 10650 6550 0    50   ~ 10
Dpad_upi
Text Label 11950 7900 2    50   ~ 10
led_wokei
Text Label 10650 6950 0    50   ~ 10
selecti
Text Label 10650 7050 0    50   ~ 10
canceli
Text Label 10450 7450 0    50   ~ 10
sleep_wakei
$Comp
L Switch:SW_Push SW5
U 1 1 63DDBBAA
P 12550 6650
F 0 "SW5" H 12550 6935 50  0000 C CNN
F 1 "TS-1103S-B-G" H 12550 6844 50  0000 C CNN
F 2 "Button_Switch_SMD:TS-1103S-X-X" H 12550 6850 50  0001 C CNN
F 3 "~" H 12550 6850 50  0001 C CNN
F 4 "C480306" H 50  -300 50  0001 C CNN "LCSC"
	1    12550 6650
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW6
U 1 1 640CE474
P 12550 6850
F 0 "SW6" H 12550 7135 50  0000 C CNN
F 1 "TS-1103S-B-G" H 12550 7044 50  0000 C CNN
F 2 "Button_Switch_SMD:TS-1103S-X-X" H 12550 7050 50  0001 C CNN
F 3 "~" H 12550 7050 50  0001 C CNN
F 4 "C480306" H 50  -300 50  0001 C CNN "LCSC"
	1    12550 6850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW7
U 1 1 642476FC
P 12550 7050
F 0 "SW7" H 12550 7335 50  0000 C CNN
F 1 "TS-1103S-B-G" H 12550 7244 50  0000 C CNN
F 2 "Button_Switch_SMD:TS-1103S-X-X" H 12550 7250 50  0001 C CNN
F 3 "~" H 12550 7250 50  0001 C CNN
F 4 "C480306" H 50  -300 50  0001 C CNN "LCSC"
	1    12550 7050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_SPST4P_LED SW1
U 1 1 643C5617
P 11300 7700
F 0 "SW1" H 11057 7799 50  0000 R CNN
F 1 "ML6-H4K12PGVA" H 11057 7708 50  0000 C BNN
F 2 "Button_Switch_THT:ML6-H4" H 11300 8000 50  0001 C CNN
F 3 "~" H 11300 8000 50  0001 C CNN
F 4 "C225014" H 0   0   50  0001 C CNN "LCSC"
	1    11300 7700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11300 7900 11950 7900
NoConn ~ 11500 7600
$Comp
L power:GND #PWR0185
U 1 1 65F65F3D
P 12750 7100
F 0 "#PWR0185" H 12750 6850 50  0001 C CNN
F 1 "GND" H 12755 6927 50  0000 C CNN
F 2 "" H 12750 7100 50  0001 C CNN
F 3 "" H 12750 7100 50  0001 C CNN
	1    12750 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	12750 7100 12750 7050
Wire Wire Line
	12750 6550 12150 6550
Connection ~ 12750 6650
Wire Wire Line
	12750 6650 12750 6550
Connection ~ 12750 6850
Wire Wire Line
	12750 6850 12750 6750
Connection ~ 12750 7050
Wire Wire Line
	12750 7050 12750 6950
Wire Wire Line
	12150 6950 12750 6950
Connection ~ 12750 6950
Wire Wire Line
	12750 6950 12750 6850
Wire Wire Line
	12150 6750 12750 6750
Connection ~ 12750 6750
Wire Wire Line
	12750 6750 12750 6650
$Comp
L power:GND #PWR0186
U 1 1 6672CDFE
P 10800 7900
F 0 "#PWR0186" H 10800 7650 50  0001 C CNN
F 1 "GND" H 10805 7727 50  0000 C CNN
F 2 "" H 10800 7900 50  0001 C CNN
F 3 "" H 10800 7900 50  0001 C CNN
	1    10800 7900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 7900 10950 7900
Wire Wire Line
	10650 7050 12350 7050
Wire Wire Line
	10650 6950 11750 6950
Wire Wire Line
	10650 6850 12350 6850
Wire Wire Line
	10650 6750 11750 6750
Wire Wire Line
	10650 6650 12350 6650
Wire Wire Line
	10650 6550 11750 6550
$Comp
L Switch:SW_Push SW4
U 1 1 6418AE3F
P 11950 6950
F 0 "SW4" H 11950 7235 50  0000 C CNN
F 1 "TS-1103S-B-G" H 11950 7144 50  0000 C CNN
F 2 "Button_Switch_SMD:TS-1103S-X-X" H 11950 7150 50  0001 C CNN
F 3 "~" H 11950 7150 50  0001 C CNN
F 4 "C480306" H 50  -300 50  0001 C CNN "LCSC"
	1    11950 6950
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 64011B2F
P 11950 6750
F 0 "SW3" H 11950 7035 50  0000 C CNN
F 1 "TS-1103S-B-G" H 11950 6944 50  0000 C CNN
F 2 "Button_Switch_SMD:TS-1103S-X-X" H 11950 6950 50  0001 C CNN
F 3 "~" H 11950 6950 50  0001 C CNN
F 4 "C480306" H 50  -300 50  0001 C CNN "LCSC"
	1    11950 6750
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 63D1BCA9
P 11950 6550
F 0 "SW2" H 11950 6835 50  0000 C CNN
F 1 "TS-1103S-B-G" H 11950 6744 50  0000 C CNN
F 2 "Button_Switch_SMD:TS-1103S-X-X" H 11950 6750 50  0001 C CNN
F 3 "~" H 11950 6750 50  0001 C CNN
F 4 "C480306" H 50  -300 50  0001 C CNN "LCSC"
	1    11950 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R53
U 1 1 6541E9A5
P 11450 7500
F 0 "R53" V 11657 7500 50  0000 C CNN
F 1 "1k-0.25W" V 11566 7500 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 11380 7500 50  0001 C CNN
F 3 "~" H 11450 7500 50  0001 C CNN
F 4 "C4410" H 0   0   50  0001 C CNN "LCSC"
	1    11450 7500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11850 7500 11600 7500
$Comp
L power:+5V #PWR0184
U 1 1 656548C5
P 11850 7500
F 0 "#PWR0184" H 11850 7350 50  0001 C CNN
F 1 "+5V" H 11865 7673 50  0000 C CNN
F 2 "" H 11850 7500 50  0001 C CNN
F 3 "" H 11850 7500 50  0001 C CNN
	1    11850 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 8950 8300 8950
Connection ~ 8300 8950
Wire Wire Line
	9400 8050 9400 8950
Wire Wire Line
	8300 8950 9400 8950
$Comp
L Mechanical:MountingHole H5
U 1 1 61726FED
P 10900 6050
F 0 "H5" H 11000 6096 50  0000 L CNN
F 1 "MountingHole" H 11000 6005 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.5mm" H 10900 6050 50  0001 C CNN
F 3 "~" H 10900 6050 50  0001 C CNN
	1    10900 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	11200 7450 11200 7500
Wire Wire Line
	10450 7450 11200 7450
$Comp
L power:GND #PWR0101
U 1 1 619A4CA6
P 13150 7950
F 0 "#PWR0101" H 13150 7700 50  0001 C CNN
F 1 "GND" H 13155 7777 50  0000 C CNN
F 2 "" H 13150 7950 50  0001 C CNN
F 3 "" H 13150 7950 50  0001 C CNN
	1    13150 7950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 62F076D5
P 9200 4500
F 0 "H1" H 9300 4546 50  0000 L CNN
F 1 "MountingHole" H 9300 4455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9200 4500 50  0001 C CNN
F 3 "~" H 9200 4500 50  0001 C CNN
	1    9200 4500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H7
U 1 1 62F07F23
P 10200 4300
F 0 "H7" H 10300 4346 50  0000 L CNN
F 1 "MountingHole" H 10300 4255 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10200 4300 50  0001 C CNN
F 3 "~" H 10200 4300 50  0001 C CNN
	1    10200 4300
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 62F093CE
P 9300 4950
F 0 "H4" H 9400 4996 50  0000 L CNN
F 1 "MountingHole" H 9400 4905 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9300 4950 50  0001 C CNN
F 3 "~" H 9300 4950 50  0001 C CNN
	1    9300 4950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 62F0A87E
P 10150 4850
F 0 "H6" H 10250 4896 50  0000 L CNN
F 1 "MountingHole" H 10250 4805 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10150 4850 50  0001 C CNN
F 3 "~" H 10150 4850 50  0001 C CNN
	1    10150 4850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
