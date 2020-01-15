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
P 8650 2100
F 0 "U2" H 8650 2781 50  0000 C CNN
F 1 "MSGEQ7" H 8650 2690 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 8650 2100 50  0001 C CNN
F 3 "http://mix-sig.com/images/datasheets/MSGEQ7.pdf" H 8650 2100 50  0001 C CNN
	1    8650 2100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise ISP1
U 1 1 5DA75700
P 1400 1150
F 0 "ISP1" H 1450 1467 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 1450 1376 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 1400 1150 50  0001 C CNN
F 3 "~" H 1400 1150 50  0001 C CNN
	1    1400 1150
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
Text GLabel 1150 1050 0    50   Input ~ 0
MISO
Text GLabel 1150 1250 0    50   Input ~ 0
SCK
Text GLabel 1750 1150 2    50   Input ~ 0
Reset
Text GLabel 1750 1250 2    50   Input ~ 0
MOSI
Text GLabel 1750 1050 2    50   Input ~ 0
GND
Wire Wire Line
	1200 1050 1150 1050
Wire Wire Line
	1200 1250 1150 1250
Wire Wire Line
	1700 1050 1750 1050
Wire Wire Line
	1750 1150 1700 1150
Wire Wire Line
	1700 1250 1750 1250
Text GLabel 4150 4100 3    50   Input ~ 0
GND
Text GLabel 8650 2700 3    50   Input ~ 0
GND
Text GLabel 9300 2200 2    50   Input ~ 0
RAW_Spectrum
Text GLabel 9300 1900 2    50   Input ~ 0
EQ_Reset
Text GLabel 9300 1800 2    50   Input ~ 0
EQ_Band
Text GLabel 8650 1350 1    50   Input ~ 0
PWR
Text GLabel 4850 1500 2    50   Input ~ 0
MISO
Text GLabel 4850 1400 2    50   Input ~ 0
MOSI
Text GLabel 4750 2000 2    50   Input ~ 0
RAW_Spectrum
Text GLabel 5200 2700 2    50   Input ~ 0
Reset
Text GLabel 4950 6600 2    50   Input ~ 0
BAT+
Text GLabel 3150 6900 3    50   Input ~ 0
GND
Text GLabel 2650 6400 0    50   Input ~ 0
STDBY
Text GLabel 2650 6300 0    50   Input ~ 0
CHRG
Text GLabel 1900 6150 0    50   Input ~ 0
5V_IN
Text GLabel 2400 5850 1    50   Input ~ 0
GND
Text GLabel 1050 6700 0    50   Input ~ 0
GND
Text GLabel 1100 6800 0    50   Input ~ 0
5V_IN
Wire Wire Line
	1050 6700 1100 6700
Text GLabel 4950 6900 2    50   Input ~ 0
BAT-
Text GLabel 1100 6300 0    50   Input ~ 0
BAT+
Text GLabel 1100 6400 0    50   Input ~ 0
BAT-
Wire Wire Line
	1150 6300 1100 6300
Wire Wire Line
	1150 6400 1100 6400
Text GLabel 4850 1600 2    50   Input ~ 0
SCK
Wire Wire Line
	4750 1400 4850 1400
Wire Wire Line
	4850 1500 4750 1500
Wire Wire Line
	4750 1600 4850 1600
Text GLabel 5600 2650 2    50   Input ~ 0
EQ_Band
Text GLabel 5600 2750 2    50   Input ~ 0
EQ_Reset
Text GLabel 4150 750  1    50   Input ~ 0
PWR
Wire Wire Line
	4150 750  4150 800 
Wire Wire Line
	4150 3800 4150 4100
Wire Wire Line
	9150 1900 9300 1900
Wire Wire Line
	9300 1800 9150 1800
Wire Wire Line
	9150 2200 9300 2200
$Comp
L Device:C C3
U 1 1 5DB00FEF
P 7900 2100
F 0 "C3" V 7558 2100 50  0000 C CNN
F 1 "0.1uF" V 7649 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7740 2100 50  0000 C CNN
F 3 "~" H 7900 2100 50  0001 C CNN
	1    7900 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5DB02B41
P 7050 2500
F 0 "R2" V 6843 2500 50  0000 C CNN
F 1 "26KOhm" V 6934 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6980 2500 50  0001 C CNN
F 3 "~" H 7050 2500 50  0001 C CNN
	1    7050 2500
	-1   0    0    1   
