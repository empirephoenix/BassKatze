/*
  ESP32 I2S Microphone Sample
  esp32-i2s-mic-sample.ino
  Sample sound from I2S microphone, display on Serial Plotter
  Requires INMP441 I2S microphone
 
  DroneBot Workshop 2022
  https://dronebotworkshop.com
*/
 
// Include I2S driver
#include <driver/i2s.h>
#include "Arduino.h"
#include <arduinoFFT.h>
#include <NeoPixelBus.h>
 
 #define SAMPLES         256          // Must be a power of 2
#define SAMPLING_FREQ   6000         // Hz, must be 40000 or less due to ADC conversion time. Determines maximum frequency that can be analysed by the FFT Fmax=sampleF/2.
#define AMPLITUDE       1000          // Depending on your audio source level, you may need to alter this value. Can be used as a 'sensitivity' control.
#define AUDIO_IN_PIN    35            // Signal in on this pin

// Connections to INMP441 I2S microphone
#define I2S_WS 26
#define I2S_SD 32
#define I2S_SCK 33
 
// Use I2S Processor 0
#define I2S_PORT I2S_NUM_0


const uint16_t PixelCount = 2; // this example assumes 4 pixels, making it smaller will cause a failure
const uint8_t PixelPin = 25;  // make sure to set this to the correct pin, ignored for Esp8266
 
