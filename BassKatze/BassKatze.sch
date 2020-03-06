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
P 9850 1500
F 0 "U2" H 9850 2181 50  0000 C CNN
F 1 "MSGEQ7" H 9850 2090 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 9850 1500 50  0001 C CNN
F 3 "http://mix-sig.com/images/datasheets/MSGEQ7.pdf" H 9850 1500 50  0001 C CNN
	1    9850 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise ISP_5v1
U 1 1 5DA75700
P 6400 5000
F 0 "ISP_5v1" H 6450 5317 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 6450 5226 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 6400 5000 50  0001 C CNN
F 3 "~" H 6400 5000 50  0001 C CNN
	1    6400 5000
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
Text GLabel 6150 4900 0    50   Input ~ 0
MISO_5V
Text GLabel 6150 5100 0    50   Input ~ 0
SCK_5V
Text GLabel 6750 5000 2    50   Input ~ 0
Reset_5V
Text GLabel 6750 5100 2    50   Input ~ 0
MOSI_5V
Text GLabel 6750 4900 2    50   Input ~ 0
GND
Wire Wire Line
	6200 4900 6150 4900
Wire Wire Line
	6200 5100 6150 5100
Wire Wire Line
	6700 4900 6750 4900
Wire Wire Line
	6750 5000 6700 5000
Wire Wire Line
	6700 5100 6750 5100
Text GLabel 4150 4100 3    50   Input ~ 0
GND
Text GLabel 9850 2100 3    50   Input ~ 0
GND
Text GLabel 10500 1600 2    50   Input ~ 0
RAW_Spectrum
Text GLabel 10500 1300 2    50   Input ~ 0
EQ_Reset
Text GLabel 10500 1200 2    50   Input ~ 0
EQ_Band
Text GLabel 9850 750  1    50   Input ~ 0
PWR
Text GLabel 4850 1500 2    50   Input ~ 0
MISO
Text GLabel 4850 1400 2    50   Input ~ 0
MOSI
Text GLabel 5700 1250 2    50   Input ~ 0
RAW_Spectrum
Text GLabel 5700 2600 2    50   Input ~ 0
Reset
$Comp
L tp4056:TP4056 U3
U 1 1 5DA87CBF
P 9950 4550
F 0 "U3" H 9950 5087 60  0000 C CNN
F 1 "TP4056" H 9950 4981 60  0000 C CNN
F 2 "tp4056:TP4056_SOP-8-PP" H 9950 4550 60  0001 C CNN
F 3 "" H 9950 4550 60  0001 C CNN
	1    9950 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5DAAC4E4
P 10500 4450
F 0 "C2" H 10615 4496 50  0000 L CNN
F 1 "10uF" H 10615 4405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10538 4300 50  0001 C CNN
F 3 "~" H 10500 4450 50  0001 C CNN
	1    10500 4450
	1    0    0    -1  
$EndComp
Text GLabel 10550 4600 2    50   Input ~ 0
GND
Text GLabel 10550 4300 2    50   Input ~ 0
BAT+
$Comp
L Device:R RProg1
U 1 1 5DAAD5B2
P 10450 4850
F 0 "RProg1" H 10520 4896 50  0000 L CNN
F 1 "1.2kOhm" H 10520 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10380 4850 50  0001 C CNN
F 3 "~" H 10450 4850 50  0001 C CNN
	1    10450 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 4300 10500 4300
Wire Wire Line
	10450 4600 10500 4600
Text GLabel 10450 5000 3    50   Input ~ 0
GND
Text GLabel 9950 5000 3    50   Input ~ 0
GND
Wire Wire Line
	9950 4950 9950 5000
Text GLabel 9400 4700 0    50   Input ~ 0
STDBY
Text GLabel 9400 4600 0    50   Input ~ 0
CHRG
$Comp
L Device:R R1
U 1 1 5DAB37D4
P 9450 4050
F 0 "R1" H 9520 4096 50  0000 L CNN
F 1 "0.2Ohm" H 9520 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 9380 4050 50  0001 C CNN
F 3 "~" H 9450 4050 50  0001 C CNN
	1    9450 4050
	1    0    0    -1  
