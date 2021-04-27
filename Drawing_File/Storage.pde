// Used code from this source for initial inspiration https://forum.processing.org/one/topic/fading-animation

class Storage{
  float left, right, top, bottom;
  String side;

    Storage(){
      left  = 0;
      top = 0;
      right = 0;
      bottom = 0;
      side = "Inhale Start";
    }
    
    void update(float newnum,String side){
      switch (side){
        case "Inhale Start":
        left = newnum;
        break;
        case "Inhale Hold":
        top = newnum;
        break;
        case "Exhale Start":
        right = newnum;
        break;
        case "Exhale Hold":
        bottom = newnum;
        break;        
      }
    }
    
    void side(String side){
      this.side = side;
    }
}
