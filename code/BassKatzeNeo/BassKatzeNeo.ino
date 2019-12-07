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

#define DENOISE_MIN 80

#define BRIGHTNESS_CHANGE_SPEED 250
#define BRIGHTNESS_STEP 64
#define BRIGHTNESS_TRIGGER_DELAY 2000


Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_GRBW + NEO_KHZ800);

volatile int spectrumValue[7];
volatile int currentBatteryLevel = BATT_MAX;
bool chargestate = false;
bool standbystate = false;

int brightness = BRIGHTNESS_STEP;
bool brightnessInc = true;
bool brightnessChange = false;
unsigned long nextBrightnessChange = 0;

int mode = 0;
bool currentButton;
bool warnDetected = false;

//beatdetect variables
const int frames = 50;
int frame = 0;
int bass[frames];
int snare[frames];
int hat[frames];

unsigned long buttonPressStart;

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
      }else if(mode == 3){
        beatDetect();
      }else {
        digitalWrite(PWR_HOLD_OUT, LOW);
        //return to initial mode, if isp is connected and shutdown is not possible
        delay(100);
        mode=0;
      }
    }

  strip.show();            
}

void checkButton(){
  bool cur = digitalRead(BUTTON_IN);
  brightnessChange = millis()-buttonPressStart > BRIGHTNESS_TRIGGER_DELAY;
  if(cur && !currentButton){
    buttonPressStart = millis();
  }
  if(!cur && currentButton && !brightnessChange){
    pinMode(GAIN_SELECT_OUT, INPUT);
    pinMode(ATTACK_SELECT_OUT, INPUT);
    mode++;
  }
  currentButton = cur;
}

void flashLight(){
  if (chargestate) {
    chargeIndicator();
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
  if(brightnessChange){
    if(nextBrightnessChange < millis()){
      nextBrightnessChange = millis() + BRIGHTNESS_CHANGE_SPEED;
      if(brightnessInc){
        brightness += BRIGHTNESS_STEP;
        if(brightness >= 255){
          brightness = 255;
          brightnessInc = false;
        }
      }else {
         brightness -= BRIGHTNESS_STEP;
         if(brightness <= BRIGHTNESS_STEP){
            brightness = BRIGHTNESS_STEP;
            brightnessInc = true;
        }
      }
    }
  }
  uint32_t rgbcolor = strip.Color(255,255,255,255);
  strip.fill(rgbcolor);
}

void parseChargeState(){
  int charge = digitalRead(CHRG_IN);
  int standby = digitalRead(STDBY_IN);
  chargestate = false;
  standbystate = false;
  
  if (!(charge && standby)) {
    if (!charge) {
      chargestate=true;
     
    }  
    if (!standby) {
      standbystate=true;
     
    }
  }
}

int find_average(int ary[], int siz){
  double sum = 0;
  for (int i = 0; i < siz; i++){
    sum += ary[i];
  }
  return sum/siz;
}

void beatDetect(){
  digitalWrite(ATTACK_SELECT_OUT, HIGH);
  
  int new_bass = denoise(spectrumValue[0]) + denoise(spectrumValue[1]);
  int new_snare = denoise(spectrumValue[3]);
  int new_hat = denoise(spectrumValue[6]) + denoise(spectrumValue[5]);

  int r = 0;
  int g = 0;
  int b = 0;

  if ((new_snare/find_average(snare, frames)) > 1){
    r = 255;
  }
  if ((new_hat/find_average(hat, frames)) > 1){
    g = 255;
  }
  if ((new_bass/find_average(bass, frames)) > 1){
    b = 255;
  }
  hat[frame] = new_hat;
  snare[frame] = new_snare;
  bass[frame] = new_bass;
  frame++;
  if (frame >= frames) frame=0;

  uint32_t rgbcolor = strip.Color(r,g,b,0);
  strip.fill(rgbcolor);
}

int denoise(int value){
  if(value < DENOISE_MIN){
    value = DENOISE_MIN;
  }
  return map(value,50,1024,0,1024);
}

void randomFlare(){
  uint32_t rgbcolor = strip.Color(0,denoise(spectrumValue[0])/4,denoise(spectrumValue[1]),0);
  strip.fill(rgbcolor);
}

void chargeIndicator() {
  int batLeveL = map(currentBatteryLevel,BATT_MIN,BATT_MAX,10,1);
  bool on = ((millis()/100)%batLeveL)==0;
  uint32_t rgbcolor = strip.Color(0,on?255:0,0,0);
  strip.fill(rgbcolor);
}