$EndComp
Text GLabel 9450 3900 1    50   Input ~ 0
5V_IN
Wire Wire Line
	9450 4200 9450 4300
Wire Wire Line
	9450 4400 9450 4300
Connection ~ 9450 4300
Wire Wire Line
	9400 4600 9450 4600
Wire Wire Line
	9450 4700 9400 4700
$Comp
L Device:C C1
U 1 1 5DAB7F18
P 9300 4300
F 0 "C1" V 9048 4300 50  0000 C CNN
F 1 "10uF" V 9139 4300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9338 4150 50  0001 C CNN
F 3 "~" H 9300 4300 50  0001 C CNN
	1    9300 4300
	0    1    1    0   
$EndComp
Text GLabel 9100 4300 0    50   Input ~ 0
GND
Text GLabel 10350 3600 0    50   Input ~ 0
GND
Text GLabel 10350 3700 0    50   Input ~ 0
5V_IN
Wire Wire Line
	10350 3600 10400 3600
Text GLabel 9900 4950 0    50   Input ~ 0
BAT-
Wire Wire Line
	9900 4950 9950 4950
Text GLabel 10400 3150 0    50   Input ~ 0
BAT+
Text GLabel 10400 3250 0    50   Input ~ 0
BAT-
Wire Wire Line
	10450 3150 10400 3150
Wire Wire Line
	10450 3250 10400 3250
Text GLabel 4850 1600 2    50   Input ~ 0
SCK
Wire Wire Line
	4750 1400 4850 1400
Wire Wire Line
	4850 1500 4750 1500
Wire Wire Line
	4750 1600 4850 1600
Text GLabel 5700 2400 2    50   Input ~ 0
EQ_Band
Text GLabel 5700 2500 2    50   Input ~ 0
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
	10350 1300 10500 1300
Wire Wire Line
	10500 1200 10350 1200
Wire Wire Line
	10350 1600 10500 1600
$Comp
L Device:C C3
U 1 1 5DB00FEF
P 9100 1500
F 0 "C3" V 8758 1500 50  0000 C CNN
F 1 "0.1uF" V 8849 1500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" V 8940 1500 50  0000 C CNN
F 3 "~" H 9100 1500 50  0001 C CNN
	1    9100 1500
	0    1    1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 5DB05B69
P 10350 2050
F 0 "C6" H 10465 2096 50  0000 L CNN
F 1 "0.1uF" H 10465 2005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10388 1900 50  0001 C CNN
F 3 "~" H 10350 2050 50  0001 C CNN
	1    10350 2050
	1    0    0    -1  
$EndComp
Text GLabel 10350 2300 3    50   Input ~ 0
GND
Wire Wire Line
	10350 1800 10350 1900
Wire Wire Line
	10350 2200 10350 2300
$Comp
L Device:C C4
U 1 1 5DB09D3F
P 9250 1950
F 0 "C4" H 9365 1996 50  0000 L CNN
F 1 "33pF" H 9365 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9288 1800 50  0001 C CNN
F 3 "~" H 9250 1950 50  0001 C CNN
	1    9250 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5DB0A2DB
P 9050 1800
F 0 "R3" V 8843 1800 50  0000 C CNN
F 1 "200KOhm" V 8934 1800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8980 1800 50  0001 C CNN
F 3 "~" H 9050 1800 50  0001 C CNN
	1    9050 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	9200 1800 9250 1800
Wire Wire Line
	9250 1800 9350 1800
Connection ~ 9250 1800
Wire Wire Line
	9250 1500 9350 1500
Text GLabel 8850 1800 0    50   Input ~ 0
PWR
Wire Wire Line
	8850 1800 8900 1800
Wire Wire Line
	9850 750  9850 900 
