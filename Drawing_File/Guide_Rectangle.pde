// A class modified from PShape example PolygonShapeOOP3

class Guide_Rectangle {

  // The PShape object
  PShape gr;
  
  // The location where we will draw the shape
  float x, y;
  
  // The size of the shape
  float size;
  
  Guide_Rectangle() {
    // Center
    x = floor(width/2);
    y = floor(height/2); 
    
    // Size
    if(width >= height){
      size = height;
    }else{
      size = width;
    }
    
    // First create the shape
    gr = createShape();
    gr.beginShape();
    
    // You can set fill and stroke
    gr.noFill();
    gr.stroke(color(113,65,73),200); // maroon and slightly transparent
    gr.strokeWeight(5);
    
    // Here, we are hardcoding a series of vertices
    gr.vertex(floor(size/4), -floor(size/4));
    gr.vertex(-floor(size/4), -floor(size/4));
    gr.vertex(-floor(size/4), floor(size/4));
    gr.vertex(floor(size/4), floor(size/4));
    
    // The shape is complete
    gr.endShape(CLOSE);
  }

  void display() {
    // Locating and drawing the shape
    pushMatrix();
    translate(x, y);
    shape(gr);
    popMatrix();
  }
}
