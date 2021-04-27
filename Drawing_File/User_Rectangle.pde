// A class modified from PShape example PolygonShapeOOP3

class User_Rectangle {

  // The PShape object
  PShape ur;
  
  // The location where we will draw the shape
  float x, y;
  
  // The size of the shape
  float size;
  
  // the vertices
  float left, top, right, bottom;
  
  User_Rectangle() {

    // Size
    if(width >= height){
      size = height;
    }else{
      size = width;
    }
        
    // Center
    x = floor(width/2)-floor(size/4);
    y = floor(height/2)+floor(size/4); 
    
  }
  
  void createvert(float left, float top, float right, float bottom){
    
    // First create the shape
    ur = createShape();
    ur.beginShape();
    
    // You can set fill and stroke
    ur.noFill();
    ur.stroke(color(179,59,75),75); // maroon and slightly transparent
    ur.strokeWeight(5);
    
    // Here, we are hardcoding a series of vertices
    ur.vertex(0,(-size/2)*left);
    ur.vertex((size/2)*top, -floor(size/2));
    ur.vertex(floor(size/2), (-size/2)*(1-right));
    ur.vertex(floor(size/2)*(1-bottom), 0);
    
    // The shape is complete
    ur.endShape(CLOSE);
    
  }
  
  void display() {
    // Locating and drawing the shape
    pushMatrix();
    translate(x, y);
    shape(ur);
    popMatrix();
  }
}
