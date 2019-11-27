#include <Adafruit_NeoPixel.h>
#include "RunningMedian.h"

#define RAW_SPECTRUM_AIN A0 // PC0
#define GAIN_SELECT_OUT A1 // PC1
#define ATTACK_SELECT_OUT A2 // PC2
#define EQ_BAND_OUT A4 // PC4
#define EQ_RESET_OUT A5 // PC5
#define LED1_OUT 2 // PD2

#define BUTTON_IN 4 // PD4
#define PWR_HOLD_OUT 5 // PD5
#define CHRG_IN 6 // PD6
#define STDBY_IN 7 // PD7

#define LED_COUNT 2
#define LED_PIN LED1_OUT
#define BRIGHTNESS  255

int mode = 0;

Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_GRBW + NEO_KHZ800);
RunningMedian median0 = RunningMedian(64);
RunningMedian median1 = RunningMedian(64);
RunningMedian median2 = RunningMedian(64);
RunningMedian median3 = RunningMedian(64);
RunningMedian median4 = RunningMedian(64);
RunningMedian median5 = RunningMedian(64);
RunningMedian median6 = RunningMedian(64);

int spectrumValue[7];

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
  
  digitalWrite(EQ_RESET_OUT, LOW);
  digitalWrite(EQ_BAND_OUT, HIGH);
  digitalWrite(PWR_HOLD_OUT, HIGH);
  
//  digitalWrite(PWR_HOLD_OUT, LOW);

  strip.begin();           // INITIALIZE NeoPixel strip object (REQUIRED)
  strip.setBrightness(BRIGHTNESS); // Set BRIGHTNESS (max = 255)
  for(int i=0; i<strip.numPixels(); i++) { // For each pixel in strip...
    strip.setPixelColor(i, 0);         
  }
  strip.show();            
}

// the loop function runs over and over again forever
void loop(){
  delay(2);
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

  median0.add(spectrumValue[0]);
  median1.add(spectrumValue[1]);
  median2.add(spectrumValue[2]);
  median3.add(spectrumValue[3]);
  median4.add(spectrumValue[4]);
  median5.add(spectrumValue[5]);
  median6.add(spectrumValue[6]);
//
//  if(digitalRead(CHRG_IN)){
//    rand1 = 255;
//  }else{
//    rand1 = 0;
//}
//
//  if(digitalRead(STDBY_IN)){
//    rand2 = 255;
//  }else{
//    rand2 = 0;
//}
//  if(mode==0){
    randomFlare();
//  }
  strip.show();            
  delay(0);
    //digitalWrite(PWR_HOLD_OUT, LOW);

}


int hue;
int bassAvg = 0;
void randomFlare(){
    int bass = spectrumValue[0];
    int max = getIndexOfMaximumValue();
    if(max == 0){
      hue = 0;
    }
    if(max == 1){
      hue = 0;
    }
    if(max == 2){
      hue = 15000;
    }
    if(max == 3){
      //hue = 15000;
    }
    if(max == 4){
       //hue = 30000;
    }
    if(max == 5){
      //hue = 30000;
    }
    if(max == 6){
      //hue = 50000;
    }
    if (bass < 1) {
      strip.setBrightness(0);
    } else {
      uint32_t rgbcolor = strip.Color(median2.getHighest()/4, median3.getHighest()/4, median6.getHighest()/4, median0.getMedian()/8);
      //uint32_t rgbcolor = strip.ColorHSV(hue);
      strip.fill(rgbcolor);
      strip.setBrightness(map(median0.getMedian(),0,800,20,255));
    }
}

int getIndexOfMaximumValue(){
 int maxIndex = 0;
 int max = spectrumValue[maxIndex];
 for (int i=1; i<7; i++){
   if (max<spectrumValue[i]){
     max = spectrumValue[i];
     maxIndex = i;
   }
 }
 return maxIndex;
}
