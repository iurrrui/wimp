class GameComplete {    
  float x, y, w, h, wx, wy, ww, wh, tx, ty, tx2, ty2, tx3, ty3, tx4, ty4;  
  boolean on;  

  GameComplete(float _x, float _y, float _w, float _h) {    
    x  = _x;   
    y  = _y;   
    w  = _w;   
    h  = _h;   
    on = false;

    wx = 170;
    wy = 115;
    ww = 1100;
    wh = 624;

    tx = 644;
    ty = 570;
    tx2 = 798;
    ty2 = 622;

    tx3 = 435;
    ty3 = 280;
    tx4 = 966;
    ty4 = 438;
  }    

  void click(float mx, float my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      on = !on;
    } else {
      on = false;
    }
  }


  void display() {
    cursor(ARROW);
    if (on) {
      if (musicGameComplete.isPlaying())
      {
        musicGameComplete.pause();
        musicGameComplete.rewind();
      }
    } else {    
      //cue music
      musicGameComplete.play();
      //music as counter
      timeCount = millis() / 1000;
      timesUp = -5;
      float currentVolume = musicGameComplete.getGain();
      //map(mouseY, 0, height, 0, 1);
      musicGameComplete.shiftGain(currentVolume, timesUp-timeCount, 2500);
      //window
      bg=darkBlue;
      background(bg);
      stroke(lightBlue);
      strokeWeight(1);
      fill(midBlue);
      rect(wx, wy, ww, wh);
      //buttons
      stroke(darkBlue);
      fill(lightBlue);
      rect(x, y, w, h);
      //reset button text
      String resetButton = "Reset";
      textFont(rm47);
      fill(lightGray);
      text(resetButton, tx, ty, tx2, ty2);
      //game complete text
      String lineOne = "Game Complete!";
      fill(lightGray);
      textFont(rm67);
      text(lineOne, tx3, ty3, tx4, ty4);
    }
  }
} 
