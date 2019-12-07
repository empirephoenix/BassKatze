EESchema Schematic File Version 4
LIBS:BassKatze-cache
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
Text GLabel 5700 1250 2    50   Input ~ 0
RAW_Spectrum
Text GLabel 5650 2250 2    50   Input ~ 0
Reset
$Comp
L tp4056:TP4056 U3
U 1 1 5DA87CBF
P 1650 7100
F 0 "U3" H 1650 7637 60  0000 C CNN
F 1 "TP4056" H 1650 7531 60  0000 C CNN
F 2 "tp4056:TP4056_SOP-8-PP" H 1650 7100 60  0001 C CNN
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
	1650 7500 1650 7550
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
Text GLabel 3300 6850 0    50   Input ~ 0
GND
Text GLabel 3350 6950 0    50   Input ~ 0
5V_IN
Wire Wire Line
	3300 6850 3350 6850
Text GLabel 1600 7500 0    50   Input ~ 0
BAT-
Wire Wire Line
	1600 7500 1650 7500
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
Text GLabel 5600 2650 2    50   Input ~ 0
EQ_Band
Text GLabel 5600 2750 2    50   Input ~ 0
EQ_Reset
Text GLabel 5650 3000 2    50   Input ~ 0
LED1
Wire Wire Line
	4750 3000 4800 3000
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
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7740 2100 50  0000 C CNN
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
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6980 2500 50  0001 C CNN
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
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9188 2500 50  0001 C CNN
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
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 8088 2400 50  0001 C CNN
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
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7780 2400 50  0001 C CNN
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
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 8538 1350 50  0001 C CNN
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
$Comp
L Switch:SW_Push SW1
U 1 1 5DAA7DE0
P 1350 2600
F 0 "SW1" H 1350 2885 50  0000 C CNN
F 1 "SW_Push" H 1350 2794 50  0000 C CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 1350 2800 50  0001 C CNN
F 3 "" H 1350 2800 50  0001 C CNN
	1    1350 2600
	1    0    0    -1  
$EndComp
Text GLabel 1050 2600 0    50   Input ~ 0
BAT+
Text GLabel 2350 2600 2    50   Input ~ 0
PWR
Text GLabel 1650 2400 1    50   Input ~ 0
Button
Text GLabel 4800 3200 2    50   Input ~ 0
Button
Wire Wire Line
	4800 3200 4750 3200
Wire Wire Line
	1050 2600 1150 2600
Wire Wire Line
	1550 2600 1650 2600
Wire Wire Line
	1650 2400 1650 2600
Connection ~ 1650 2600
$Comp
L Transistor_FET:IRF7404 Q1
U 1 1 5DAAE6E1
P 1650 3350
F 0 "Q1" V 1993 3350 50  0000 C CNN
F 1 "IRF7404" V 1902 3350 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 1850 3275 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf7404.pdf?fileId=5546d462533600a4015355fa2b5b1b9e" V 1650 3350 50  0001 L CNN
	1    1650 3350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 5DAB048C
P 1650 3700
F 0 "R4" H 1720 3746 50  0000 L CNN
F 1 "10KOhm" H 1720 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 1580 3700 50  0001 C CNN
F 3 "~" H 1650 3700 50  0001 C CNN
	1    1650 3700
	1    0    0    -1  
$EndComp
Text GLabel 800  4600 3    50   Input ~ 0
PWR_HOLD
Text GLabel 4800 3300 2    50   Input ~ 0
PWR_HOLD
Wire Wire Line
	4800 3300 4750 3300
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
P 5600 2100
F 0 "R5" H 5670 2146 50  0000 L CNN
F 1 "10KOhm" H 5670 2055 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5530 2100 50  0001 C CNN
F 3 "~" H 5600 2100 50  0001 C CNN
	1    5600 2100
	-1   0    0    1   
$EndComp
Text GLabel 4800 3400 2    50   Input ~ 0
CHRG
Text GLabel 4800 3500 2    50   Input ~ 0
STDBY
Wire Wire Line
	4800 3400 4750 3400
Wire Wire Line
	4750 3500 4800 3500
$Comp
L Device:D D1
U 1 1 5DB12BF9
P 1950 2600
F 0 "D1" H 1950 2384 50  0000 C CNN
F 1 "D" H 1950 2475 50  0000 C CNN
F 2 "Diode_SMD:D_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1950 2600 50  0001 C CNN
F 3 "~" H 1950 2600 50  0001 C CNN
	1    1950 2600
	-1   0    0    1   
