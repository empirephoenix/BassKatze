#include <MSGEQ7.h>
#include <Adafruit_NeoPixel.h>
#include "RunningMedian.h"

#define RAW_SPECTRUM_AIN A0  // PC0
#define GAIN_SELECT_OUT A1   // PC1
#define ATTACK_SELECT_OUT A2 // PC2
#define PWR_IN A3            // PC3
#define EQ_BAND_OUT A4       // PC4
#define EQ_RESET_OUT A5      // PC5
#define LED1_OUT 2           // PD2
#define MSGEQ7_INTERVAL ReadsPerSecond(50)

#define BUTTON_IN 4    // PD4
#define PWR_HOLD_OUT 5 // PD5
#define CHRG_IN 6      // PD6
#define STDBY_IN 7     // PD7

#define LED_COUNT 16
#define LED_PIN LED1_OUT

#define BATT_MAX 659  // 4,25V/6(Spannungsteiler)/1.1(interne Referenz)*1024(10Bit ADC)
#define BATT_MIN 527  // 3,4V/6(Spannungsteiler)/1.1(interne Referenz)*1024(10Bit ADC)
#define BATT_WARN 543 // 3,5V/6(Spannungsteiler)/1.1(interne Referenz)*1024(10Bit ADC)

#define DENOISE_MIN 19

#define BRIGHTNESS_CHANGE_SPEED 250
#define BRIGHTNESS_STEP 32
#define BRIGHTNESS_TRIGGER_DELAY 2000

Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_GRBW + NEO_KHZ800);
  CMSGEQ7<0, EQ_RESET_OUT, EQ_BAND_OUT, RAW_SPECTRUM_AIN> eq;

volatile int currentBatteryLevel = BATT_MAX;
bool chargestate = false;
bool standbystate = false;

uint8_t brightness = BRIGHTNESS_STEP;
bool brightnessInc = true;
bool brightnessChange = false;
uint32_t nextBrightnessChange = 0;

uint8_t mode = 0;
bool currentButton;
bool warnDetected = false;

//beatdetect variables
float frame = 0.9;
float bassAvg;
float snareAvg;
float hatAvg;

uint32_t buttonPressStart;
uint32_t nextBeatDetect;

uint16_t hue = 0;

typedef struct rawcolor_t
{
  uint8_t r;
  uint8_t g;
  uint8_t b;
  uint8_t w;
};


union color_t { 
 rawcolor_t raw;
 uint32_t rgbw;
};

// the setup function runs once when you press reset or power the board
void setup()
{
  analogReference(INTERNAL);
  randomSeed(analogRead(0));
  Serial.begin(9600);
  eq.begin();
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

  strip.begin();                   // INITIALIZE NeoPixel strip object (REQUIRED)
  strip.setBrightness(brightness); // Set BRIGHTNESS (max = 255)
  for (int i = 0; i < strip.numPixels(); i++)
  { // For each pixel in strip...
    strip.setPixelColor(i, 0);
  }
  strip.show();

}

// the loop function runs over and over again forever
void loop()
{
  bool newReading = eq.read(MSGEQ7_INTERVAL);
  currentBatteryLevel = analogRead(PWR_IN) * 0.1 + currentBatteryLevel * 0.9;
  if (currentBatteryLevel < BATT_MIN)
  {
    digitalWrite(PWR_HOLD_OUT, LOW);
    return;
  }

  parseChargeState();
  checkButton();

  if (warnDetected)
  {
    if (chargestate)
    {
      warnDetected = false;
      return;
    }
    warnMode();
    strip.show();
    if (currentButton)
    {
      digitalWrite(PWR_HOLD_OUT, LOW);
    }
    return;
  }

  if ((currentBatteryLevel < BATT_WARN) && !chargestate)
  {
    warnDetected = true;
    return;
  }

  strip.setBrightness(brightness);
  if (currentButton)
  {
    buttonIndicator();
  }
  else if(newReading)
  {
    if (mode == 1)
    {
      flashLight();
    }
    else if (mode == 2)
    {
      randomFlare();
    }
    else if (mode == 3)
    {
      beatDetect();
    }
    else if (mode == 4)
    {
      hueFlare();
    }
    else
    {
      digitalWrite(PWR_HOLD_OUT, LOW);
      //return to initial mode, if isp is connected and shutdown is not possible
      delay(100);
      mode = 0;
    }
  }

  strip.show();
}

void checkButton()
{
  bool cur = digitalRead(BUTTON_IN);
  brightnessChange = millis() - buttonPressStart > BRIGHTNESS_TRIGGER_DELAY;
  if (cur && !currentButton)
  {
    buttonPressStart = millis();
  }
  if (!cur && currentButton && !brightnessChange)
  {
    pinMode(GAIN_SELECT_OUT, INPUT);
    pinMode(ATTACK_SELECT_OUT, INPUT);
    mode++;
  }
  if(mode == 0 && !cur){
    pinMode(GAIN_SELECT_OUT, INPUT);
    pinMode(ATTACK_SELECT_OUT, INPUT);
    mode++;
  }
  currentButton = cur;
}

