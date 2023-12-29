class Error {    
  float x, y, w, h, wx, wy, ww, wh, tx, ty, tx2, ty2;  
  boolean on;  

  Error(float _x, float _y, float _w, float _h) {    
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
  }    

  void click() {
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      on = !on;
    } else {
      on= false;
    }
  }

  void lightMode() {
    cursor(ARROW);
    //window
    bg=255;
    background(bg);
    stroke(defaultGray);
    fill(lightGray);
    rect(wx, wy, ww, wh);
    //text
    String lineOne = "Error 001:";
    String lineTwo = "Failed to start game. Try Again.";
    fill(darkText);
    textFont(rm67);
    text(lineOne, 245, 177, 966, 438);
    textFont(rm47);
    text(lineTwo, 245, 285, 1190, 335);
    //button
    stroke(hoverGray);
    fill(defaultGray);
    rect(x, y, w, h);
    //noStroke();
    String resetButton = "Reset";
    textFont(rm47);
    fill(darkText);
    text(resetButton, tx, ty, tx2, ty2);
  }

  void darkMode() {
    if (on) {
      if ( musicPlayingGame.isPlaying() )
      {
        musicPlayingGame.pause();
        musicPlayingGame.rewind();
      }
      reset();
    } 
    cursor(ARROW);
    //window
    bg=darkBlue;
    background(bg);
    stroke(lightBlue);
    strokeWeight(1);
    fill(midBlue);

    rect(wx, wy, ww, wh);
    //text
    String lineOne = "Error 002:";
    String lineTwo = "Cursor out of bounds. Reset Game.";
    fill(lightGray);
    textFont(rm67);
    text(lineOne, 245, 177, 966, 438);
    textFont(rm47);
    text(lineTwo, 245, 285, 1190, 335);
    //button
    stroke(darkBlue);
    fill(lightBlue);
    rect(x, y, w, h);
    String resetButton = "Reset";
    textFont(rm47);
    fill(lightGray);
    text(resetButton, tx, ty, tx2, ty2);
  }
} 
