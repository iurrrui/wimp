class GameOver {    
  float x, y, w, h, wx, wy, ww, wh, tx, ty, tx2, ty2, tx3, ty3, tx4, ty4;  
  boolean on;  

  GameOver(float _x, float _y, float _w, float _h) {    
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

    tx3 = 535;
    ty3 = 280;
    tx4 = 1066;
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
      reset();
    } else {
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
      String resetButton = "Reset";
      textFont(rm47);
      fill(lightGray);
      text(resetButton, tx, ty, tx2, ty2);
      //game complete text
      String lineOne = "Game Over";
      fill(lightGray);
      textFont(rm67);
      text(lineOne, tx3, ty3, tx4, ty4);
    }
  }
} 
