#include <Adafruit_NeoPixel.h>


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


int rand1 =  0;
int rand2 =  200;
int rand3 =  0;
int rand4 =  0;


// How many leds in your strip?
#define LED_COUNT 2
#define LED_PIN LED1_OUT
#define BRIGHTNESS  255

// Declare the array of leds
Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_GRBW + NEO_KHZ800);
// Argument 1 = Number of pixels in NeoPixel strip
// Argument 2 = Arduino pin number (most are valid)
// Argument 3 = Pixel type flags, add together as needed:
//   NEO_KHZ800  800 KHz bitstream (most NeoPixel products w/WS2812 LEDs)
//   NEO_KHZ400  400 KHz (classic 'v1' (not v2) FLORA pixels, WS2811 drivers)
//   NEO_GRB     Pixels are wired for GRB bitstream (most NeoPixel products)
//   NEO_RGB     Pixels are wired for RGB bitstream (v1 FLORA pixels, not v2)
//   NEO_RGBW    Pixels are wired for RGBW bitstream (NeoPixel RGBW products)

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

  digitalWrite(EQ_RESET_OUT, HIGH);
  digitalWrite(EQ_RESET_OUT, LOW);
  for (int i=0;i<7;i++){
    digitalWrite(EQ_BAND_OUT, LOW);
    delay(5);
    spectrumValue[i]=analogRead(RAW_SPECTRUM_AIN);
    spectrumValue[i]=constrain(spectrumValue[i], filter, 1023);
    spectrumValue[i]=map(spectrumValue[i], filter,1023,0,255);
    digitalWrite(EQ_BAND_OUT, HIGH);
  }

  rand3 = 25;
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


  for(int i=0; i<strip.numPixels(); i++) { // For each pixel in strip...
    strip.setPixelColor(i, rand1, rand2, rand3, rand4); 
  }

  strip.setBrightness(spectrumValue[0]); // Set BRIGHTNESS (max = 255)
    
  if (spectrumValue[0]<50) {
    rand1 = random(255);
    rand2 = random(255);
    rand3 = random(255);
    rand4 = random(255);
  }

  
     
  strip.show();            
  delay(0);
    //digitalWrite(PWR_HOLD_OUT, LOW);

}
