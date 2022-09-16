#include <Arduino.h>
#include <driver/i2s.h>
#include "arduinoFFT.h"

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
#define ADC_INPUT (ADC1_CHANNEL_7) //pin 32
#define I2S_DMA_BUF_LEN (1024)                                                                 


#define freq 2000
#define resolution 8

double vReal[I2S_DMA_BUF_LEN];
double vImag[I2S_DMA_BUF_LEN];

arduinoFFT FFT =  arduinoFFT(vReal,vImag,I2S_DMA_BUF_LEN/2, I2S_SAMPLE_RATE);


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


  i2s_config_t i2s_config = {
    .mode = (i2s_mode_t)(I2S_MODE_MASTER | I2S_MODE_RX | I2S_MODE_ADC_BUILT_IN),
    .sample_rate =  I2S_SAMPLE_RATE,              // The format of the signal using ADC_BUILT_IN
    .bits_per_sample = I2S_BITS_PER_SAMPLE_16BIT, // is fixed at 12bit, stereo, MSB
    .channel_format = I2S_CHANNEL_FMT_ALL_RIGHT,
    .communication_format = I2S_COMM_FORMAT_STAND_I2S,
    .intr_alloc_flags = ESP_INTR_FLAG_LEVEL1,
    .dma_buf_count = 8,
    .dma_buf_len = I2S_DMA_BUF_LEN,
    .use_apll = false,
    .tx_desc_auto_clear = false,
    .fixed_mclk = 0
  };
   Serial.printf("Attempting to setup I2S ADC with sampling frequency %d Hz\n", I2S_SAMPLE_RATE);
  if(ESP_OK != i2s_driver_install(I2S_NUM_0, &i2s_config, 0, NULL)){
    Serial.printf("Error installing I2S. Halt!");
    while(1);
  }
  if(ESP_OK != i2s_set_adc_mode(ADC_UNIT_1, ADC_INPUT)){
    Serial.printf("Error setting up ADC. Halt!");
    while(1);
  }
  if(ESP_OK != adc1_config_channel_atten(ADC_INPUT, ADC_ATTEN_DB_11)){
    Serial.printf("Error setting up ADC attenuation. Halt!");
    while(1);
  }

  if(ESP_OK != i2s_adc_enable(I2S_NUM_0)){
    Serial.printf("Error enabling ADC. Halt!");
    while(1);
  }
  Serial.printf("I2S ADC setup ok\n");

  
}


//arduinoFFT fft = arduinoFFT();

size_t bytes_read;
uint16_t buffer[I2S_DMA_BUF_LEN] = {0};
void loop()
{
  i2s_read(I2S_NUM_0, &buffer, sizeof(buffer), &bytes_read, portMAX_DELAY);
  Serial.printf("Buffer:");
  for(int i = 0; i < bytes_read/2; ++i){
    double value = buffer[i] & 0x0FFF;
    vReal[i] = value;
    vImag[i] = 0;
    //Serial.printf("%f ", value); // Print compatible with Arduino Plotter
    //Serial.printf("\n");
  } // while
  FFT.Windowing(FFT_WIN_TYP_HAMMING, FFT_FORWARD);
  FFT.Compute(FFT_FORWARD);
  FFT.ComplexToMagnitude();
  
  double x;
  double v;
  FFT.MajorPeak(&x, &v);
  //Serial.print(x, 6);
  //Serial.print(", ");
  //Serial.println(v, 6);
  Serial.println(x);
  //fft.Windowing(WINDOW_)
  //fft.
  //fft.Compute(FFT_FORWARD);
  //Serial.println(fft.MajorPeak())
  //Serial.printf("%d ", analogRead(MIC_PIN)); // Print compatible with Arduino Plotter
  //Serial.printf("\n");
}