//Title: WIMP Puzzle Path

import ddf.minim.*;
//music as 30 second count down
Minim minim;
AudioPlayer musicPlayingGame, musicGameComplete;
//scene0
Scene0 playButton, closeButton, minimizeButton, windowPanel;
//scene1
VertScrollBar vsb1;
Toggle t1;
Panel p1;
//scene2
Scene2 popWindow;
//scene3
Scene3 buttonBunch;
//error
Error errOne, errTwo;
//game complete
GameComplete gc;
//game over / reset
GameOver go;

int timeCount;
int timesUp;
PFont rm67, rm47;

float canvasH = 1708;
float canvasW = 2880;

color bg;
color lightGray = #fbfbfb;
color defaultGray = #e4e3e2;
color hoverGray = #cdcecd; 
color activeGray = #bfc1c0;
color darkText = #373737;
color disabledGray = #dcdcdc;
color lightText = #bfc1c0;
color darkBlue = #0f256e;
color midBlue = #183a9e;
color lightBlue = #204ecf;
color brightBlue = #24a2e9;
color brightGreen = #00cc83;


void setup() {
  size(1440, 855);
  reset();
}

void draw() {
  background(bg);
  if (errOne.on == true) {
    if ( musicPlayingGame.isPlaying() )
    {
      musicPlayingGame.pause();
      musicPlayingGame.rewind();
    }
    reset();
  } else if (timeCount > 33) {
    if ( musicPlayingGame.isPlaying() )
    {
      musicPlayingGame.pause();
      musicPlayingGame.rewind();
    }
    //println(timeCount);
    //println("GAME OVER");
    go.display();
    noLoop();
  } else {  
    //scene0
    initMenu();
    //scene1
    vsb1.update();
  }
}

void mousePressed() {
  //scene0
  playButton.click(mouseX, mouseY);
  closeButton.click(mouseX, mouseY);
  minimizeButton.click(mouseX, mouseY);
  //scene1
  vsb1.barPressed();
  p1.click(mouseX, mouseY);
  //scene2
  popWindow.click(mouseX, mouseY);
  //scene3
  buttonBunch.click(mouseX, mouseY);
  //error
  errOne.click();
  errTwo.click();
  //game complete
  gc.click(mouseX, mouseY);
  //game over
  go.click(mouseX, mouseY);
}

void mouseReleased() {
  //scene0
  vsb1.barReleased();
}



void initMenu() {
  windowPanel.window();
  closeButton.closeWindow();
  minimizeButton.minimize();
  playButton.play();
}


void reset() {
  rm67 = createFont("RobotoMono-Medium.ttf", 67);
  rm47 = createFont("RobotoMono-Medium.ttf", 47);

  //music as 30 second count down
  minim = new Minim(this);
  musicPlayingGame = minim.loadFile("file.mp3", 2048);
  musicGameComplete = minim.loadFile("file2.mp3", 2500);

  //scene0 
  playButton = new Scene0(width/2-200, height/2+200, 400, 120);
  closeButton = new Scene0(width-150, 50, 100, 100);
  minimizeButton = new Scene0(width-300, 50, 100, 100);
  windowPanel = new Scene0(20, 20, 1400, 815);
  //scene1
  vsb1 = new VertScrollBar(width-175, 0, 170, 400, 0, height);
  t1 = new Toggle(400, canvasH-150, 300, 300, 285, canvasH-165, 580, 330);
  p1 = new Panel(0, 0, width, height-50);
  //scene2
  popWindow = new Scene2(92.5+860, height/1.4, 400, 120);
  //scene3
  buttonBunch = new Scene3(868, 217, 400, 120);
  //error
  errOne = new Error(520, 543, 400, 120);
  errTwo = new Error(520, 543, 400, 120);
  //game complete
  gc = new GameComplete(520, 543, 400, 120);
  //game over
  go = new GameOver(520, 543, 400, 120);

  //reset all variables to initial values
  //there is probably a more elegant way to do this

  lightText = #bfc1c0;
  disabledGray = #dcdcdc;

  //scene1
  p1.y = -height+100;
  p1.x = 0;
  p1.hover = false;
  p1.dropDown = false;

  //scene2
  popWindow.x2 = 92.5;
  popWindow.y2 = height/1.4;
  popWindow.wx = 20;
  popWindow.wy = 20;
  popWindow.ww = 1400;
  popWindow.wh = 815;
  popWindow.tx = 92.5;
  popWindow.ty = 170;
  popWindow.tw = 1000;
  popWindow.th = 75;
  popWindow.tx2 = 92.5;
  popWindow.ty2 = 300;
  popWindow.tw2 = 630;
  popWindow.th2 = 75;
  popWindow.on = false;
  popWindow.error = false;

  //scene3
  buttonBunch.on = false;
  buttonBunch.error = false;
  
  

}
