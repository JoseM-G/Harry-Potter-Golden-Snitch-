/*
* Authors: Jose Martinez and An Tran
 * Program name: Harry's Quidditch
 * Description: Fly around as Harry Potter and try to catch the snitch.
 *The snitch will appear random each time game starts. 
 *Harry movement is base on the mouse movement on the program's screen.
 *The move operates as a joystick.
 *(IMPORTANT): Create font Verdana-48 for program to work.
 */

//Global variables
//Game Screen
PFont font;
float s; //screen change

//Harry variables
int HX;  //Harry's x-axis
int HY;  //Harry's y-axis
int HH;  //Harry's height
int HW;  //Harry's width

//Harry's speed variables
int speedScale;  //Harry's speed
int HXspeed;  //Harry's x-axis speed
int HYspeed;  //Harry's y-axis speed

//Snitch variables
float SX;  //Snitch's x-axis
float SY;  //Snitch's y-axis
int SR;  //Snitch's radius


void setup() {
  size(400, 400);
  background(150); //gray background
  font = loadFont("Verdana-48.vlw");
  println("If Harry wanders off too far, press r to return him");  //Help regain Harry
  s=1; //Cover Screen
  HX=40;  
  HY=360;
  HH = 40;
  HW = 40;
  speedScale=25;
  SX= random(width/2, 400); //Make snitch appear on the right side of the screen
  SY = random(0, 400); //Make snitch appear anywhere on the screen
  SR = 10;
}


void draw() {
  Game(); //Applying Game
}


void Game() {  //Defining Game 
  if (s == 1) { //1st screen
    startUp();  //Applying startUp
  }

  if (s == 2) {  //2nd screen
    quidditch();  //Applying quidditch
  }

  if (s == 3) {  //3rd screen
    victory();  //Applying victory
  }
}


void startUp() { //Defining Startup
  textFont(font, 30);  //Font and size of the font
  fill(200, 50, 50);  // Light red
  text("Harry's Quidditch", 80, 120);
  textFont(font, 20);
  fill(155, 20, 20); // Dark red
  text("How to Play?", 145, 200);
  textFont(font, 15);
  text("Move mouse to move Harry", 100, 230);
  fill(175, 5, 5); //Red
  text("Click to start", 155, 280);

  if (mousePressed == true) {  //Press on the mouse
    s = 2;  //Game Screen
  }
}


void quidditch() { //Defining quidditch
  background(150);
  Snitch( SX, SY, SR, SR);  //Snitch's location
  HY = HY + playerSpeedY(speedScale);  // Harry's x-axis movement
  HX = HX + playerSpeedX(speedScale);  //Harry's y-axis movement

  Harry(HX, HY, HW, HH );  //Harry's location

  if (keyPressed && key == 'r') { //Press r to reset Harry's position
    HX = 40; 
    HY = 360;
  }

  if (catchSnitch()  == true) {  //Action to true statement for boolean
    s = 3;
  }
}


void victory() {  //Defining victory
  rectMode(CORNERS);
  stroke(234, 255, 13);
  strokeWeight(110);  //Make a frame
  fill(255, 0, 0);
  rect(0, 0, width, height);  //rectangle screen size
  textFont(font, 40);
  fill(0);
  text("WINNER!!!", 100, 100);
  text("WINNER!!!", random(200), random(20, 400));  //Random appearance of Winner
  textFont(font, 20);
  text("Press 'r' to play again", 100, 300);  //Inform people how to restart game
  if (keyPressed) {
    if (key == 'r') { //Returns to main menu
      background(150);
      s = 1;
      HX = 40;
      HY = 360;
      SX= random(width/2, 400);
      SY = random(0, 400);
    }
  }
}


void Harry(int x, int y, int w, int h) { //Defining Harry
  stroke(203, 150, 33);  //Brown
  strokeWeight(2); //Make line visible
  line(x, y+h, x+w, y+h);  //Boom's stick
  noStroke();  //No outline
  fill(228, 232, 42);  //Yellow
  rectMode(CENTER);
  rect(x, y+h, w/2, h/4); //Boom's end
  fill(227, 23, 26); //Red
  ellipseMode(CENTER);
  ellipse(x+w/2, y+ 2*(h/2.7), w/2, h/2); //Harry
}


void Snitch(float x1, float y1, int r, int r1) { //Defining Snitch
  fill(255, 230, 0); //Yellow
  ellipse(x1, y1, r, r1); //Snitch's location
}


int playerSpeedX(int speedScale) {  //Defining playerSpeedX
  HXspeed = (mouseX- 200) / speedScale; //Harry's y-axis speed
  return HXspeed;
}


int playerSpeedY (int speedScale) {  //Defining playerSpeedY
  HYspeed = (mouseY - 200) / speedScale; //Harry's y-axis speed
  return HYspeed;
}


boolean catchSnitch() {  //Defining catchSnitch
  if (SY +SR >= HY && SY + SR <= HY + HH && SX + SR >= HX && SX <= HX + HW) {  //collision range
    return true; //Apply if in range
  } else {
    return false; //Nothing if not in range
  }
}

