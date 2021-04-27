/**
 Respiration Visualization Program v2.0
 Author: Kameron Mize
 Class: BMES4984
 Date: Throughout April
*/

/**
 Notes
 This program is derived from many examples given by the processing documentation, tutorials, and forums
 As such, much of this program has grown from examples given in those documents
 I will do my best to credit each place I have learned from in my references tab
 
 Dr Grace Wusk is an amazing instructor and her class is terrific!
*/

// Start of Program Proper
// Import required libraries
import processing.serial.*;    // Importing the serial library to communicate with the Arduino 

// Declare shapes/objects
Guide_Rectangle gr1;
Guide_Point gp1;
Title T;
Button b1,b2,b3;
Text t1, t2, t3, t4;
User_Rectangle ur1, ur2, ur3, ur4;
Storage s1;
int b1x,b1y,b2x,b2y,b3x,b3y,bsize;
color bgcol;
Serial myPort;
float buffer = 0.0;
int numpoint = 2000;
int showpoint = 0;
int i;
User_Point[] points = new User_Point[numpoint];
  
// Declare State Variables;
String state = "Title";
boolean active = false;
int countdown = 7;
String side = "Left";

void setup(){
  fullScreen();
  frameRate(60);
  bgcol = color(52,125,117);
  background(bgcol); //dark teal
  // Set up serial coms
  myPort  =  new Serial (this, "COM3",  9600); // Set the com port and the baud rate according to the Arduino IDE
  myPort.clear();
  myPort.bufferUntil ( '\n' );   // Receiving the data from the Arduino IDE
  
  // Set up guide rectangle
  gr1 = new Guide_Rectangle();
  
  // Set up guide point
  gp1 = new Guide_Point();
  
  // Set up guide text
  t4 = new Text(width/2,height/2);
  
  // Set up user points
  for(i = 0;i < numpoint;i++){
   points[i] = new User_Point();
  }

  // Set up title
  T = new Title();
  
  // Set up button locations
  b1x = displayWidth/3;
  b1y = 7*displayHeight/12;
  b2x = displayWidth/2;
  b2y = 7*displayHeight/12;
  b3x = 2*displayWidth/3;
  b3y = 7*displayHeight/12;
  bsize = 300;
  // Set up buttons
  b1 = new Button(b1x,b1y,bsize);
  b2 = new Button(b2x,b2y,bsize);
  b3 = new Button(b3x,b3y,bsize);
  // Set up button text
  t1 = new Text(b1x,b1y);
  t2 = new Text(b2x,b2y);
  t3 = new Text(b3x,b3y);
  
  // Set up storage
  s1 = new Storage();
  
  // Set up user rectangles
  ur1 = new User_Rectangle();
  ur2 = new User_Rectangle();
  ur3 = new User_Rectangle();
  ur4 = new User_Rectangle();
}

void draw() {
  // State Machine
  switch(state){
    //Title State
    case "Title":
    // Wipe screen
    background(bgcol);
    // Draw title
    T.display();
    // Draw buttons
    b1.display();
    b1.update(b1x,b1y,bsize, state);
    b2.display();
    b2.update(b2x,b2y,bsize, state);
    b3.display();
    b3.update(b3x,b3y,bsize, state);
    // Draw button text
    t1.display("Exit");
    t2.display("Start Activity");
    t3.display("Previous Activities");
    // Send 0 over serial to Arduino
    myPort.write('0');
    //println('0');
    
    break;
    //Activity State
    case "Activity":
    // Wipe the screen
    background(bgcol);
    // Draw the guide rectangle
    gr1.display();
    // Draw and move point
    gp1.display();
    if(active == false){
      active = t4.warmup(countdown);
      countdown -= 1;
    }
    if(active == true){
      side = gp1.move();
      t4.activity(side);
    }
    
    for (i = 1; i < showpoint; i++){
      points[i].display();
    }
    
    // Draw activity rectangles
    if (gp1.colornum == 2){
      ur1.display();
      //println(ur1.left);
    }
    if (gp1.colornum == 3){
      ur1.display();
      ur2.display();
    }
    if (gp1.colornum == 4){
      ur1.display();
      ur2.display();
      ur3.display();
    }
    if (gp1.colornum > 4){      
      ur1.display();
      ur2.display();
      ur3.display();
      ur4.display();
    }
    
    break;
    //Memory State
    case "Memory":
    // Wipe the screen
    background(bgcol);
    //Draw previous activity results
    
    break;
  }
}

void mousePressed(){
  switch(state){
    case "Title":
    if(b1.hover(b1x,b1y,bsize)){
      exit();
    }
    if(b2.hover(b2x,b2y,bsize)){
      state = "Activity";
    }
    if(b3.hover(b3x,b3y,bsize)){
      state = "Memory";
    }
    
    break;
    
    
    
  }
}
