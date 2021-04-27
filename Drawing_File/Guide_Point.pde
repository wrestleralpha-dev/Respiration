// A class modified from PShape example PolygonShapeOOP3
class Guide_Point {

  // The PShape object
  PShape gp;
  // The location where we will draw the shape
  float x, y;
  float speed;
  float size;
  float x1, x2, y1, y2;
  int colornum;
  color color1, color2, color3;
  boolean colorprev;
  
  Guide_Point() {
    
    // Size
    if(width >= height){
      size = height;
    }else{
      size = width;
    }
    
    // Colors
    color1 = color(252,144,162);
    color2 = color(255,121,140);
    //color2 = color(54,31,14);
    color3 = color(255,87,115);
    colornum = 0;
    colorprev = true;
   
    // Position and speed
    x1 = width/4-size/8;
    y1 = height/4+size/8;
    x2 = width/4+3*size/8;
    y2 = height/4-3*size/8;
    x = x1;
    y = y1; 
    speed = height/60/4;
    
    // First create the shape
    gp = createShape();
    gp.beginShape();
    
    // You can set fill and stroke
    gp.fill(color1,255);
    gp.noStroke();
    
    // Vertices
    gp.vertex(x-5,y);
    gp.vertex(x,y+5);
    gp.vertex(x+5,y);
    gp.vertex(x,y-5);
    
    // The shape is complete
    gp.endShape(CLOSE);
  }

  String move() {
    if ((x==x1)&&(y==y1)){
      colornum +=1;
      colorprev = false;
    }
    if ((colornum == 2)&&(colorprev == false)){
      ur1.createvert(s1.left,s1.top,s1.right,s1.bottom);
      println(s1.left);
      println(s1.top);
      println(s1.right);
      println(s1.bottom);
      gp.setFill(color2);
      colorprev = true;
    }
    if ((colornum == 3)&&(colorprev == false)){
      ur2.createvert(s1.left,s1.top,s1.right,s1.bottom);
      gp.setFill(color3);
      colorprev = true;
    }
    if ((colornum == 4)&&(colorprev == false)){
      ur3.createvert(s1.left,s1.top,s1.right,s1.bottom);
      gp.setFill(color3);
      colorprev = true;
    }
    if ((colornum > 4)&&(colorprev == false)){
      ur4.createvert(s1.left,s1.top,s1.right,s1.bottom);
      colorprev = true;
      return "End";
    }
    
    if ((x==x1)&&(y>y2)&&(y<=y1)) {
      y -= speed;
      s1.side("Left");
      return("Left");
    }
    if ((x>=x1)&&(x<x2)&&(y==y2)) {
      x += speed;
      s1.side("Top");
      return("Top");
    }
    if ((y>=y2)&&(x==x2)&&(y<y1)) {
      y += speed;
      s1.side("Right");
      return("Right");
    }
    if ((x>x1)&&(y==y1)&&(x<=x2)) {
      x -= speed;
      s1.side("Bottom");
      return("Bottom");
    }
    return("End"); // Should Never Get Here
  }

  void display() {
    // Locating and drawing the shape
    pushMatrix();
    translate(x, y);
    shape(gp);
    popMatrix();
  }
}
