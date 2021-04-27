// A class modified from PShape example PolygonShapeOOP3
// Used tutorial https://processing.org/examples/button.html

class Button{

  // The PShape object 
  PShape b;
  
  // The location where we will draw the shape
  float x, y;
  
  // The size of the shape
  float size;
  
  Button(int x, int y, int size) {
    
    // First create the shape
    b = createShape();
    b.beginShape();
    
    // You can set fill and stroke
    b.fill(color(80,139,125));
    b.stroke(color(113,65,73)); // maroon
    b.strokeWeight(3);
    
    // Here, we are hardcoding a series of vertices
    b.vertex(x+floor(size/2), y-floor(size/4));
    b.vertex(x-floor(size/2), y-floor(size/4));
    b.vertex(x-floor(size/2), y+floor(size/4));
    b.vertex(x+floor(size/2), y+floor(size/4));
        
    // The shape is complete
    b.endShape(CLOSE);
  }


  void display() {
    // Locating and drawing the shape
    pushMatrix();
    translate(x, y);
    shape(b);
    popMatrix();
  }
  
  boolean hover(float x,float y, float size){
   // Create distance variables
   float disX = abs(x - mouseX);
   float disY = abs(y - mouseY);
   
    // Check if hovering
    if ((disX <= size/2) && (disY <= size/4)){
      return true;
    }else{
      return false;}
  }
  
  void update(float x,float y, float size, String state){
    switch(state){
      case "Title":
      if (this.hover(x,y,size)){
        b.setFill(color(255,87,115));
      } else{
        b.setFill(color(80,139,125));
      }
      break;
      
      // Should not show up in others
      case "Activity":
      b.setVisible(false);
      break;
      case "Memory":
      b.setVisible(false);
      break;
    }
  }
}