$EndComp
Connection ~ 2100 2600
Wire Wire Line
	1650 2600 1800 2600
$Comp
L Connector:Conn_01x02_Male BAT1
U 1 1 5DADAC8C
P 1850 5950
F 0 "BAT1" V 1912 5994 50  0000 L CNN
F 1 "BAT" V 2003 5994 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 1850 5950 50  0001 C CNN
F 3 "~" H 1850 5950 50  0001 C CNN
	1    1850 5950
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female Charge1
U 1 1 5DAD3249
P 3550 6850
F 0 "Charge1" H 3578 6826 50  0000 L CNN
F 1 "Charge" H 3578 6735 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 3550 6850 50  0001 C CNN
F 3 "~" H 3550 6850 50  0001 C CNN
	1    3550 6850
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
NoConn ~ 4750 1800
NoConn ~ 4750 1700
NoConn ~ 4750 1300
NoConn ~ 4750 1200
NoConn ~ 4750 1100
NoConn ~ 3550 1400
NoConn ~ 3550 1300
NoConn ~ 3550 1100
NoConn ~ 1150 7050
Text GLabel 5650 1950 2    50   Input ~ 0
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
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6830 2350 50  0001 C CNN
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
Wire Wire Line
	4750 2800 4850 2800
Wire Wire Line
	4750 2900 4850 2900
Wire Wire Line
	4250 800  4150 800 
Connection ~ 4150 800 
Wire Wire Line
	5650 2250 5600 2250
Wire Wire Line
	5650 1950 5600 1950
Wire Wire Line
	5600 2250 5600 2350
Wire Wire Line
	5600 2350 5350 2350
Wire Wire Line
	5350 2350 5350 2600
Wire Wire Line
	4750 2600 5350 2600
Connection ~ 5600 2250
$Comp
L Device:R R8
U 1 1 5DB18D48
P 5750 1700
F 0 "R8" V 5543 1700 50  0000 C CNN
F 1 "5KOhm" V 5634 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5680 1700 50  0001 C CNN
F 3 "~" H 5750 1700 50  0001 C CNN
	1    5750 1700
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5DB193BE
P 5450 1700
F 0 "R7" V 5243 1700 50  0000 C CNN
F 1 "1KOhm" V 5334 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5380 1700 50  0001 C CNN
F 3 "~" H 5450 1700 50  0001 C CNN
	1    5450 1700
	0    1    1    0   
$EndComp
Text GLabel 5900 1700 2    50   Input ~ 0
PWR
Wire Wire Line
	5600 1700 5600 1850
Wire Wire Line
	5600 1850 5450 1850
Wire Wire Line
	5450 1850 5450 2300
Wire Wire Line
	5450 2300 4750 2300
Connection ~ 5600 1700
Wire Wire Line
	2100 2600 2350 2600
Wire Wire Line
	1450 3250 1450 2850
Wire Wire Line
	1450 2850 2100 2850
Wire Wire Line
	2100 2600 2100 2850
Text GLabel 1950 3250 2    50   Input ~ 0
BAT+
Wire Wire Line
	1950 3250 1900 3250
Wire Wire Line
	1650 3850 2150 3850
Wire Wire Line
	2150 3850 2150 3400
Wire Wire Line
	2150 3400 1900 3400
Wire Wire Line
	1900 3400 1900 3250
Connection ~ 1900 3250
Wire Wire Line
	1900 3250 1850 3250
$Comp
L Device:R R13
U 1 1 5DC820D4
P 1500 3550
F 0 "R13" H 1570 3596 50  0000 L CNN
F 1 "10KOhm" H 1570 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 1430 3550 50  0001 C CNN
F 3 "~" H 1500 3550 50  0001 C CNN
	1    1500 3550
	0    1    1    0   
$EndComp
Connection ~ 1650 3550
$Comp
L Transistor_FET:BSS138 Q2
U 1 1 5DC86628
P 850 3700
F 0 "Q2" V 1193 3700 50  0000 C CNN
F 1 "BSS138" V 1102 3700 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1050 3625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 850 3700 50  0001 L CNN
	1    850  3700
	0    -1   -1   0   