$EndComp
$Comp
L Device:C C6
U 1 1 5DB05B69
P 9150 2650
F 0 "C6" H 9265 2696 50  0000 L CNN
F 1 "0.1uF" H 9265 2605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9188 2500 50  0001 C CNN
F 3 "~" H 9150 2650 50  0001 C CNN
	1    9150 2650
	1    0    0    -1  
$EndComp
Text GLabel 9150 2900 3    50   Input ~ 0
GND
Wire Wire Line
	9150 2400 9150 2500
Wire Wire Line
	9150 2800 9150 2900
$Comp
L Device:C C4
U 1 1 5DB09D3F
P 8050 2550
F 0 "C4" H 8165 2596 50  0000 L CNN
F 1 "33pF" H 8165 2505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8088 2400 50  0001 C CNN
F 3 "~" H 8050 2550 50  0001 C CNN
	1    8050 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5DB0A2DB
P 7850 2400
F 0 "R3" V 7643 2400 50  0000 C CNN
F 1 "200KOhm" V 7734 2400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7780 2400 50  0001 C CNN
F 3 "~" H 7850 2400 50  0001 C CNN
	1    7850 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	8000 2400 8050 2400
Wire Wire Line
	8050 2400 8150 2400
Connection ~ 8050 2400
Wire Wire Line
	8050 2100 8150 2100
Text GLabel 7650 2400 0    50   Input ~ 0
PWR
Wire Wire Line
	7650 2400 7700 2400
Wire Wire Line
	8650 1350 8650 1500
$Comp
L Device:C C5
U 1 1 5DB0FA7E
P 8500 1500
F 0 "C5" V 8248 1500 50  0000 C CNN
F 1 "0.1uF" V 8339 1500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8538 1350 50  0001 C CNN
F 3 "~" H 8500 1500 50  0001 C CNN
	1    8500 1500
	0    1    1    0   
$EndComp
Connection ~ 8650 1500
Wire Wire Line
	8650 1500 8650 1600
Text GLabel 8350 1500 0    50   Input ~ 0
GND
Text GLabel 8050 2750 3    50   Input ~ 0
GND
Wire Wire Line
	8650 2600 8650 2700
Text GLabel 4900 5850 2    50   Input ~ 0
PWR
Text GLabel 4800 3200 2    50   Input ~ 0
Button
Wire Wire Line
	4800 3200 4750 3200
$Comp
L LED:SK6812 D2
U 1 1 5DAAFF0A
P 1550 5150
F 0 "D2" H 1894 5196 50  0000 L CNN
F 1 "SK6812" H 1894 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 1600 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 1650 4775 50  0001 L TNN
	1    1550 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D3
U 1 1 5DAB1276
P 2150 5150
F 0 "D3" H 2494 5196 50  0000 L CNN
F 1 "SK6812" H 2494 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 2200 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 2250 4775 50  0001 L TNN
	1    2150 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D4
U 1 1 5DAB1889
P 2750 5150
F 0 "D4" H 3094 5196 50  0000 L CNN
F 1 "SK6812" H 3094 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 2800 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 2850 4775 50  0001 L TNN
	1    2750 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D5
U 1 1 5DAB6C64
P 3350 5150
F 0 "D5" H 3694 5196 50  0000 L CNN
F 1 "SK6812" H 3694 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 3400 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 3450 4775 50  0001 L TNN
	1    3350 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D6
U 1 1 5DAB6C6E
P 3950 5150
F 0 "D6" H 4294 5196 50  0000 L CNN
F 1 "SK6812" H 4294 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 4000 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 4050 4775 50  0001 L TNN
	1    3950 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D7
U 1 1 5DAB6C78
P 4550 5150
F 0 "D7" H 4894 5196 50  0000 L CNN
F 1 "SK6812" H 4894 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 4600 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 4650 4775 50  0001 L TNN
	1    4550 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D8
U 1 1 5DAB9CD7
P 5150 5150
F 0 "D8" H 5494 5196 50  0000 L CNN
F 1 "SK6812" H 5494 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 5200 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 5250 4775 50  0001 L TNN
	1    5150 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D9
U 1 1 5DAB9CE1
P 5750 5150
F 0 "D9" H 6094 5196 50  0000 L CNN
F 1 "SK6812" H 6094 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 5800 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 5850 4775 50  0001 L TNN
	1    5750 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D10
U 1 1 5DAB9CEB
P 6350 5150
F 0 "D10" H 6694 5196 50  0000 L CNN
F 1 "SK6812" H 6694 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 6400 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 6450 4775 50  0001 L TNN
	1    6350 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D11
