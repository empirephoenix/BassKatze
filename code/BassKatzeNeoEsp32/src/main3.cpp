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
 
#define colorSaturation 128
#define SAMPLES         256          // Must be a power of 2
#define SAMPLING_FREQ   5000         // Hz, must be 40000 or less due to ADC conversion time. Determines maximum frequency that can be analysed by the FFT Fmax=sampleF/2.
#define AMPLITUDE       1000          // Depending on your audio source level, you may need to alter this value. Can be used as a 'sensitivity' control.
#define AUDIO_IN_PIN    35            // Signal in on this pin

// Connections to INMP441 I2S microphone
#define I2S_WS 26
#define I2S_SD 32
#define I2S_SCK 33
 
// Use I2S Processor 0
#define I2S_PORT I2S_NUM_0


const uint16_t PixelCount = 7; 
const uint8_t PixelPin = 25;  // make sure to set this to the correct pin, ignored for Esp8266


byte peak[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};              // The length of these arrays must be >= NUM_BANDS
int oldBarHeights[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int bandValues[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
double vReal[SAMPLES];
double vImag[SAMPLES];
unsigned long newTime;
#define NUM_BANDS       8            // To change this, you will need to change the bunch of if statements describing the mapping from bins to bands
#define NOISE           2            // war 1000  
#define DENOISE_MIN     2            // Set minimum signal threshold

int16_t sBuffer[SAMPLES];

uint16_t Rotwert;
uint16_t Gruenwert;
uint16_t Blauwert;
// uint16_t Weisswert;

arduinoFFT FFT = arduinoFFT(vReal, vImag, SAMPLES, SAMPLING_FREQ);
NeoPixelBus<NeoGrbFeature, NeoEsp32BitBang400KbpsMethod> strip(PixelCount, PixelPin);

RgbColor red(colorSaturation, 0, 0);
RgbColor green(0, colorSaturation, 0);
RgbColor blue(0, 0, colorSaturation);
//RgbColor white(colorSaturation);
RgbColor black(0);

HslColor hslRed(red);
HslColor hslGreen(green);
HslColor hslBlue(blue);
//HslColor hslWhite(white);
HslColor hslBlack(black);

 
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
  Serial.println(" Init! ");
 
  //this resets all the neopixels to an off state
  strip.Begin();
  strip.Show();

  delay(1000);
 
  // Set up I2S
  i2s_install();
  i2s_setpin();
  i2s_start(I2S_PORT);
 
  delay(500);
}

uint16_t denoise(uint16_t value)
{
  if (value < DENOISE_MIN)
  {
    value = DENOISE_MIN;
  }
  return map(value, DENOISE_MIN, 255, 0, 255);
}
 
void loop() {
 
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
    if (vReal[i] > NOISE) {                    // Add a crude noise filter

      // 256/2 Samples custom auf 8 Bänder verteilt
      if (i<=8 )            bandValues[0]  += (int)vReal[i];
      if (i>9   && i<=13  ) bandValues[1]  += (int)vReal[i];
      if (i>14   && i<=20  ) bandValues[2]  += (int)vReal[i];
      if (i>21   && i<=30  ) bandValues[3]  += (int)vReal[i];
      if (i>31   && i<=44  ) bandValues[4]  += (int)vReal[i];
      if (i>45   && i<=60  ) bandValues[5]  += (int)vReal[i];
      if (i>61   && i<=81 ) bandValues[6]  += (int)vReal[i];
      if (i>82            ) bandValues[7]  += (int)vReal[i];
    }
  }  

  Rotwert = min((uint16_t)255, denoise(bandValues[0]/750));
  Gruenwert = min((uint16_t)255, denoise((bandValues[1])/200));
  Blauwert = min((uint16_t)255, denoise((bandValues[2] + bandValues[3] + bandValues[4])/1));
  //Weisswert = min((uint16_t)255, denoise(bandValues[3]/1500));
  
  //strip.SetPixelColor(0, RgbwColor(Rotwert, Gruenwert, Blauwert, Weisswert));
  //strip.SetPixelColor(1, RgbwColor(Rotwert, Gruenwert, Blauwert, Weisswert));

  for (int i = 0; i < PixelCount; i++) {
    strip.SetPixelColor(i, RgbColor(Rotwert, Gruenwert*2, Blauwert*4));
  }
  
  
  strip.Show();
}