void flashLight()
{
  if (chargestate)
  {
    chargeIndicator();
  }
  else if (standbystate)
  {
    uint32_t rgbcolor = strip.Color(0, 0, 255, 0);
    strip.fill(rgbcolor);
  }
  else
  {
    uint32_t rgbcolor = strip.Color(0, 0, 0, 255);
    strip.fill(rgbcolor);
  }
}

void warnMode()
{
  bool on = (millis() / 1000) % 2 == 0;
  uint32_t rgbcolor = strip.Color(on ? 255 : 0, 0, 0, 0);
  strip.fill(rgbcolor);
}

void buttonIndicator()
{
  if (brightnessChange)
  {
    if (nextBrightnessChange < millis())
    {
      nextBrightnessChange = millis() + BRIGHTNESS_CHANGE_SPEED;
      if (brightnessInc)
      {
        brightness += BRIGHTNESS_STEP;
        if (brightness >= 255)
        {
          brightness = 255;
          brightnessInc = false;
        }
      }
      else
      {
        brightness -= BRIGHTNESS_STEP;
        if (brightness <= BRIGHTNESS_STEP)
        {
          brightness = BRIGHTNESS_STEP;
          brightnessInc = true;
        }
      }
    }
  } else {
    chargeIndicator();
  }
}

void parseChargeState()
{
  int charge = digitalRead(CHRG_IN);
  int standby = digitalRead(STDBY_IN);
  chargestate = false;
  standbystate = false;

  if (!(charge && standby))
  {
    if (!charge)
    {
      chargestate = true;
    }
    if (!standby)
    {
      standbystate = true;
    }
  }
}

void beatDetect()
{
  digitalWrite(ATTACK_SELECT_OUT, HIGH);
  if (nextBeatDetect > millis())
  {
    return;
  }
  if (nextBeatDetect + 100 < millis())
  {
    nextBeatDetect = millis() + 20;
  }
  else
  {
    nextBeatDetect = nextBeatDetect + 10;
  }

  float new_bass = denoise(eq.get(0)) + denoise(eq.get(1));
  float new_snare = denoise(eq.get(3));
  float new_hat = denoise(eq.get(6)) + denoise(eq.get(5));

  uint8_t r = 0;
  uint8_t g = 0;
  uint8_t b = 0;

  if ((new_snare / snareAvg) > 1)
  {
    r = new_snare/2;
  }
  if ((new_hat / hatAvg) > 1)
  {
    g = new_hat;
  }
  if ((new_bass / bassAvg) > 1)
  {
    b = new_bass/2;
  }
  hatAvg = hatAvg * frame + new_hat * (1 - frame);
  bassAvg = bassAvg * frame + new_bass * (1 - frame);
  snareAvg = snareAvg * frame + new_snare * (1 - frame);

  uint32_t rgbcolor = strip.Color(r, g, b, 0);
  strip.fill(rgbcolor);
}

uint16_t denoise(uint16_t value)
{
  if (value < DENOISE_MIN)
  {
    value = DENOISE_MIN;
  }
  return map(value, DENOISE_MIN, 1024, 0, 1024);
}

void randomFlare()
{
  uint32_t rgbcolor = strip.Color(denoise(eq.get(2)), denoise(eq.get(0)), denoise(eq.get(1)), 0);
  strip.fill(rgbcolor);
}


void hueFlare(){
  hue+=10;

  uint8_t bands = 2;
  uint16_t power = 0;
  for(uint8_t i = 0;i<bands;i++){
    power += denoise(eq.get(i));
  }
  power = power / bands;

  color_t rgbcolor;
  rgbcolor.rgbw = strip.ColorHSV(hue, 255, power);
  rgbcolor = modifyWhite(rgbcolor);
  

  strip.fill(rgbcolor.rgbw);
}

color_t modifyWhite(color_t in){
  if(in.raw.w == 0){
    uint8_t w = min(in.raw.r,in.raw.g);
    w = min(w,in.raw.b);
    in.raw.b -= w;
    in.raw.g -= w;
    in.raw.b -= w;
    in.raw.w = w*1;
  }
  return in;
}

void chargeIndicator()
{
  uint8_t batLeveL = map(currentBatteryLevel, BATT_MIN, BATT_MAX, 20, 2);
  bool on = ((millis() / 100) % batLeveL) == 0;
  uint32_t rgbcolor = strip.Color(0, on ? 255 : 0, 0, 0);
  strip.fill(rgbcolor);
}