U 1 1 5DAB9CF5
P 6950 5150
F 0 "D11" H 7294 5196 50  0000 L CNN
F 1 "SK6812" H 7294 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 7000 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 7050 4775 50  0001 L TNN
	1    6950 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D12
U 1 1 5DAB9CFF
P 7550 5150
F 0 "D12" H 7894 5196 50  0000 L CNN
F 1 "SK6812" H 7894 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 7600 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 7650 4775 50  0001 L TNN
	1    7550 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D13
U 1 1 5DAB9D09
P 8150 5150
F 0 "D13" H 8494 5196 50  0000 L CNN
F 1 "SK6812" H 8494 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 8200 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 8250 4775 50  0001 L TNN
	1    8150 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D14
U 1 1 5DAC0EDF
P 8750 5150
F 0 "D14" H 9094 5196 50  0000 L CNN
F 1 "SK6812" H 9094 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 8800 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 8850 4775 50  0001 L TNN
	1    8750 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D15
U 1 1 5DAC0EE9
P 9350 5150
F 0 "D15" H 9694 5196 50  0000 L CNN
F 1 "SK6812" H 9694 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 9400 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 9450 4775 50  0001 L TNN
	1    9350 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D16
U 1 1 5DAC0EF3
P 9950 5150
F 0 "D16" H 10294 5196 50  0000 L CNN
F 1 "SK6812" H 10294 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 10000 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 10050 4775 50  0001 L TNN
	1    9950 5150
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D17
U 1 1 5DAC0EFD
P 10550 5150
F 0 "D17" H 10894 5196 50  0000 L CNN
F 1 "SK6812" H 10894 5105 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 10600 4850 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 10650 4775 50  0001 L TNN
	1    10550 5150
	1    0    0    -1  
$EndComp
Text GLabel 1250 5150 0    50   Input ~ 0
LED1
Text GLabel 1250 4850 0    50   Input ~ 0
PWR
Wire Wire Line
	10550 4850 9950 4850
Connection ~ 2150 4850
Wire Wire Line
	2150 4850 1550 4850
Connection ~ 2750 4850
Wire Wire Line
	2750 4850 2150 4850
Connection ~ 3350 4850
Wire Wire Line
	3350 4850 2750 4850
Connection ~ 3950 4850
Wire Wire Line
	3950 4850 3350 4850
Connection ~ 4550 4850
Wire Wire Line
	4550 4850 3950 4850
Connection ~ 5150 4850
Wire Wire Line
	5150 4850 4550 4850
Connection ~ 5750 4850
Wire Wire Line
	5750 4850 5150 4850
Connection ~ 6350 4850
Wire Wire Line
	6350 4850 5750 4850
Connection ~ 6950 4850
Wire Wire Line
	6950 4850 6350 4850
Connection ~ 7550 4850
Wire Wire Line
	7550 4850 6950 4850
Connection ~ 8150 4850
Wire Wire Line
	8150 4850 7550 4850
Connection ~ 8750 4850
Wire Wire Line
	8750 4850 8150 4850
Connection ~ 9350 4850
Wire Wire Line
	9350 4850 8750 4850
Connection ~ 9950 4850
Wire Wire Line
	9950 4850 9350 4850
Wire Wire Line
	10550 5450 9950 5450
Connection ~ 2150 5450
Wire Wire Line
	2150 5450 1550 5450
Connection ~ 2750 5450
Wire Wire Line
	2750 5450 2150 5450
Connection ~ 3350 5450
Wire Wire Line
	3350 5450 2750 5450
Connection ~ 3950 5450
Wire Wire Line
	3950 5450 3350 5450
Connection ~ 4550 5450
Wire Wire Line
	4550 5450 3950 5450
Connection ~ 5150 5450
Wire Wire Line
	5150 5450 4550 5450
Connection ~ 5750 5450
Wire Wire Line
	5750 5450 5150 5450
Connection ~ 6350 5450
Wire Wire Line
	6350 5450 5750 5450
Connection ~ 6950 5450
Wire Wire Line
	6950 5450 6350 5450
Connection ~ 7550 5450
Wire Wire Line
	7550 5450 6950 5450
Connection ~ 8150 5450
Wire Wire Line
	8150 5450 7550 5450
Connection ~ 8750 5450
Wire Wire Line
	8750 5450 8150 5450
Connection ~ 9350 5450
Wire Wire Line
	9350 5450 8750 5450
Connection ~ 9950 5450
Wire Wire Line
	9950 5450 9350 5450
