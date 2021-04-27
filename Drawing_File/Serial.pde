/**
Code for Reading Arduino Data
Name: Kameron Mize
Class: BMES4984
Date: 4/6/2021
*/

/**
Note: This code was modified from code originally found at:
https://maker.pro/arduino/tutorial/how-to-make-arduino-and-processing-ide-communicate#:~:text=About%20Processing&text=The%20Processing%20IDE%20works%20for,a%20setup%20and%20loop%20function.

And the instructable:
https://www.instructables.com/Graphing-With-Processing/
*/

void serialEvent  (Serial myPort) {
  showpoint++;
  points[showpoint].move(gp1.x,gp1.y);
  //String data = myPort.readStringUntil ( '\n');
  //s1.update(gp1.x,data);
  //println(gp1.y);
  //println(s1.left);
  //if (data == "Inhale Start"){
   
  //  buffer = gp1.y; 
  //  println(buffer);
  //}
  //if (data == "Inhale Hold"){
  //  s1.update(gp1.x,data); 
  //}
  //if (data == "Exhale Start"){
  //  s1.update(gp1.y,data); 
  //}
  //if (data == "Exhale Hold"){
  //  s1.update(gp1.x,data);  
  //}
} 
