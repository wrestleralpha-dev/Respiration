// Used code from this source for initial inspiration https://forum.processing.org/one/topic/fading-animation

class Title{
  int x, y;
  int transparency, size;
  color col;

    Title(){
      x = displayWidth/2;
      y = displayHeight/4;
      transparency = 255;
      size = 150;
      col = color(113,65,73);
    }
  
    void display(){
      textSize(size);
      smooth();
      noStroke();
      fill(col,transparency); // Set/adjust color and transparency
      textAlign(CENTER,TOP);
      text("Respiration Meditation",x,y);
      
  }
}