Wire Wire Line
	1550 4850 1250 4850
Connection ~ 1550 4850
Text GLabel 1250 5450 0    50   Input ~ 0
GND
Wire Wire Line
	1250 5450 1550 5450
Connection ~ 1550 5450
$Comp
L Device:R R5
U 1 1 5DB0845E
P 5050 2700
F 0 "R5" H 5120 2746 50  0000 L CNN
F 1 "10KOhm" H 5120 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4980 2700 50  0000 C CNN
F 3 "~" H 5050 2700 50  0001 C CNN
	1    5050 2700
	0    -1   -1   0   
$EndComp
Text GLabel 4800 3500 2    50   Input ~ 0
CHRG
Text GLabel 4800 3400 2    50   Input ~ 0
STDBY
Wire Wire Line
	4800 3400 4750 3400
Wire Wire Line
	4750 3500 4800 3500
$Comp
L Connector:Conn_01x02_Male BAT1
U 1 1 5DADAC8C
P 1350 6400
F 0 "BAT1" V 1412 6444 50  0000 L CNN
F 1 "BAT" V 1503 6444 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 1350 6400 50  0001 C CNN
F 3 "~" H 1350 6400 50  0001 C CNN
	1    1350 6400
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Female Charge1
U 1 1 5DAD3249
P 1300 6700
F 0 "Charge1" H 1328 6676 50  0000 L CNN
F 1 "Charge" H 1328 6585 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 1300 6700 50  0001 C CNN
F 3 "~" H 1300 6700 50  0001 C CNN
	1    1300 6700
	1    0    0    -1  
$EndComp
NoConn ~ 10850 5150
$Comp
L Connector:Conn_01x05_Male MIC1
U 1 1 5DB13911
P 6550 2250
F 0 "MIC1" H 6658 2431 50  0000 C CNN
F 1 "MIC" H 6658 2340 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 6550 2250 50  0001 C CNN
F 3 "~" H 6550 2250 50  0001 C CNN
	1    6550 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 2700 8050 2750
Connection ~ 8050 2700
NoConn ~ 4750 1300
NoConn ~ 4750 1200
NoConn ~ 4750 1100
NoConn ~ 3550 1400
NoConn ~ 3550 1300
Text GLabel 4900 2700 0    50   Input ~ 0
PWR
Wire Wire Line
	7000 1600 8650 1600
Connection ~ 8650 1600
Wire Wire Line
	6750 2150 7000 2150
Wire Wire Line
	7000 1600 7000 2150
Wire Wire Line
	7200 2700 7200 2050
Wire Wire Line
	7200 2700 8050 2700
$Comp
L Device:R R6
U 1 1 5DC36455
P 6900 2350
F 0 "R6" V 6693 2350 50  0000 C CNN
F 1 "147KOhm" V 6784 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6830 2350 50  0001 C CNN
F 3 "~" H 6900 2350 50  0001 C CNN
	1    6900 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	6750 2050 7200 2050
Wire Wire Line
	7300 2100 7300 2350
Wire Wire Line
	7300 2350 7050 2350
Wire Wire Line
	7300 2100 7750 2100
Connection ~ 7050 2350
Wire Wire Line
	7050 2650 7050 2700
Wire Wire Line
	7050 2700 7200 2700
Connection ~ 7200 2700
Text GLabel 4800 2100 2    50   Input ~ 0
Gain_Select
Text GLabel 6850 1700 1    50   Input ~ 0
Gain_Select
Wire Wire Line
	6750 2250 6850 2250
Wire Wire Line
	6850 2250 6850 1700
NoConn ~ 4750 3100
Text GLabel 6850 2500 3    50   Input ~ 0
Attack_Select
Wire Wire Line
	6750 2450 6850 2450
Wire Wire Line
	6850 2450 6850 2500
Text GLabel 4800 2200 2    50   Input ~ 0
Attack_Select
Wire Wire Line
	4750 2100 4800 2100
Wire Wire Line
	4750 2200 4800 2200
Wire Wire Line
	5600 2650 5600 2400
Wire Wire Line
	5600 2400 4750 2400
Wire Wire Line
	4750 2500 5500 2500
Wire Wire Line
	5500 2500 5500 2750
Wire Wire Line
	5500 2750 5600 2750
Wire Wire Line
	4750 2800 4850 2800
Wire Wire Line
	4750 2900 4850 2900
Wire Wire Line
	4250 800  4150 800 
Connection ~ 4150 800 
Wire Wire Line
	4750 2600 5200 2600
