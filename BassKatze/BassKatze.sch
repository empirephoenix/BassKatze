EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
L Audio:MSGEQ7 U2
U 1 1 5DA735C0
P 7350 3300
F 0 "U2" H 7350 3981 50  0000 C CNN
F 1 "MSGEQ7" H 7350 3890 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7350 3300 50  0001 C CNN
F 3 "http://mix-sig.com/images/datasheets/MSGEQ7.pdf" H 7350 3300 50  0001 C CNN
	1    7350 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise ISP1
U 1 1 5DA75700
P 7400 1300
F 0 "ISP1" H 7450 1617 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 7450 1526 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 7400 1300 50  0001 C CNN
F 3 "~" H 7400 1300 50  0001 C CNN
	1    7400 1300
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_ATmega:ATmega328-AU U1
U 1 1 5DA7F3DC
P 4150 2300
F 0 "U1" H 4150 711 50  0000 C CNN
F 1 "ATmega328-AU" H 4150 620 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 4150 2300 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 4150 2300 50  0001 C CNN
	1    4150 2300
	1    0    0    -1  
$EndComp
Text GLabel 7150 1200 0    50   Input ~ 0
MISO
Text GLabel 7150 1300 0    50   Input ~ 0
SCK
Text GLabel 7150 1400 0    50   Input ~ 0
Reset
Text GLabel 7750 1200 2    50   Input ~ 0
5V_Programmer
Text GLabel 7750 1300 2    50   Input ~ 0
MOSI
Text GLabel 7750 1400 2    50   Input ~ 0
GND
Wire Wire Line
	7200 1200 7150 1200
Wire Wire Line
	7150 1300 7200 1300
Wire Wire Line
	7200 1400 7150 1400
Wire Wire Line
	7700 1200 7750 1200
Wire Wire Line
	7750 1300 7700 1300
Wire Wire Line
	7700 1400 7750 1400
Text GLabel 4150 4100 3    50   Input ~ 0
GND
Text GLabel 7350 3900 3    50   Input ~ 0
GND
Text GLabel 8000 3400 2    50   Input ~ 0
RAW_Spectrum
Text GLabel 8000 3100 2    50   Input ~ 0
EQ_Reset
Text GLabel 8000 3000 2    50   Input ~ 0
EQ_Band
Text GLabel 7350 2550 1    50   Input ~ 0
PWR
Text GLabel 5950 3300 0    50   Input ~ 0
MIC
Text GLabel 4850 1500 2    50   Input ~ 0
MISO
Text GLabel 4850 1400 2    50   Input ~ 0
MOSI
Text GLabel 4800 2000 2    50   Input ~ 0
RAW_Spectrum
Text GLabel 4800 2600 2    50   Input ~ 0
Reset
$Comp
L tp4056:TP4056 U3
U 1 1 5DA87CBF
P 1650 7100
F 0 "U3" H 1650 7637 60  0000 C CNN
F 1 "TP4056" H 1650 7531 60  0000 C CNN
F 2 "Package_SO:HSOP-8-1EP_3.9x4.9mm_P1.27mm_EP2.41x3.1mm_ThermalVias" H 1650 7100 60  0001 C CNN
F 3 "" H 1650 7100 60  0001 C CNN
	1    1650 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5DAAC4E4
P 2200 7000
F 0 "C2" H 2315 7046 50  0000 L CNN
F 1 "10uF" H 2315 6955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2238 6850 50  0001 C CNN
F 3 "~" H 2200 7000 50  0001 C CNN
	1    2200 7000
	1    0    0    -1  
$EndComp
Text GLabel 2200 7150 2    50   Input ~ 0
GND
Text GLabel 2200 6850 2    50   Input ~ 0
BAT+
$Comp
L Device:R RProg1
U 1 1 5DAAD5B2
P 2150 7400
F 0 "RProg1" H 2220 7446 50  0000 L CNN
F 1 "1.2kOhm" H 2220 7355 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 2080 7400 50  0001 C CNN
F 3 "~" H 2150 7400 50  0001 C CNN
	1    2150 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 6850 2200 6850
Wire Wire Line
	2150 7150 2200 7150
Text GLabel 2150 7550 3    50   Input ~ 0
GND
Text GLabel 1650 7550 3    50   Input ~ 0
GND
Wire Wire Line
	1700 7500 1650 7500
Wire Wire Line
	1650 7500 1650 7550
Connection ~ 1650 7500
Text GLabel 1100 7250 0    50   Input ~ 0
STDBY
Text GLabel 1100 7150 0    50   Input ~ 0
CHRG
$Comp
L Device:R R1
U 1 1 5DAB37D4
P 1150 6600
F 0 "R1" H 1220 6646 50  0000 L CNN
F 1 "0.4Ohm" H 1220 6555 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 1080 6600 50  0001 C CNN
F 3 "~" H 1150 6600 50  0001 C CNN
	1    1150 6600
	1    0    0    -1  
$EndComp
Text GLabel 1150 6450 1    50   Input ~ 0
5V_IN
Wire Wire Line
	1150 6750 1150 6850
Wire Wire Line
	1150 6950 1150 6850
Connection ~ 1150 6850
Wire Wire Line
	1100 7150 1150 7150
Wire Wire Line
	1150 7250 1100 7250
$Comp
L Device:C C1
U 1 1 5DAB7F18
P 1000 6850
F 0 "C1" V 748 6850 50  0000 C CNN
F 1 "10uF" V 839 6850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1038 6700 50  0001 C CNN
F 3 "~" H 1000 6850 50  0001 C CNN
	1    1000 6850
	0    1    1    0   
