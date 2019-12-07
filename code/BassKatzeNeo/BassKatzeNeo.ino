#include <Adafruit_NeoPixel.h>
#include "RunningMedian.h"
#include"timer-api.h"

#define RAW_SPECTRUM_AIN A0 // PC0
#define GAIN_SELECT_OUT A1 // PC1
#define ATTACK_SELECT_OUT A2 // PC2
#define PWR_IN A3 // PC3
#define EQ_BAND_OUT A4 // PC4
#define EQ_RESET_OUT A5 // PC5
#define LED1_OUT 2 // PD2

#define BUTTON_IN 4 // PD4
#define PWR_HOLD_OUT 5 // PD5
#define CHRG_IN 6 // PD6
#define STDBY_IN 7 // PD7

#define LED_COUNT 16
#define LED_PIN LED1_OUT

#define BATT_MAX 659  // 4,25V/6(Spannungsteiler)/1.1(interne Referenz)*1024(10Bit ADC)
#define BATT_MIN 527  // 3,4V/6(Spannungsteiler)/1.1(interne Referenz)*1024(10Bit ADC)
#define BATT_WARN 543  // 3,5V/6(Spannungsteiler)/1.1(interne Referenz)*1024(10Bit ADC)


Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_GRBW + NEO_KHZ800);

volatile int spectrumValue[7];
volatile int currentBatteryLevel = BATT_MAX;
bool chargestate = false;
bool standbystate = false;
int brightness = 16;
int mode = 0;
bool currentButton;
bool warnDetected = false;


// the setup function runs once when you press reset or power the board
void setup() {
  analogReference(INTERNAL);
  randomSeed(analogRead(0));
  Serial.begin(9600);
  pinMode(RAW_SPECTRUM_AIN, INPUT);
  pinMode(EQ_BAND_OUT, OUTPUT);
  pinMode(EQ_RESET_OUT, OUTPUT);
  pinMode(LED1_OUT, OUTPUT);
  pinMode(PWR_HOLD_OUT, OUTPUT);
  pinMode(CHRG_IN, INPUT_PULLUP);
  pinMode(STDBY_IN, INPUT_PULLUP);
  pinMode(BUTTON_IN, INPUT);
  pinMode(GAIN_SELECT_OUT, INPUT);
  pinMode(ATTACK_SELECT_OUT, INPUT);
  
  
  
  digitalWrite(EQ_RESET_OUT, LOW);
  digitalWrite(EQ_BAND_OUT, HIGH);
  digitalWrite(PWR_HOLD_OUT, HIGH);

  

  strip.begin();           // INITIALIZE NeoPixel strip object (REQUIRED)
  strip.setBrightness(brightness); // Set BRIGHTNESS (max = 255)
  for(int i=0; i<strip.numPixels(); i++) { // For each pixel in strip...
    strip.setPixelColor(i, 0);         
  }
  strip.show();          
  timer_init_ISR_50Hz(TIMER_DEFAULT);  
  
}

void timer_handle_interrupts(int timer) {
  if(timer != TIMER_DEFAULT){
    return;
  }
  currentBatteryLevel = analogRead(PWR_IN)*0.1+currentBatteryLevel*0.9;
  digitalWrite(EQ_RESET_OUT, HIGH);
  digitalWrite(EQ_BAND_OUT, HIGH);
  delayMicroseconds(18);
  digitalWrite(EQ_BAND_OUT, LOW);
  delayMicroseconds(72);
  digitalWrite(EQ_BAND_OUT, HIGH);
  digitalWrite(EQ_RESET_OUT, LOW);
  delayMicroseconds(18);
  digitalWrite(EQ_BAND_OUT, LOW);
  for (int i=0;i<7;i++){
    delayMicroseconds(36);
    spectrumValue[i]=analogRead(RAW_SPECTRUM_AIN);
    delayMicroseconds(18);
    digitalWrite(EQ_BAND_OUT, HIGH);
    delayMicroseconds(18);
    digitalWrite(EQ_BAND_OUT, LOW);
  }
}



// the loop function runs over and over again forever
void loop(){
  
  if (currentBatteryLevel < BATT_MIN) {
    digitalWrite(PWR_HOLD_OUT, LOW);
    return;
  }
  
  parseChargeState();
  checkButton();

  if (warnDetected) {
    if (chargestate) {
      warnDetected = false;
      return;
    }
    warnMode();
    strip.show();
    if (currentButton) {
      digitalWrite(PWR_HOLD_OUT, LOW);
    }
    return;
  }

  
  if ((currentBatteryLevel < BATT_WARN) && !chargestate) {
    warnDetected = true;
    return;
  } 
  
    strip.setBrightness(brightness);
    if(currentButton){
      buttonIndicator();
    }else {
      if(mode == 1){
        flashLight();
      }else if(mode == 2){
        randomFlare();
      }else {
        digitalWrite(PWR_HOLD_OUT, LOW);
      }
    }

  strip.show();            
}

void checkButton(){
  bool cur = digitalRead(BUTTON_IN);
  if(!cur && currentButton){
    mode++;
  }
  currentButton = cur;
}

void flashLight(){
  if (chargestate) {
    uint32_t rgbcolor = strip.Color(255,0,0,0);
    strip.fill(rgbcolor);
  }
  else if (standbystate) {
    uint32_t rgbcolor = strip.Color(0,0,255,0);
    strip.fill(rgbcolor);
  } else {
    uint32_t rgbcolor = strip.Color(0,0,0,255);
    strip.fill(rgbcolor);
  }
}

void warnMode() {
  bool on = (millis()/1000)%2==0;
  uint32_t rgbcolor = strip.Color(on?255:0,0,0,0);
  strip.fill(rgbcolor);
}

void buttonIndicator(){
  uint32_t rgbcolor = strip.Color(255,255,255,255);
  strip.fill(rgbcolor);
}

void parseChargeState(){
  int charge = digitalRead(CHRG_IN);
  int standby = digitalRead(STDBY_IN);
  chargestate = false;
  standbystate = false;
  
  if (!(charge && standby)) {
    if (charge) {
      chargestate=true;
     
    }  
    if (standby) {
      standbystate=true;
     
    }
  }
}


void randomFlare(){
  uint32_t rgbcolor = strip.Color(0,spectrumValue[0]/4,spectrumValue[1],0);
  strip.fill(rgbcolor);
}

void chargeIndicator() {
  int batLeveL = map(currentBatteryLevel,BATT_MIN,BATT_MAX,10,1);
  bool on = ((millis()/100)%batLeveL)==0;
  uint32_t rgbcolor = strip.Color(0,on?255:0,0,0);
  strip.fill(rgbcolor);
}