$Comp
L Device:C C5
U 1 1 5DB0FA7E
P 9700 900
F 0 "C5" V 9448 900 50  0000 C CNN
F 1 "0.1uF" V 9539 900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9738 750 50  0001 C CNN
F 3 "~" H 9700 900 50  0001 C CNN
	1    9700 900 
	0    1    1    0   
$EndComp
Connection ~ 9850 900 
Wire Wire Line
	9850 900  9850 1000
Text GLabel 9550 900  0    50   Input ~ 0
GND
Text GLabel 9250 2150 3    50   Input ~ 0
GND
Wire Wire Line
	9850 2000 9850 2100
$Comp
L Switch:SW_Push SW1
U 1 1 5DAA7DE0
P 1550 1400
F 0 "SW1" H 1550 1685 50  0000 C CNN
F 1 "SW_Push" H 1550 1594 50  0000 C CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 1550 1600 50  0001 C CNN
F 3 "" H 1550 1600 50  0001 C CNN
	1    1550 1400
	1    0    0    -1  
$EndComp
Text GLabel 1250 1400 0    50   Input ~ 0
BAT+
Text GLabel 2550 1400 2    50   Input ~ 0
PWR
Text GLabel 1850 1200 1    50   Input ~ 0
Button
Text GLabel 4800 3200 2    50   Input ~ 0
Button
Wire Wire Line
	4800 3200 4750 3200
Wire Wire Line
	1250 1400 1350 1400
Wire Wire Line
	1750 1400 1850 1400
Wire Wire Line
	1850 1200 1850 1400
Connection ~ 1850 1400
$Comp
L Transistor_FET:IRF7404 Q1
U 1 1 5DAAE6E1
P 2800 1900
F 0 "Q1" V 3143 1900 50  0000 C CNN
F 1 "IRF7404" V 3052 1900 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3000 1825 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf7404.pdf?fileId=5546d462533600a4015355fa2b5b1b9e" V 2800 1900 50  0001 L CNN
	1    2800 1900
	0    -1   -1   0   
$EndComp
Text GLabel 1200 2500 0    50   Input ~ 0
PWR_HOLD
Text GLabel 4800 3300 2    50   Input ~ 0
PWR_HOLD
Wire Wire Line
	4800 3300 4750 3300
$Comp
L LED:SK6812 D2
U 1 1 5DAAFF0A
P 1350 6050
F 0 "D2" H 1694 6096 50  0000 L CNN
F 1 "SK6812" H 1694 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 1400 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 1450 5675 50  0001 L TNN
	1    1350 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D3
U 1 1 5DAB1276
P 1950 6050
F 0 "D3" H 2294 6096 50  0000 L CNN
F 1 "SK6812" H 2294 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 2000 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 2050 5675 50  0001 L TNN
	1    1950 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D4
U 1 1 5DAB1889
P 2550 6050
F 0 "D4" H 2894 6096 50  0000 L CNN
F 1 "SK6812" H 2894 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 2600 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 2650 5675 50  0001 L TNN
	1    2550 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D5
U 1 1 5DAB6C64
P 3150 6050
F 0 "D5" H 3494 6096 50  0000 L CNN
F 1 "SK6812" H 3494 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 3200 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 3250 5675 50  0001 L TNN
	1    3150 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D6
U 1 1 5DAB6C6E
P 3750 6050
F 0 "D6" H 4094 6096 50  0000 L CNN
F 1 "SK6812" H 4094 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 3800 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 3850 5675 50  0001 L TNN
	1    3750 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D7
U 1 1 5DAB6C78
P 4350 6050
F 0 "D7" H 4694 6096 50  0000 L CNN
F 1 "SK6812" H 4694 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 4400 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 4450 5675 50  0001 L TNN
	1    4350 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D8
U 1 1 5DAB9CD7
P 4950 6050
F 0 "D8" H 5294 6096 50  0000 L CNN
F 1 "SK6812" H 5294 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 5000 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 5050 5675 50  0001 L TNN
	1    4950 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D9
