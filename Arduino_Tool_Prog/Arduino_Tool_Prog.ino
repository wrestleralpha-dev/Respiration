int led_pin = 7;    // Initializing the LED pin

int pot_pin = A0;   // Initializing the Potentiometer pin

int pot_output;     // Declaring a variable for potentiometer output

  float lowthresh = 520; //Kameron insert value
  float  highthresh = 540; //Kameron insert value
  int previousstate = 4;
  int currentstate = 0;
  float data =0;
  
// Collect data

void setup() 
{
  //initialize serial communications at a 9600 baud rate
  Serial.begin(9600); 

}


void loop() {
  // put your main code here, to run repeatedly:
  data = analogRead(pot_pin); // Reading in from respiration belt at specific signal frequency (0.10s) - how to do frequency?
    //Serial.println(data);
  if ((data <= 535) && (data >= 517)){
    Serial.println(1);
 }else{
  //Serial.println(0);
 }
 delay(70);
}
