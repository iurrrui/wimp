class Scene2 {    
  float x, y, w, h;  
  boolean on, error;  
  float x2, y2, wx, wy, ww, wh, tx, ty, tw, th, tx2, ty2, tw2, th2;


  Scene2(float _x, float _y, float _w, float _h) {    
    x  = _x;   
    y  = _y;   
    w  = _w;   
    h  = _h;   
    on = false;
    error = false;

    x2 = 92.5;
    y2 = height/1.4;

    wx = 20;
    wy = 20;
    ww = 1400;
    wh = 815;

    tx = 92.5;
    ty = 170;
    tw = 1000;
    th = 75;
    tx2 = 92.5;
    ty2 = 300;
    tw2 = 630;
    th2 = 75;
  }    

  void click(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      on = !on;
    }
    if (mx > x2 && mx < x2 + w && my > y2 && my < y2 + h) {
      error = !error;
    }
  }

  void display() {
    if (on) {
      x = width;
      x2 = width;
      tx = width;
      tx2 = width;
      wx = width;
      buttonBunch.unclickables();
      buttonBunch.clickable();
    } else if (error) {
      x = width;
      x2 = width;
      tx = width;
      tx2 = width;
      wx = width;
      errTwo.darkMode();
    } else {
      //window
      noStroke();
      fill(midBlue);
      rect(wx, wy, ww, wh);
      //text shapes
      fill(lightBlue);
      rect(tx, ty, tw, th);
      rect(tx2, ty2, tw2, th2);
      //buttons
      strokeWeight(3);
      stroke(lightBlue);
      noFill();
      //stroke(darkBlue);
      //fill(lightBlue);
      rect(x2, y2, w, h);
      noStroke();
      fill(brightBlue);
      rect(x, y, w, h);
      if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
        cursor(HAND);
      } else if (mouseX > x2 && mouseX < x2 + w && mouseY > y2 && mouseY < y2 + h) {
        cursor(HAND);
      } else if (mouseX > tx && mouseX < tx + tw && mouseY > ty && mouseY < ty + th) {
        cursor(TEXT);
      } else if (mouseX > tx2 && mouseX < tx2 + tw2 && mouseY > ty2 && mouseY < ty2 + th2) {
        cursor(TEXT);
      } else {
        cursor(ARROW);
      }
    }
  }
} 