Text GLabel 4800 2300 2    50   Input ~ 0
BAT+_Switched
Text GLabel 1150 1150 0    50   Input ~ 0
5V_Flash
Wire Wire Line
	1150 1150 1200 1150
$Comp
L tp4056:TP5400 U3
U 1 1 5E1558E5
P 3150 6400
F 0 "U3" H 3037 6937 60  0000 C CNN
F 1 "TP5400" H 3037 6831 60  0000 C CNN
F 2 "tp4056:TP4056_SOP-8-PP" H 3150 6400 60  0000 C CNN
F 3 "" H 3150 6400 60  0000 C CNN
	1    3150 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5E1DE451
P 2400 6000
F 0 "C1" H 2515 6046 50  0000 L CNN
F 1 "10uF" H 2515 5955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2438 5850 50  0001 C CNN
F 3 "~" H 2400 6000 50  0001 C CNN
	1    2400 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 6150 2400 6150
$Comp
L Device:R R1
U 1 1 5E1E6AC3
P 2100 6150
F 0 "R1" V 1893 6150 50  0000 C CNN
F 1 "0.2Ohm" V 1984 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 2030 6150 50  0001 C CNN
F 3 "~" H 2100 6150 50  0001 C CNN
	1    2100 6150
	0    1    1    0   
$EndComp
Connection ~ 2400 6150
Wire Wire Line
	2250 6150 2400 6150
Wire Wire Line
	1950 6150 1900 6150
$Comp
L Device:R R4
U 1 1 5E1F6B57
P 2350 6750
F 0 "R4" H 2280 6704 50  0000 R CNN
F 1 "1.2KOhm" H 2280 6795 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2280 6750 50  0001 C CNN
F 3 "~" H 2350 6750 50  0001 C CNN
	1    2350 6750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2350 6600 2650 6600
Wire Wire Line
	2350 6900 3150 6900
Wire Wire Line
	3150 6900 3150 6800
Text GLabel 4900 6150 2    50   Input ~ 0
GND
$Comp
L Device:C C7
U 1 1 5E2164A7
P 4100 6000
F 0 "C7" H 4215 6046 50  0000 L CNN
F 1 "0.1uF" H 4215 5955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4138 5850 50  0001 C CNN
F 3 "~" H 4100 6000 50  0001 C CNN
	1    4100 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5E21F140
P 4550 6000
F 0 "C9" H 4665 6046 50  0000 L CNN
F 1 "47uF" H 4665 5955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4588 5850 50  0001 C CNN
F 3 "~" H 4550 6000 50  0001 C CNN
	1    4550 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5850 4550 5850
Connection ~ 4550 5850
Wire Wire Line
	4550 5850 4100 5850
Wire Wire Line
	4100 5850 3850 5850
Wire Wire Line
	3650 5850 3650 6150
Connection ~ 4100 5850
Wire Wire Line
	4900 6150 4550 6150
Connection ~ 4550 6150
Wire Wire Line
	4550 6150 4100 6150
$Comp
L Device:C C2
U 1 1 5E237FEC
P 3750 6750
F 0 "C2" H 3865 6796 50  0000 L CNN
F 1 "0.1uF" H 3865 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3788 6600 50  0001 C CNN
F 3 "~" H 3750 6750 50  0001 C CNN
	1    3750 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5E238935
P 4200 6750
F 0 "C8" H 4315 6796 50  0000 L CNN
F 1 "22uF" H 4315 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4238 6600 50  0001 C CNN
F 3 "~" H 4200 6750 50  0001 C CNN
	1    4200 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5E23923A
P 4600 6750
F 0 "C10" H 4715 6796 50  0000 L CNN
F 1 "22uF" H 4715 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4638 6600 50  0001 C CNN
F 3 "~" H 4600 6750 50  0001 C CNN
	1    4600 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6600 4600 6600
Connection ~ 3750 6600
Wire Wire Line
	3750 6600 3650 6600
Connection ~ 4200 6600
Wire Wire Line
	4200 6600 3850 6600
Connection ~ 4600 6600
Wire Wire Line
	4600 6600 4200 6600
Wire Wire Line
	4950 6900 4600 6900
Connection ~ 3150 6900
Connection ~ 3750 6900
Wire Wire Line
	3750 6900 3150 6900
Connection ~ 4200 6900
Wire Wire Line
	4200 6900 3750 6900
Connection ~ 4600 6900
Wire Wire Line
	4600 6900 4200 6900
