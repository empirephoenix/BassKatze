#include <Arduino.h>
#include <ESP32TimerInterrupt.h>
#include "arduinoFFT.h"
#include "RunningMedian.h"

#define BLUE1_PIN 14
#define BLUE2_PIN 4
#define BLUE1_CHANNEL 0
#define BLUE2_CHANNEL 1

#define RED1_PIN 27
#define RED2_PIN 5
#define RED1_CHANNEL 2
#define RED2_CHANNEL 3

#define GREEN1_PIN 12
#define GREEN2_PIN 16
#define GREEN1_CHANNEL 4
#define GREEN2_CHANNEL 5

#define WHITE1_PIN 26
#define WHITE2_PIN 17
#define WHITE1_CHANNEL 6
#define WHITE2_CHANNEL 7

#define I2S_SAMPLE_RATE (10000) // Max sampling frequency = 277.777 kHz
#define MIC_PIN 35
#define sampleBuffer 512                                                             
ESP32Timer ITimer0(0);

#define freq 2000
#define resolution 8

double vReal[sampleBuffer];
double vImag[sampleBuffer];

arduinoFFT FFT =  arduinoFFT(vReal,vImag,sampleBuffer, I2S_SAMPLE_RATE);


int readOffset = 0;
volatile bool process = false;
bool IRAM_ATTR TimerHandler0(void * timerNo)
{ 
  if(!process){
    double value = analogRead(MIC_PIN);
    vReal[readOffset] = value;
    vImag[readOffset] = 0;
    readOffset++;
    if(readOffset == sampleBuffer){
      readOffset = 0;
      process = 1;
    }
  }
  return true;
}

void setup() {
  Serial.begin(115200); // use the serial port

  pinMode(MIC_PIN, INPUT);

  pinMode(BLUE1_PIN, OUTPUT);
  pinMode(BLUE2_PIN, OUTPUT);
  pinMode(RED1_PIN, OUTPUT);
  pinMode(RED2_PIN, OUTPUT);
  pinMode(GREEN1_PIN, OUTPUT);
  pinMode(GREEN2_PIN, OUTPUT);
  pinMode(WHITE1_PIN, OUTPUT);
  pinMode(WHITE2_PIN, OUTPUT);

  ledcSetup(BLUE1_CHANNEL, freq, resolution);
  ledcSetup(BLUE2_CHANNEL, freq, resolution);
  ledcSetup(RED1_CHANNEL, freq, resolution);
  ledcSetup(RED2_CHANNEL, freq, resolution);
  ledcSetup(GREEN1_CHANNEL, freq, resolution);
  ledcSetup(GREEN2_CHANNEL, freq, resolution);
  ledcSetup(WHITE1_CHANNEL, freq, resolution);
  ledcSetup(WHITE2_CHANNEL, freq, resolution);

  ledcAttachPin(BLUE1_PIN, BLUE1_CHANNEL);
  ledcAttachPin(BLUE2_PIN, BLUE2_CHANNEL);
  ledcAttachPin(RED1_PIN, RED1_CHANNEL);
  ledcAttachPin(RED2_PIN, RED2_CHANNEL);
  ledcAttachPin(GREEN1_PIN, GREEN1_CHANNEL);
  ledcAttachPin(GREEN2_PIN, GREEN2_CHANNEL);
  ledcAttachPin(WHITE1_PIN, WHITE1_CHANNEL);
  ledcAttachPin(WHITE2_PIN, WHITE2_CHANNEL);

  if (ITimer0.attachInterruptInterval(100, TimerHandler0))
  {
    Serial.print(F("Starting  ITimer0 OK, millis() = ")); Serial.println(millis());
  }
  
}



//arduinoFFT fft = arduinoFFT();

size_t bytes_read;
void loop()
{
  ledcWrite(RED1_CHANNEL,255);
  ledcWrite(RED2_CHANNEL,255);
  ledcWrite(GREEN1_CHANNEL,255);
  ledcWrite(GREEN2_CHANNEL,255);
  ledcWrite(WHITE1_CHANNEL,255);
  ledcWrite(WHITE2_CHANNEL,255);
  ledcWrite(BLUE1_CHANNEL,255);
  ledcWrite(BLUE2_CHANNEL,255);
  delay(500);
  ledcWrite(GREEN1_CHANNEL,0);
  ledcWrite(GREEN2_CHANNEL,0);
  ledcWrite(BLUE1_CHANNEL,0);
  ledcWrite(BLUE2_CHANNEL,0);
  ledcWrite(WHITE1_CHANNEL,0);
  ledcWrite(WHITE2_CHANNEL,0);
  ledcWrite(RED1_CHANNEL,0);
  ledcWrite(RED2_CHANNEL,0);
  
  delay(500);

  if(process ){
    FFT.DCRemoval();
    FFT.Windowing(FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    FFT.Compute(FFT_FORWARD);
    FFT.ComplexToMagnitude();
    
  }
  
  ///fft.Windowing(WINDOW_)
  //fft.
  //fft.Compute(FFT_FORWARD);
  Serial.println(FFT.MajorPeak());
  //Serial.printf("%d ", analogRead(MIC_PIN)); // Print compatible with Arduino Plotter
  //Serial.printf("\n");
}