U 1 1 5DAB9CE1
P 5550 6050
F 0 "D9" H 5894 6096 50  0000 L CNN
F 1 "SK6812" H 5894 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 5600 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 5650 5675 50  0001 L TNN
	1    5550 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D10
U 1 1 5DAB9CEB
P 6150 6050
F 0 "D10" H 6494 6096 50  0000 L CNN
F 1 "SK6812" H 6494 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 6200 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 6250 5675 50  0001 L TNN
	1    6150 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D11
U 1 1 5DAB9CF5
P 6750 6050
F 0 "D11" H 7094 6096 50  0000 L CNN
F 1 "SK6812" H 7094 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 6800 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 6850 5675 50  0001 L TNN
	1    6750 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D12
U 1 1 5DAB9CFF
P 7350 6050
F 0 "D12" H 7694 6096 50  0000 L CNN
F 1 "SK6812" H 7694 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 7400 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 7450 5675 50  0001 L TNN
	1    7350 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D13
U 1 1 5DAB9D09
P 7950 6050
F 0 "D13" H 8294 6096 50  0000 L CNN
F 1 "SK6812" H 8294 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 8000 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 8050 5675 50  0001 L TNN
	1    7950 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D14
U 1 1 5DAC0EDF
P 8550 6050
F 0 "D14" H 8894 6096 50  0000 L CNN
F 1 "SK6812" H 8894 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 8600 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 8650 5675 50  0001 L TNN
	1    8550 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D15
U 1 1 5DAC0EE9
P 9150 6050
F 0 "D15" H 9494 6096 50  0000 L CNN
F 1 "SK6812" H 9494 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 9200 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 9250 5675 50  0001 L TNN
	1    9150 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D16
U 1 1 5DAC0EF3
P 9750 6050
F 0 "D16" H 10094 6096 50  0000 L CNN
F 1 "SK6812" H 10094 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 9800 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 9850 5675 50  0001 L TNN
	1    9750 6050
	1    0    0    -1  
$EndComp
$Comp
L LED:SK6812 D17
U 1 1 5DAC0EFD
P 10350 6050
F 0 "D17" H 10694 6096 50  0000 L CNN
F 1 "SK6812" H 10694 6005 50  0000 L CNN
F 2 "LED_SMD:LED_SK6812_PLCC4_5.0x5.0mm_P3.2mm" H 10400 5750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/1138/SK6812+LED+datasheet+.pdf" H 10450 5675 50  0001 L TNN
	1    10350 6050
	1    0    0    -1  
$EndComp
Text GLabel 1050 6050 0    50   Input ~ 0
LED1
Text GLabel 1050 5750 0    50   Input ~ 0
PWR
Wire Wire Line
	10350 5750 9750 5750
Connection ~ 1950 5750
Wire Wire Line
	1950 5750 1350 5750
Connection ~ 2550 5750
Wire Wire Line
	2550 5750 1950 5750
Connection ~ 3150 5750
Wire Wire Line
	3150 5750 2550 5750
Connection ~ 3750 5750
Wire Wire Line
	3750 5750 3150 5750
Connection ~ 4350 5750
Wire Wire Line
	4350 5750 3750 5750
Connection ~ 4950 5750
Wire Wire Line
	4950 5750 4350 5750
Connection ~ 5550 5750
Wire Wire Line
	5550 5750 4950 5750
Connection ~ 6150 5750
Wire Wire Line
	6150 5750 5550 5750
Connection ~ 6750 5750
Wire Wire Line
	6750 5750 6150 5750
Connection ~ 7350 5750
Wire Wire Line
	7350 5750 6750 5750
Connection ~ 7950 5750
Wire Wire Line
	7950 5750 7350 5750
Connection ~ 8550 5750
Wire Wire Line
	8550 5750 7950 5750
Connection ~ 9150 5750
Wire Wire Line
	9150 5750 8550 5750
Connection ~ 9750 5750
Wire Wire Line
	9750 5750 9150 5750
Wire Wire Line
	10350 6350 9750 6350