$EndComp
Text GLabel 850  6850 3    50   Input ~ 0
GND
$Comp
L Connector:USB_B_Micro J1
U 1 1 5DAD38D1
P 1750 5000
F 0 "J1" V 1761 5330 50  0000 L CNN
F 1 "USB_B_Micro" V 1852 5330 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 1900 4950 50  0001 C CNN
F 3 "~" H 1900 4950 50  0001 C CNN
	1    1750 5000
	0    1    1    0   
$EndComp
Text GLabel 1300 5000 0    50   Input ~ 0
GND
Text GLabel 1950 5350 3    50   Input ~ 0
5V_IN
Wire Wire Line
	1950 5300 1950 5350
Wire Wire Line
	1300 5000 1350 5000
Text GLabel 1600 7500 0    50   Input ~ 0
BAT-
Wire Wire Line
	1600 7500 1650 7500
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5DADAC8C
P 1850 5950
F 0 "J2" V 1912 5994 50  0000 L CNN
F 1 "Conn_01x02_Male" V 2003 5994 50  0000 L CNN
F 2 "Connector_JST:JST_EH_B2B-EH-A_1x02_P2.50mm_Vertical" H 1850 5950 50  0001 C CNN
F 3 "~" H 1850 5950 50  0001 C CNN
	1    1850 5950
	0    1    1    0   
$EndComp
Text GLabel 1750 6200 3    50   Input ~ 0
BAT+
Text GLabel 1850 6200 3    50   Input ~ 0
BAT-
Wire Wire Line
	1750 6150 1750 6200
Wire Wire Line
	1850 6150 1850 6200
Text GLabel 4850 1600 2    50   Input ~ 0
SCK
Wire Wire Line
	4750 1400 4850 1400
Wire Wire Line
	4850 1500 4750 1500
Wire Wire Line
	4750 1600 4850 1600
Wire Wire Line
	4750 2000 4800 2000
Wire Wire Line
	4750 2600 4800 2600
Text GLabel 4800 2800 2    50   Input ~ 0
EQ_Band
Text GLabel 4800 2900 2    50   Input ~ 0
EQ_Reset
Wire Wire Line
	4750 2800 4800 2800
Wire Wire Line
	4800 2900 4750 2900
Text GLabel 4800 3000 2    50   Input ~ 0
LED1
Text GLabel 4800 3100 2    50   Input ~ 0
LED2
Wire Wire Line
	4750 3000 4800 3000
Wire Wire Line
	4750 3100 4800 3100
Text GLabel 4150 750  1    50   Input ~ 0
PWR
Wire Wire Line
	4150 750  4150 800 
Wire Wire Line
	4150 3800 4150 4100
Wire Wire Line
	7850 3100 8000 3100
Wire Wire Line
	8000 3000 7850 3000
Wire Wire Line
	7850 3400 8000 3400
$Comp
L Device:C C3
U 1 1 5DB00FEF
P 6600 3300
F 0 "C3" V 6258 3300 50  0000 C CNN
F 1 "0.1uF" V 6349 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6440 3300 50  0000 C CNN
F 3 "~" H 6600 3300 50  0001 C CNN
	1    6600 3300
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5DB02B41
P 6200 3300
F 0 "R2" V 5993 3300 50  0000 C CNN
F 1 "22KOhm" V 6084 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6130 3300 50  0001 C CNN
F 3 "~" H 6200 3300 50  0001 C CNN
	1    6200 3300
	0    1    1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 5DB05B69
P 7850 3850
F 0 "C6" H 7965 3896 50  0000 L CNN
F 1 "0.1uF" H 7965 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7888 3700 50  0001 C CNN
F 3 "~" H 7850 3850 50  0001 C CNN
	1    7850 3850
	1    0    0    -1  
$EndComp
Text GLabel 7850 4100 3    50   Input ~ 0
GND
Wire Wire Line
	7850 3600 7850 3700
Wire Wire Line
	7850 4000 7850 4100
$Comp
L Device:C C4
U 1 1 5DB09D3F
P 6750 3750
F 0 "C4" H 6865 3796 50  0000 L CNN
F 1 "33pF" H 6865 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6788 3600 50  0001 C CNN
F 3 "~" H 6750 3750 50  0001 C CNN
	1    6750 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5DB0A2DB
P 6550 3600
F 0 "R3" V 6343 3600 50  0000 C CNN
F 1 "22KOhm" V 6434 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6480 3600 50  0001 C CNN
F 3 "~" H 6550 3600 50  0001 C CNN
	1    6550 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 3600 6750 3600
Wire Wire Line
	6750 3600 6850 3600
Connection ~ 6750 3600
Wire Wire Line
	6750 3300 6850 3300
Text GLabel 6350 3600 0    50   Input ~ 0
PWR
Wire Wire Line
	6350 3600 6400 3600
Wire Wire Line
	6350 3300 6450 3300
Wire Wire Line
	6050 3300 5950 3300
Wire Wire Line
	7350 2550 7350 2700
$Comp
L Device:C C5
U 1 1 5DB0FA7E
P 7200 2700
F 0 "C5" V 6948 2700 50  0000 C CNN
F 1 "0.1uF" V 7039 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7238 2550 50  0001 C CNN
F 3 "~" H 7200 2700 50  0001 C CNN
	1    7200 2700
	0    1    1    0   
$EndComp
Connection ~ 7350 2700
Wire Wire Line
	7350 2700 7350 2800
Text GLabel 7050 2700 0    50   Input ~ 0
GND
Text GLabel 6750 3900 3    50   Input ~ 0
GND
Wire Wire Line
	7350 3800 7350 3900
$EndSCHEMATC
