#define RAW_SPECTRUM_AIN PC0
#define GAIN_SELECT_OUT PC1
#define ATTACK_SELECT_OUT PC2
#define EQ_BAND_OUT PD0
#define EQ_RESET_OUT PD1
#define LED1_OUT PD2
#define BUTTON_IN PD4
#define PWR_HOLD_OUT PD5
#define CHRG_IN PD6
#define STDBY_IN PD7

// the setup function runs once when you press reset or power the board
void setup() {
  analogReference(INTERNAL);
  pinMode(13, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(100);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(100);                       // wait for a second
}
