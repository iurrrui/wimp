class Scene0 {    
  float x, y, w, h;  
  boolean on; 

  Scene0(float _x, float _y, float _w, float _h) {    
    x  = _x;   
    y  = _y;   
    w  = _w;   
    h  = _h;   
    on = false;
  }    

  void click(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      on = !on;
    }
  }

  void play() {
    if (on) {
      fill(defaultGray);
      lightText = darkText;
      disabledGray = defaultGray;
      //music as 30 second count down
      musicPlayingGame.play();
      timeCount = millis() / 1000;
      timesUp = -15;
      float currentVolume = musicPlayingGame.getGain();
      musicPlayingGame.shiftGain(currentVolume,timesUp-timeCount, 2048);
      
    } else {
      noStroke();
      fill(defaultGray);
    }

    
    rect(x, y, w, h);
    fill(darkText);
    rect(x+155, y+40, 80, 45);
  }

  void closeWindow() {
    if (on && lightText == darkText) {
      errOne.lightMode();
      windowPanel.x = width;
      closeButton.x = width;
      minimizeButton.x = width;
      playButton.x = width;
    }
    noStroke();
    fill(disabledGray);
    rect(x, y, w, h);
    fill(lightText);
    rect(x+30, y+30, 40, 40);
  }

  void minimize() {
    if (on && lightText == darkText) {
      windowPanel.x = width;
      closeButton.x = width;
      minimizeButton.x = width;
      playButton.x = width;
      //scene1
      vsb1.barBack();
      vsb1.barFront();
      vsb1.update();
      t1.display();
    } else {
      noStroke();
      fill(disabledGray);
    }
    rect(x, y, w, h);
    fill(lightText);
    rect(x+30, y+55, 40, 15);
  }

  void window() {
    bg=255;
    fill(lightGray);
    stroke(defaultGray);
    strokeWeight(1);   
    rect(x, y, w, h);
    //String lineOne = "The rules of the game are";
    //String lineTwo = "already known.";
    //fill(darkText);
    //textFont(rm47);
    //text(lineOne,  245, 250, 966, 438);
    //textFont(rm47);
    //text(lineTwo, 245, 330, 1190, 335);
  }
} 