byte peak[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};              // The length of these arrays must be >= NUM_BANDS
int oldBarHeights[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int bandValues[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
double vReal[SAMPLES];
double vImag[SAMPLES];
unsigned long newTime;
#define NUM_BANDS       8            // To change this, you will need to change the bunch of if statements describing the mapping from bins to bands
#define NOISE           1500  

int16_t sBuffer[SAMPLES];

arduinoFFT FFT = arduinoFFT(vReal, vImag, SAMPLES, SAMPLING_FREQ);
NeoPixelBus<NeoGrbwFeature, NeoEsp32BitBang400KbpsMethod> strip(PixelCount, PixelPin);


 
void i2s_install() {
  // Set up I2S Processor configuration
  const i2s_config_t i2s_config = {
    .mode = i2s_mode_t(I2S_MODE_MASTER | I2S_MODE_RX),
    .sample_rate = SAMPLING_FREQ,
    .bits_per_sample = i2s_bits_per_sample_t(16),
    .channel_format = I2S_CHANNEL_FMT_ONLY_LEFT,
    .communication_format = i2s_comm_format_t(I2S_COMM_FORMAT_STAND_I2S),
    .intr_alloc_flags = 0,
    .dma_buf_count = 8,
    .dma_buf_len = SAMPLES*2,
    .use_apll = false
  };
 
  i2s_driver_install(I2S_PORT, &i2s_config, 0, NULL);
}
 
void i2s_setpin() {
  // Set I2S pin configuration
  const i2s_pin_config_t pin_config = {
    .bck_io_num = I2S_SCK,
    .ws_io_num = I2S_WS,
    .data_out_num = -1,
    .data_in_num = I2S_SD
  };
 
  i2s_set_pin(I2S_PORT, &pin_config);
}
 
void setup() {
 
  // Set up Serial Monitor
  Serial.begin(115200);
  Serial.println(" ");
 
  delay(1000);
 
  // Set up I2S
  i2s_install();
  i2s_setpin();
  i2s_start(I2S_PORT);
 
 
  delay(500);
}
 
void loop() {
 
  // False print statements to "lock range" on serial plotter display
  // Change rangelimit value to adjust "sensitivity"
  int rangelimit = 3000;
  Serial.print(rangelimit * -1);
  Serial.print(" ");
  Serial.print(rangelimit);
  Serial.print(" ");
 
  // Get I2S data and place in data buffer
  size_t bytesIn = 0;
  esp_err_t result = i2s_read(I2S_PORT, &sBuffer, SAMPLES*2, &bytesIn, portMAX_DELAY);
 
  if (result == ESP_OK)
  {
    // Read I2S data buffer
    int32_t samples_read = bytesIn / 2;
    if(samples_read != SAMPLES){
      Serial.print("Diferrence buffer, read ");
      Serial.print(samples_read);
      Serial.print(" but should be ");
      Serial.println(SAMPLES);

    }
    if (samples_read > 0) {
      float mean = 0;
      for (int16_t i = 0; i < samples_read; ++i) {
        mean += (sBuffer[i]+3000);
        vReal[i] = sBuffer[i]+3000;
        vImag[i] = 0;
      }
 
      // Average the data reading
      mean /= samples_read;
 
      // Print to serial plotter
      Serial.println(mean);
    }
  }



    

    //delay(200);

    // //Serial.println("Colors R, G");

    // // set the colors, 
    // // if they don't match in order, you need to use NeoGrbFeature feature
    //strip.SetPixelColor(0, red);
    //strip.SetPixelColor(1, green);
    // // the following line demonstrates rgbw color support
    // // if the NeoPixels are rgbw types the following line will compile
    // // if the NeoPixels are anything else, the following line will give an error
    // //strip.SetPixelColor(3, RgbwColor(colorSaturation));
    //strip.Show();

  // Compute FFT
  FFT.DCRemoval();
  FFT.Windowing(FFT_WIN_TYP_FLT_TOP, FFT_FORWARD);
  FFT.Compute(FFT_FORWARD);
  FFT.ComplexToMagnitude();

  for (int i = 0; i<NUM_BANDS; i++){
    bandValues[i] = 0;
  }

  // Analyse FFT results
  for (int i = 2; i < (SAMPLES/2); i++){       // Don't use sample 0 and only first SAMPLES/2 are usable. Each array element represents a frequency bin and its value the amplitude.
                      // Add a crude noise filter

   /* // 8 bands, 12kHz top band
      if (i<=3 )           bandValues[0]  += (int)vReal[i];
      if (i>3   && i<=6  ) bandValues[1]  += (int)vReal[i];
      if (i>6   && i<=13 ) bandValues[2]  += (int)vReal[i];
      if (i>13  && i<=27 ) bandValues[3]  += (int)vReal[i];
      if (i>27  && i<=55 ) bandValues[4]  += (int)vReal[i];
      if (i>55  && i<=112) bandValues[5]  += (int)vReal[i];
      if (i>112 && i<=229) bandValues[6]  += (int)vReal[i];
      if (i>229          ) bandValues[7]  += (int)vReal[i]; */

    /* //16 bands, 12kHz top band
      if (i<=2 )           bandValues[0]  += (int)vReal[i];
      if (i>2   && i<=3  ) bandValues[1]  += (int)vReal[i];
      if (i>3   && i<=5  ) bandValues[2]  += (int)vReal[i];
      if (i>5   && i<=7  ) bandValues[3]  += (int)vReal[i];
      if (i>7   && i<=9  ) bandValues[4]  += (int)vReal[i];
      if (i>9   && i<=13 ) bandValues[5]  += (int)vReal[i];
      if (i>13  && i<=18 ) bandValues[6]  += (int)vReal[i];
      if (i>18  && i<=25 ) bandValues[7]  += (int)vReal[i];
      if (i>25  && i<=36 ) bandValues[8]  += (int)vReal[i];
      if (i>36  && i<=50 ) bandValues[9]  += (int)vReal[i];
      if (i>50  && i<=69 ) bandValues[10] += (int)vReal[i];
      if (i>69  && i<=97 ) bandValues[11] += (int)vReal[i];
      if (i>97  && i<=135) bandValues[12] += (int)vReal[i];
      if (i>135 && i<=189) bandValues[13] += (int)vReal[i];
      if (i>189 && i<=264) bandValues[14] += (int)vReal[i];
      if (i>264          ) bandValues[15] += (int)vReal[i]; */

      // 256/2 Samples gleichmäßig auf 8 Bänder verteilt
      if (i<=16 )            bandValues[0]  += (int)vReal[i];
      if (i>17   && i<=32  ) bandValues[1]  += (int)vReal[i];
      if (i>33   && i<=48  ) bandValues[2]  += (int)vReal[i];
      if (i>49   && i<=64  ) bandValues[3]  += (int)vReal[i];
      if (i>65   && i<=80  ) bandValues[4]  += (int)vReal[i];
      if (i>81   && i<=96  ) bandValues[5]  += (int)vReal[i];
      if (i>97   && i<=112 ) bandValues[6]  += (int)vReal[i];
      if (i>113            ) bandValues[7]  += (int)vReal[i]; 

      /* // 256/2 Samples exponentiell auf 8 Bänder verteilt
      if (i<=2 )            bandValues[0]  += (int)vReal[i];
      if (i<=3 )            bandValues[0]  += (int)vReal[i];
      if (i>3   && i<=4   ) bandValues[1]  += (int)vReal[i];
      if (i>5   && i<=8   ) bandValues[2]  += (int)vReal[i];
      if (i>9   && i<=16  ) bandValues[3]  += (int)vReal[i];
      if (i>17  && i<=32  ) bandValues[4]  += (int)vReal[i];
      if (i>33  && i<=64  ) bandValues[5]  += (int)vReal[i];
      if (i>65            ) bandValues[7]  += (int)vReal[i]; */


    
  }
    
  for (int i = 0; i < 8; i++) //output horizontal bars plus absolute numbers
  {
    for (int j = 0; j < bandValues[i]/1000; j++)
    { 
  //    Serial.print("-"); 
    }
  //  Serial.println(bandValues[i]);


  }  

  Serial.print("Major Peak: ");
  Serial.println(FFT.MajorPeak());
  Serial.println();
  Serial.println();

  // // turn off the pixels
  // strip.SetPixelColor(0, black);
  // strip.SetPixelColor(1, black);
  float r = min(255, bandValues[1]/1000);
  float g = min(255, bandValues[2]/1000);
  float b = min(255, bandValues[3]/1000);
  float w = min(255, bandValues[0]/1000);
  Serial.print("bv1");
  Serial.println(bandValues[1]);
  strip.SetPixelColor(0, RgbwColor(r, g, b, w));
  strip.SetPixelColor(1, RgbwColor(r, g, b, w));
  strip.Show();
}