Connection ~ 1950 6350
Wire Wire Line
	1950 6350 1350 6350
Connection ~ 2550 6350
Wire Wire Line
	2550 6350 1950 6350
Connection ~ 3150 6350
Wire Wire Line
	3150 6350 2550 6350
Connection ~ 3750 6350
Wire Wire Line
	3750 6350 3150 6350
Connection ~ 4350 6350
Wire Wire Line
	4350 6350 3750 6350
Connection ~ 4950 6350
Wire Wire Line
	4950 6350 4350 6350
Connection ~ 5550 6350
Wire Wire Line
	5550 6350 4950 6350
Connection ~ 6150 6350
Wire Wire Line
	6150 6350 5550 6350
Connection ~ 6750 6350
Wire Wire Line
	6750 6350 6150 6350
Connection ~ 7350 6350
Wire Wire Line
	7350 6350 6750 6350
Connection ~ 7950 6350
Wire Wire Line
	7950 6350 7350 6350
Connection ~ 8550 6350
Wire Wire Line
	8550 6350 7950 6350
Connection ~ 9150 6350
Wire Wire Line
	9150 6350 8550 6350
Connection ~ 9750 6350
Wire Wire Line
	9750 6350 9150 6350
Wire Wire Line
	1350 5750 1050 5750
Connection ~ 1350 5750
Text GLabel 1050 6350 0    50   Input ~ 0
GND
Wire Wire Line
	1050 6350 1350 6350
Connection ~ 1350 6350
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
P 2150 1400
F 0 "D1" H 2150 1184 50  0000 C CNN
F 1 "D" H 2150 1275 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323" H 2150 1400 50  0001 C CNN
F 3 "~" H 2150 1400 50  0001 C CNN
	1    2150 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 1400 2000 1400
$Comp
L Connector:Conn_01x02_Male +Bat-1
U 1 1 5DADAC8C
P 10650 3250
F 0 "+Bat-1" V 10712 3294 50  0000 L CNN
F 1 "BAT" H 10803 3294 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 10650 3250 50  0001 C CNN
F 3 "~" H 10650 3250 50  0001 C CNN
	1    10650 3250
	-1   0    0    1   
$EndComp
NoConn ~ 10650 6050
$Comp
L Connector:Conn_01x06_Male MIC1
U 1 1 5DB13911
P 7750 1650
F 0 "MIC1" H 7858 1831 50  0000 C CNN
F 1 "MIC" H 7858 1740 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 7750 1650 50  0001 C CNN
F 3 "~" H 7750 1650 50  0001 C CNN
	1    7750 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2100 9250 2150
Connection ~ 9250 2100
NoConn ~ 4750 1800
NoConn ~ 4750 1700
NoConn ~ 4750 1300
NoConn ~ 4750 1200
NoConn ~ 4750 1100
NoConn ~ 3550 1400
NoConn ~ 3550 1300
NoConn ~ 3550 1100
NoConn ~ 9450 4500
Wire Wire Line
	8200 1000 9850 1000
Connection ~ 9850 1000
Wire Wire Line
	7950 1550 8200 1550
Wire Wire Line
	8200 1000 8200 1550
Wire Wire Line
	8400 2100 8400 1450
Wire Wire Line
	8400 2100 9250 2100
$Comp
L Device:R R6
U 1 1 5DC36455
P 8100 1750
F 0 "R6" V 7893 1750 50  0000 C CNN
F 1 "147KOhm" V 7984 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8030 1750 50  0001 C CNN
F 3 "~" H 8100 1750 50  0001 C CNN
	1    8100 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 1450 8400 1450
Wire Wire Line
	8500 1500 8500 1750
Wire Wire Line
	8500 1750 8250 1750
Wire Wire Line
	8500 1500 8950 1500
Connection ~ 8250 1750
Wire Wire Line
	8250 2050 8250 2100
Wire Wire Line
	8250 2100 8400 2100
