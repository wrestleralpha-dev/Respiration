// Used code from this source for initial inspiration https://forum.processing.org/one/topic/fading-animation

class Text{
  int x, y;
  int transparency, size, countdown;
  color col;

    Text(int x, int y){
      this.x = x;
      this.y = y;
      transparency = 255;
      size = 30;
      col = color(113,65,73);
    }
  
    void display(String text){
      textSize(size);
      smooth();
      noStroke();
      fill(col,transparency); // Set/adjust color and transparency
      textAlign(CENTER,CENTER);
      text(text,x,y);
    }
  
    boolean warmup(int countdown){
      switch(countdown){
        case 7:
        this.display("Center Your Mind");
        delay(1000);
        return false;
        case 6:
        this.display("Follow the Moving Dot");
        delay(1000);
        return false;
        case 5:
        this.display("Activity Will Start In:");
        delay(1000);
        return false;
        case 4:
        this.display("3");
        delay(1000);
        return false;
        case 3:
        this.display("2");
        delay(1000);
        return false;
        case 2:
        this.display("1");
        delay(1000);
        return false;
        case 1:
        delay(1000);
        return false;
        case 0:
        return true;
      }
      return false;
    }
    
    void activity(String side){
      switch(side){
        case "Left":
        this.display("Inhale");
        myPort.write('1');
        //println('1');
        break;
        case "Top":
        this.display("Hold");
        myPort.write('2');
        //println('2');
        break;
        case "Right":
        this.display("Exhale");
        myPort.write('3');
        //println('3');
        break;
        case "Bottom":
        this.display("Hold");
        myPort.write('4');
        //println('4');
        break;
        case "End":
        this.display("Activity Complete");
        break;
      }
      
      
    }
    
}
