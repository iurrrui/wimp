class Scene3 {    
  float x, y, w, h;  
  boolean on, error;   

  Scene3(float _x, float _y, float _w, float _h) {    
    x  = _x;   
    y  = _y;   
    w  = _w;   
    h  = _h;   
    on = false;
    error = false;
  }    

  void click(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      on = !on;
    }
  }

  void clickable() {

    if (on) {     
      x = width;
      gc.display();
    } else {
      strokeWeight(2);
      stroke(midBlue);
      fill(lightBlue);
      rect(x, y, w, h);
      if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
        cursor(HAND);
      } else {
        cursor(ARROW);
      }
    }
  }



  void unclickables() {
    strokeWeight(2);
    stroke(brightBlue);
    fill(midBlue);
    rect(794, 379, w, h);

    noStroke();
    fill(brightGreen);
    rect(705, 531, w, h);

    strokeWeight(5);
    stroke(darkBlue);
    fill(midBlue);
    rect(239, 520, w, h);

    strokeWeight(5);
    stroke(midBlue);
    fill(darkBlue);
    rect(404, 458, w, h);

    strokeWeight(3);
    stroke(brightBlue);
    fill(lightBlue);
    rect(530, 241, w, h); 

    //polygon
    noStroke();
    fill(lightBlue);
    rect(875, 210, w, h);

    noStroke();
    fill(lightBlue);
    beginShape();
    vertex(868, 217);
    vertex(880, 220);
    vertex(875, 210);
    endShape();
    beginShape();
    vertex(1275, 330);
    vertex(1200, 300);
    vertex(1268, 337);
    endShape();

    strokeWeight(2);
    stroke(midBlue);
    noFill();
    beginShape();
    vertex(1275, 210);
    vertex(1268, 217);
    endShape();

    strokeWeight(5);
    stroke(darkBlue);
    fill(brightBlue);
    rect(497, 319, w, h);

    strokeWeight(7);
    stroke(lightBlue);
    noFill();
    rect(207, 259, w, h);

    strokeWeight(7);
    stroke(lightBlue);
    fill(midBlue);
    rect(153, 307, w, h);

    strokeWeight(5);
    stroke(midBlue);
    fill(lightBlue);
    rect(297, 361, w, h);

    strokeWeight(5);
    stroke(lightBlue);
    fill(darkBlue);
    rect(444, 172, w, h);

    noStroke();
    fill(lightBlue);
    rect(697, 538, w, h);
  }
} 