Connection ~ 8400 2100
Text GLabel 4800 2100 2    50   Input ~ 0
Gain_Select
Text GLabel 8050 1100 1    50   Input ~ 0
Gain_Select
Wire Wire Line
	7950 1650 8050 1650
Wire Wire Line
	8050 1650 8050 1100
Text GLabel 8050 1900 3    50   Input ~ 0
Attack_Select
Wire Wire Line
	7950 1850 8050 1850
Wire Wire Line
	8050 1850 8050 1900
Text GLabel 4800 2200 2    50   Input ~ 0
Attack_Select
Wire Wire Line
	4750 2100 4800 2100
Wire Wire Line
	4750 2200 4800 2200
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5DB011DE
P 5050 2800
F 0 "J1" H 5078 2776 50  0000 L CNN
F 1 "Conn_01x02_Female" H 5078 2685 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5050 2800 50  0001 C CNN
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
$Comp
L Device:R R8
U 1 1 5DB18D48
P 5750 1700
F 0 "R8" V 5543 1700 50  0000 C CNN
F 1 "5KOhm" V 5634 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5680 1700 50  0001 C CNN
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
F 2 "Resistor_SMD:R_0805_2012Metric" V 5380 1700 50  0001 C CNN
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
	2300 1400 2350 1400
Text GLabel 3050 2300 2    50   Input ~ 0
BAT+
Text GLabel 2050 2050 1    50   Input ~ 0
GND
Wire Wire Line
	2050 2050 2050 2150
Wire Wire Line
	2050 2150 2050 2700
Connection ~ 2050 2150
$Comp
L Device:R R10
U 1 1 5DC450EB
P 5550 1250
F 0 "R10" V 5343 1250 50  0000 C CNN
F 1 "5KOhm" V 5434 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5480 1250 50  0001 C CNN
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
F 2 "Resistor_SMD:R_0805_2012Metric" V 5180 1250 50  0001 C CNN
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
P 1350 2500
F 0 "D18" V 1304 2579 50  0000 L CNN
F 1 "D" V 1395 2579 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-323" H 1350 2500 50  0001 C CNN
F 3 "~" H 1350 2500 50  0001 C CNN
	1    1350 2500
	-1   0    0    1   
$EndComp
$Comp
L Device:D D19
U 1 1 5DD309CE
P 1500 2650
F 0 "D19" H 1500 2866 50  0000 C CNN
F 1 "D" H 1500 2775 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323" H 1500 2650 50  0001 C CNN
F 3 "~" H 1500 2650 50  0001 C CNN
	1    1500 2650
	0    1    1    0   
$EndComp
Connection ~ 1500 2500
Text GLabel 1500 2850 3    50   Input ~ 0
5V_Flash
Wire Wire Line
	1500 2800 1500 2850
Text GLabel 6150 5000 0    50   Input ~ 0
5V_Flash
Wire Wire Line
	6150 5000 6200 5000
$Comp
L Device:R R14
U 1 1 5DD5D3A9
P 4950 3000
F 0 "R14" V 4743 3000 50  0000 C CNN
F 1 "470Ohm" V 4834 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4880 3000 50  0000 C CNN
F 3 "~" H 4950 3000 50  0001 C CNN
	1    4950 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 3000 5100 3000
$Comp
L Device:R R15
U 1 1 5DEED760
P 2000 1250
F 0 "R15" H 2070 1296 50  0000 L CNN
F 1 "10k" H 2070 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1930 1250 50  0001 C CNN
F 3 "~" H 2000 1250 50  0001 C CNN
	1    2000 1250
	1    0    0    -1  
