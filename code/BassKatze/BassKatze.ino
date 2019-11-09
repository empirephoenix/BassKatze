#include <FastLED.h>




#define RAW_SPECTRUM_AIN A0 // PC0
#define GAIN_SELECT_OUT A1 // PC1
#define ATTACK_SELECT_OUT A2 // PC2
#define EQ_BAND_OUT A4 // PC4
#define EQ_RESET_OUT A5 // PC5
#define LED1_OUT 2 // PD1
#define BUTTON_IN 4 // PD4
#define PWR_HOLD_OUT 5 // PD5
#define CHRG_IN 6 // PD6
#define STDBY_IN 7 // PD7


int rand1 =  0;
int rand2 =  200;
int rand3 =  0;


// How many leds in your strip?
#define NUM_LEDS 16
#define DATA_PIN LED1_OUT

// Define the array of leds
CRGB leds[NUM_LEDS];
#define BRIGHTNESS        16


int spectrumValue[7];
int filter=80;

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
  
  LEDS.setBrightness(BRIGHTNESS);
  
  digitalWrite(EQ_RESET_OUT, LOW);
  digitalWrite(EQ_BAND_OUT, HIGH);

  digitalWrite(PWR_HOLD_OUT, HIGH);
  
//  digitalWrite(PWR_HOLD_OUT, LOW);

  FastLED.addLeds<WS2812, DATA_PIN, GRB>(leds, NUM_LEDS);
}

// the loop function runs over and over again forever
void loop(){

  digitalWrite(EQ_RESET_OUT, HIGH);
  digitalWrite(EQ_RESET_OUT, LOW);
  for (int i=0;i<7;i++){
    digitalWrite(EQ_BAND_OUT, LOW);
    delay(10);
    spectrumValue[i]=analogRead(RAW_SPECTRUM_AIN);
    spectrumValue[i]=constrain(spectrumValue[i], filter, 1023);
    spectrumValue[i]=map(spectrumValue[i], filter,1023,0,255);
    digitalWrite(EQ_BAND_OUT, HIGH);
  }

  rand3 = 25;

  if(digitalRead(CHRG_IN)){
    rand1 = 255;
  }else{
    rand1 = 0;
}

  if(digitalRead(STDBY_IN)){
    rand2 = 255;
  }else{
    rand2 = 0;
}


  for (int blinky=0;blinky<16;blinky++) {
    leds[blinky] = CRGB(rand1, rand2, rand3);     
  }

  LEDS.setBrightness(16);
//  LEDS.setBrightness(spectrumValue[0]);
    
  if (spectrumValue[0]<50) {
    rand1 = random(255);
    rand2 = random(255);
    rand3 = random(255);
  }

  
     
    FastLED.show();
    //delay(10000);
    //digitalWrite(PWR_HOLD_OUT, LOW);

}
