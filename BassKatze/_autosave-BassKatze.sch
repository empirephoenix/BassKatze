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
F 2 "" H 7350 3300 50  0001 C CNN
F 3 "http://mix-sig.com/images/datasheets/MSGEQ7.pdf" H 7350 3300 50  0001 C CNN
	1    7350 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT1
U 1 1 5DA7680F
P 2350 3200
F 0 "BT1" H 2468 3296 50  0000 L CNN
F 1 "Battery_Cell" H 2468 3205 50  0000 L CNN
F 2 "" V 2350 3260 50  0001 C CNN
F 3 "~" V 2350 3260 50  0001 C CNN
	1    2350 3200
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
Text GLabel 2350 3400 3    50   Input ~ 0
GND
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
Text GLabel 6750 3300 0    50   Input ~ 0
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
L tp4056:TP4056 U?
U 1 1 5DA87CBF
P 6300 2150
F 0 "U?" H 6300 2687 60  0000 C CNN
F 1 "TP4056" H 6300 2581 60  0000 C CNN
F 2 "" H 6300 2150 60  0001 C CNN
F 3 "" H 6300 2150 60  0001 C CNN
	1    6300 2150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