$EndComp
Connection ~ 2000 1400
Text GLabel 2000 1100 1    50   Input ~ 0
GND
Connection ~ 9950 4950
Text GLabel 4900 5000 2    50   Input ~ 0
PWR
Text GLabel 3750 5000 2    50   Input ~ 0
PWR
Text GLabel 1350 5000 2    50   Input ~ 0
PWR
Text GLabel 2550 5000 2    50   Input ~ 0
PWR
Text GLabel 2300 3950 1    50   Input ~ 0
5V_Flash
Text GLabel 4000 5300 2    50   Input ~ 0
MISO_5V
Text GLabel 3500 5300 0    50   Input ~ 0
MISO
Text GLabel 5150 5300 2    50   Input ~ 0
SCK_5V
Text GLabel 4650 5300 0    50   Input ~ 0
SCK
Text GLabel 1600 5300 2    50   Input ~ 0
MOSI_5V
Text GLabel 1100 5300 0    50   Input ~ 0
MOSI
Text GLabel 2800 5300 2    50   Input ~ 0
Reset_5V
Text GLabel 2300 5300 0    50   Input ~ 0
Reset
Wire Wire Line
	4000 5300 3950 5300
Wire Wire Line
	3500 5300 3550 5300
Wire Wire Line
	5150 5300 5100 5300
Wire Wire Line
	4650 5300 4700 5300
Wire Wire Line
	1100 5300 1150 5300
Wire Wire Line
	1600 5300 1550 5300
Wire Wire Line
	2300 5300 2350 5300
Wire Wire Line
	2800 5300 2750 5300
$Comp
L Device:R_Pack04 RN1
U 1 1 5E5AAE2A
P 2200 4150
F 0 "RN1" H 2388 4196 50  0000 L CNN
F 1 "R_Pack04" H 2388 4105 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 2475 4150 50  0001 C CNN
F 3 "~" H 2200 4150 50  0001 C CNN
	1    2200 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 3950 2100 3950
Connection ~ 2100 3950
Wire Wire Line
	2100 3950 2200 3950
Connection ~ 2200 3950
Wire Wire Line
	2200 3950 2300 3950
Wire Wire Line
	1600 5300 1600 4350
Wire Wire Line
	2800 5300 2800 4600
Wire Wire Line
	2100 4600 2100 4350
Wire Wire Line
	4000 5300 4000 4550
Wire Wire Line
	5150 5300 5150 4500
$Comp
L Device:R_Pack04 RN3
U 1 1 5E5E4B48
P 3150 4150
F 0 "RN3" H 3338 4196 50  0000 L CNN
F 1 "R_Pack04" H 3338 4105 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 3425 4150 50  0001 C CNN
F 3 "~" H 3150 4150 50  0001 C CNN
	1    3150 4150
	1    0    0    -1  
$EndComp
Text GLabel 2950 3950 1    50   Input ~ 0
PWR
Wire Wire Line
	2950 3950 3050 3950
Connection ~ 3050 3950
Wire Wire Line
	3050 3950 3150 3950
Connection ~ 3150 3950
Wire Wire Line
	3150 3950 3250 3950
Wire Wire Line
	1600 4350 2000 4350
Wire Wire Line
	2100 4600 2800 4600
Wire Wire Line
	1150 5300 1150 4750
Connection ~ 1150 5300
Wire Wire Line
	2350 5300 2350 4850
Connection ~ 2350 5300
Connection ~ 3550 5300
Wire Wire Line
	4700 4650 4700 5300
Connection ~ 4700 5300
$Comp
L Device:R_Pack04 RN2
U 1 1 5E680DA3
P 2700 2700
F 0 "RN2" H 2888 2746 50  0000 L CNN
F 1 "R_Pack0410K" H 2888 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 2975 2700 50  0001 C CNN
F 3 "~" H 2700 2700 50  0001 C CNN
	1    2700 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3100 2700 2900
Wire Wire Line
	2700 2500 2800 2500
Connection ~ 2800 2500
Wire Wire Line
	2500 2900 2600 2900
Wire Wire Line
	2600 2150 2600 2500
Wire Wire Line
	2050 2150 2600 2150
Wire Wire Line
	2800 2500 2800 2100
Wire Wire Line
	3000 1800 3000 2300
Wire Wire Line
	2800 2900 3000 2900
Wire Wire Line
	3050 2300 3000 2300
Connection ~ 3000 2300
Wire Wire Line
	3000 2300 3000 2900
