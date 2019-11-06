#define RAW_SPECTRUM_AIN A0 // PC0
#define GAIN_SELECT_OUT A1 // PC1
#define ATTACK_SELECT_OUT A2 // PC2
#define EQ_BAND_OUT A4 // PC4
#define EQ_RESET_OUT A5 // PC5
#define LED1_OUT 9 // PB1
#define BUTTON_IN 4 // PD4
#define PWR_HOLD_OUT 5 // PD5
#define CHRG_IN 6 // PD6
#define STDBY_IN 7 // PD7

int spectrumValue[7];
int filter=80;

// the setup function runs once when you press reset or power the board
void setup() {
  analogReference(INTERNAL);
  
  Serial.begin(9600);
  pinMode(RAW_SPECTRUM_AIN, INPUT);
  pinMode(EQ_BAND_OUT, OUTPUT);
  pinMode(EQ_RESET_OUT, OUTPUT);
  pinMode(LED1_OUT, OUTPUT);
  
  digitalWrite(EQ_RESET_OUT, LOW);
  digitalWrite(EQ_BAND_OUT, HIGH);
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
  Serial.println();

  analogWrite(LED1_OUT,spectrumValue[0]);
//  delay(100);
//  analogWrite(LED1_OUT, LOW);
//  delay(100);
}
