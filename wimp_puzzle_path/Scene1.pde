class VertScrollBar {
  float x, y, w, h;
  boolean drag = false;
  float offsetMouseY;
  float topY, bottomY;

  VertScrollBar(float _x, float _y, float _w, float _h, float _topY, float _bottomY) {
    x = _x;
    y = _y;
    w = _w; 
    h = _h;
    topY = _topY;
    bottomY = _bottomY;
  }

  void barFront() {
    int roundedC = 300;
    noStroke(); 
    fill(hoverGray);
    rect(x, y, w, h, roundedC);
  }

  void barBack() {
    float x2 = vsb1.x-5;
    noStroke(); 
    fill(disabledGray);
    rect(x2, topY, w+10, bottomY);
  }

  void barPressed() {
    if (mouseOver()) {
      drag = true;
      offsetMouseY = mouseY - y;
    }
  }

  void barReleased() {
    drag = false;
  }

  void update() {
    if (drag) {
      y = mouseY - offsetMouseY;
      if (y < topY)
        y = topY;
      if (y + h > bottomY)
        y = bottomY - h;
    }
  }

  float vScrollValue() {
    return
      //map(y, 0, bottomY - h, 0, - (canvasH - (h/2)));
      map(y, 0, bottomY - h, 0, - (canvasH - bottomY/2));
    //map(y, 0, bottomY - h, 0, - (canvasH - (bottomY/2)));
  }

  boolean mouseOver() {
    return 
      mouseX > x &&
      mouseX < x + w &&
      mouseY > y &&
      mouseY < y + h;
  }
}


class Toggle {
  boolean off, on;
  float x, y, w, h;
  float x2, y2, w2, h2;
  color toggleColor, toggleFill, toggleBorderColor;

  Toggle(float _x, float _y, float _w, float _h, float _x2, float _y2, float _w2, float _h2) {
    off = false;
    on = true;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    x2 = _x2;
    y2 = _y2;
    w2 = _w2;
    h2 = _h2;
  }

  void display() {
    if (mousePressed) {
      if (on && mouseX > x && mouseX < x + w && mouseY > y + vsb1.vScrollValue() && mouseY - vsb1.vScrollValue() < y + h) {
        on = false;
        off = !off;
      }
    } else {
      on = true;
    }
    x = 300;
    vsb1.x = width-175;
    bg = 255;
    toggleColor = defaultGray;
    toggleBorderColor = defaultGray;
    toggleFill = lightGray;
    if (off) {
      fill(brightGreen);
      x = 550;
      vsb1.x = width+5;
      p1.y = -height+100;
      p1.display();
      bg = darkBlue;
      toggleColor = brightGreen;
      toggleBorderColor = brightGreen;
      toggleFill = darkBlue;
    }
    pushMatrix();
    float newY = vsb1.vScrollValue();
    translate (0, newY);
    stroke(toggleBorderColor);
    fill(toggleFill);
    rect(x2, y2, w2, h2);
    noStroke();
    strokeWeight(10);
    fill(toggleColor);
    rect(x, y, w, h);
    popMatrix();
  }
}

class Panel {
  float x, y, w, h;  
  boolean hover, dropDown;

  Panel(float _x, float _y, float _w, float _h) {
    x  = _x;   
    y  = _y;   
    w  = _w;   
    h  = _h;   
    hover = false;
    dropDown = false;
  }

  void click(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {      
      hover = !hover;
    }
  }

  void display() {
    if (hover && y < 0) {
      y=0;
      t1.y = -canvasH;
      t1.y2 = -canvasH;
    } 
    //try else here too
    fill(lightBlue);
    rect(x, y, w, h);
    
    
    if (hover && y > 0) {
      y = -height+100;
    }
    if (!hover && t1.y == -canvasH) {
      x=width;
      popWindow.display();
    }
  }
}