$Comp
L Device:L L1
U 1 1 5E25CB33
P 3850 6450
F 0 "L1" H 3903 6496 50  0000 L CNN
F 1 "10uH" H 3903 6405 50  0000 L CNN
F 2 "Inductor_SMD:L_1210_3225Metric" H 3850 6450 50  0001 C CNN
F 3 "~" H 3850 6450 50  0001 C CNN
	1    3850 6450
	1    0    0    -1  
$EndComp
Connection ~ 3850 6600
Wire Wire Line
	3850 6600 3750 6600
Wire Wire Line
	3650 6350 3750 6350
Wire Wire Line
	3750 6350 3750 6300
Wire Wire Line
	3750 6300 3850 6300
$Comp
L Device:D_Schottky D1
U 1 1 5E266D92
P 3850 6150
F 0 "D1" V 3804 6229 50  0000 L CNN
F 1 "3A 20V" V 3895 6229 50  0000 L CNN
F 2 "Diode_SMD:D_1206_3216Metric" H 3850 6150 50  0001 C CNN
F 3 "~" H 3850 6150 50  0001 C CNN
	1    3850 6150
	0    1    1    0   
$EndComp
Connection ~ 3850 6300
Wire Wire Line
	3850 6000 3850 5850
Connection ~ 3850 5850
Wire Wire Line
	3850 5850 3650 5850
Text GLabel 1900 6000 0    50   Input ~ 0
5V_Flash
Text GLabel 2700 3150 1    50   Input ~ 0
GND
$Comp
L Device:R R15
U 1 1 5DEED760
P 2700 3300
F 0 "R15" H 2770 3346 50  0000 L CNN
F 1 "10k" H 2770 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2630 3300 50  0001 C CNN
F 3 "~" H 2700 3300 50  0001 C CNN
	1    2700 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3450 2700 3450
Wire Wire Line
	2550 3250 2550 3450
Connection ~ 2550 3450
Wire Wire Line
	2450 3450 2550 3450
Wire Wire Line
	1950 3450 2050 3450
Text GLabel 2550 3250 1    50   Input ~ 0
Button
Text GLabel 1950 3450 0    50   Input ~ 0
PWR
$Comp
L Switch:SW_Push SW1
U 1 1 5DAA7DE0
P 2250 3450
F 0 "SW1" H 2250 3735 50  0000 C CNN
F 1 "SW_Push" H 2250 3644 50  0000 C CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 2250 3650 50  0001 C CNN
F 3 "" H 2250 3650 50  0001 C CNN
	1    2250 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 6000 1900 6150
Wire Wire Line
	3550 1100 3450 1100
Wire Wire Line
	3450 1100 3450 800 
Wire Wire Line
	3450 800  4150 800 
Wire Wire Line
	5200 2700 5200 2600
Wire Wire Line
	4750 3000 4800 3000
Wire Wire Line
	5650 3000 5100 3000
Text GLabel 5650 3000 2    50   Input ~ 0
LED1
$Comp
L Device:R R14
U 1 1 5DD5D3A9
P 4950 3000
F 0 "R14" V 4743 3000 50  0000 C CNN
F 1 "470Ohm" V 4834 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4880 3000 50  0001 C CNN
F 3 "~" H 4950 3000 50  0001 C CNN
	1    4950 3000
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5DB011DE
P 5050 2800
F 0 "J1" H 5078 2776 50  0000 L CNN
F 1 "Conn_01x02_Female" H 5078 2685 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5050 2800 50  0001 C CNN
F 3 "~" H 5050 2800 50  0001 C CNN
	1    5050 2800
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:TS5A3166DBVR U4
U 1 1 5E26469E
P 6400 6350
F 0 "U4" H 6744 6396 50  0000 L CNN
F 1 "TS5A3166DBVR" H 6744 6305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 6350 6200 50  0001 C CNN
F 3 " http://www.ti.com/lit/ds/symlink/ts5a3166.pdf" H 6400 6450 50  0001 C CNN
	1    6400 6350
	1    0    0    -1  
$EndComp
Text GLabel 7400 6350 2    50   Input ~ 0
BAT+_Switched
Text GLabel 6100 6350 0    50   Input ~ 0
BAT+
Text GLabel 6100 6450 0    50   Input ~ 0
PWR
Text GLabel 6500 6650 3    50   Input ~ 0
GND
Text GLabel 6500 6050 1    50   Input ~ 0
BAT+
Wire Wire Line
	7400 6350 6700 6350
Wire Wire Line
	4800 2300 4750 2300
$EndSCHEMATC