$EndComp
Text GLabel 1100 3450 1    50   Input ~ 0
GND
Wire Wire Line
	1100 3450 1100 3600
Wire Wire Line
	1100 3600 1050 3600
Wire Wire Line
	650  3600 650  3000
Wire Wire Line
	650  3000 1350 3000
Wire Wire Line
	1350 3000 1350 3550
$Comp
L Device:R R11
U 1 1 5DC974F5
P 850 4050
F 0 "R11" H 920 4096 50  0000 L CNN
F 1 "10KOhm" H 920 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 780 4050 50  0001 C CNN
F 3 "~" H 850 4050 50  0001 C CNN
	1    850  4050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R12
U 1 1 5DC97A55
P 1000 3900
F 0 "R12" H 1070 3946 50  0000 L CNN
F 1 "10KOhm" H 1070 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 930 3900 50  0001 C CNN
F 3 "~" H 1000 3900 50  0001 C CNN
	1    1000 3900
	0    -1   -1   0   
$EndComp
Connection ~ 850  3900
Wire Wire Line
	1150 3900 1150 3600
Wire Wire Line
	1150 3600 1100 3600
Connection ~ 1100 3600
Wire Wire Line
	850  4200 800  4200
Wire Wire Line
	800  4200 800  4300
$Comp
L Device:R R10
U 1 1 5DC450EB
P 5550 1250
F 0 "R10" V 5343 1250 50  0000 C CNN
F 1 "5KOhm" V 5434 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5480 1250 50  0001 C CNN
F 3 "~" H 5550 1250 50  0001 C CNN
	1    5550 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5DC450F1
P 5250 1250
F 0 "R9" V 5043 1250 50  0000 C CNN
F 1 "1KOhm" V 5134 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5180 1250 50  0001 C CNN
F 3 "~" H 5250 1250 50  0001 C CNN
	1    5250 1250
	0    1    1    0   
$EndComp
Text GLabel 5100 1250 0    50   Input ~ 0
GND
Wire Wire Line
	5400 1250 5400 1400
Connection ~ 5400 1250
Wire Wire Line
	5100 1250 5100 1700
Wire Wire Line
	5100 1700 5300 1700
Wire Wire Line
	5400 1400 5200 1400
Wire Wire Line
	5200 1400 5200 2000
Wire Wire Line
	4750 2000 5200 2000
$Comp
L Device:D D18
U 1 1 5DD2FE3A
P 800 4450
F 0 "D18" V 754 4529 50  0000 L CNN
F 1 "D" V 845 4529 50  0000 L CNN
F 2 "Diode_SMD:D_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 800 4450 50  0001 C CNN
F 3 "~" H 800 4450 50  0001 C CNN
	1    800  4450
	0    1    1    0   
$EndComp
$Comp
L Device:D D19
U 1 1 5DD309CE
P 950 4300
F 0 "D19" H 950 4516 50  0000 C CNN
F 1 "D" H 950 4425 50  0000 C CNN
F 2 "Diode_SMD:D_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 950 4300 50  0001 C CNN
F 3 "~" H 950 4300 50  0001 C CNN
	1    950  4300
	1    0    0    -1  
$EndComp
Connection ~ 800  4300
Text GLabel 1150 4300 2    50   Input ~ 0
5V_Flash
Wire Wire Line
	1100 4300 1150 4300
Text GLabel 1150 1150 0    50   Input ~ 0
5V_Flash
Wire Wire Line
	1150 1150 1200 1150
$Comp
L Device:R R14
U 1 1 5DD5D3A9
P 4950 3000
F 0 "R14" V 4743 3000 50  0000 C CNN
F 1 "470Ohm" V 4834 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 4880 3000 50  0001 C CNN
F 3 "~" H 4950 3000 50  0001 C CNN
	1    4950 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 3000 5100 3000
$Comp
L Device:R R15
U 1 1 5DEED760
P 1800 2450
F 0 "R15" H 1870 2496 50  0000 L CNN
F 1 "10k" H 1870 2405 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 1730 2450 50  0001 C CNN
F 3 "~" H 1800 2450 50  0001 C CNN
	1    1800 2450
	1    0    0    -1  
$EndComp
Connection ~ 1800 2600
Text GLabel 1800 2300 1    50   Input ~ 0
GND
$EndSCHEMATC