Wire Wire Line
	2500 2500 1500 2500
Wire Wire Line
	2050 3100 2700 3100
Connection ~ 2500 2900
Wire Wire Line
	2350 2900 2500 2900
Text GLabel 4800 3100 2    50   Input ~ 0
Free1
Wire Wire Line
	4750 3100 4800 3100
Text GLabel 7950 2050 3    50   Input ~ 0
Free1
Wire Wire Line
	7950 2050 7950 1950
Wire Wire Line
	10350 3700 10400 3700
Wire Wire Line
	10500 4300 10550 4300
Connection ~ 10500 4300
Wire Wire Line
	10500 4600 10550 4600
Connection ~ 10500 4600
Wire Wire Line
	9100 4300 9150 4300
Wire Wire Line
	2600 1800 2350 1800
Wire Wire Line
	2350 1800 2350 1400
Connection ~ 2350 1400
Wire Wire Line
	2350 1400 2550 1400
Wire Wire Line
	2950 4950 3550 4950
Wire Wire Line
	3550 4950 3550 5300
Wire Wire Line
	2950 4350 2950 4950
Wire Wire Line
	3150 4850 2350 4850
Wire Wire Line
	3150 4350 3150 4850
Wire Wire Line
	3250 4750 1150 4750
Wire Wire Line
	3250 4350 3250 4750
Wire Wire Line
	3050 4350 3050 4650
Wire Wire Line
	3050 4650 4700 4650
Wire Wire Line
	2200 4500 2200 4350
Wire Wire Line
	2200 4500 5150 4500
Wire Wire Line
	2300 4550 4000 4550
Wire Wire Line
	2300 4350 2300 4550
$Comp
L Device:R R2
U 1 1 5DB02B41
P 8250 1900
F 0 "R2" V 8043 1900 50  0000 C CNN
F 1 "26KOhm" V 8134 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8180 1900 50  0001 C CNN
F 3 "~" H 8250 1900 50  0001 C CNN
	1    8250 1900
	-1   0    0    1   
$EndComp
$Comp
L Transistor_FET:BSS138 Q2
U 1 1 5DC86628
P 2150 2900
F 0 "Q2" V 2493 2900 50  0000 C CNN
F 1 "BSS138" V 2402 2900 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2350 2825 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 2150 2900 50  0001 L CNN
	1    2150 2900
	-1   0    0    1   
$EndComp
$Comp
L Transistor_FET:BSS138 Q6
U 1 1 5E4C9ACB
P 4900 5200
F 0 "Q6" V 5150 5200 50  0000 C CNN
F 1 "BSS138" V 5241 5200 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5100 5125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 4900 5200 50  0001 L CNN
	1    4900 5200
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q5
U 1 1 5E4DFB79
P 3750 5200
F 0 "Q5" V 4000 5200 50  0000 C CNN
F 1 "BSS138" V 4091 5200 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3950 5125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 3750 5200 50  0001 L CNN
	1    3750 5200
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q4
U 1 1 5E4E73C7
P 2550 5200
F 0 "Q4" V 2800 5200 50  0000 C CNN
F 1 "BSS138" V 2891 5200 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2750 5125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 2550 5200 50  0001 L CNN
	1    2550 5200
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q3
U 1 1 5E4D8673
P 1350 5200
F 0 "Q3" V 1600 5200 50  0000 C CNN
F 1 "BSS138" V 1691 5200 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1550 5125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 1350 5200 50  0001 L CNN
	1    1350 5200
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female +Charge-1
U 1 1 5DAD3249
P 10600 3600
F 0 "+Charge-1" H 10628 3576 50  0000 L CNN
F 1 "Charge" H 10628 3485 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 10600 3600 50  0001 C CNN
F 3 "~" H 10600 3600 50  0001 C CNN
	1    10600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2400 5700 2400
Wire Wire Line
	4750 2500 5700 2500
Wire Wire Line
	4750 2600 5700 2600
$EndSCHEMATC
