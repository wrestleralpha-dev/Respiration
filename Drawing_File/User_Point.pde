// A class modified from PShape example PolygonShapeOOP3
class User_Point {

  // The PShape object
  PShape up;
  // The location where we will draw the shape
  float x, y;
  float speed;
  float size;
  float x1, x2, y1, y2;
  int colornum;
  color color1, color2, color3;
  boolean colorprev;

  
  User_Point() {
    
    // Size
    if(width >= height){
      size = height;
    }else{
      size = width;
    }
    
    // Colors
    color1 = color(252,144,162);
   
    // Position and speed
    x1 = width/4-size/8;
    y1 = height/4+size/8;
    x2 = width/4+3*size/8;
    y2 = height/4-3*size/8;
    x = x1;
    y = y1; 
    
    // First create the shape
    up = createShape();
    up.beginShape();
    
    // You can set fill and stroke
    up.fill(color1,255);
    up.noStroke();
    
    // Vertices
    up.vertex(x-5,y);
    up.vertex(x,y+5);
    up.vertex(x+5,y);
    up.vertex(x,y-5);
    
    // The shape is complete
    up.endShape(CLOSE);
  }

  void display() {
    // Locating and drawing the shape
    pushMatrix();
    translate(x, y);
    shape(up);
    popMatrix();
  }
  
  void move(float xnow,float ynow){
    x = xnow;
    y = ynow;
  }
}
