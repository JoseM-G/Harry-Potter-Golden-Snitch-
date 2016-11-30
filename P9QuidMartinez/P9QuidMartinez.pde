/*
* Authors: Jose Martinez and An Tran
* Program name: Quidditch
* Description:
* Main Program: The program start when mouse is press. Seeker move
* with the use of mouse. The Snitch move randomly everywhere and 
* reapper if offscreen. The goal of the Seeker is to get the Snitch.
*
* Seeker Program: The seeker is drawn and move base on the mouse.
* The seeker reappear on the other side if offscreen. Define when 
* the seeker catch the snitch.
*
* Snitch Program: The snitch is drawn and move randomly.Reappear 
* randomly on the screen when disappear offscreen. 
*/

Snitch mySnitch = new Snitch (350, 200); //Calling the Snitch class and initial position
Seeker harry = new Seeker (150, 200, 40, 40); //Calling Seeker class and initial position
PFont font;  //Text variable
boolean Win = false;  //Win did not happen.
void setup(){
  font = loadFont("Verdana-48.vlw"); //Wording choice
  size(400, 400); //Program's screen size
  noLoop(); //No repeating
  println("Move Seeker with the use of mouse on the screen"); //Instruction 
}


void draw(){
  Quidditch(); //Calling the Quidditch function.
}


void Quidditch(){ //Defining a function
  background(#3C99DE); //Blue background
  mySnitch.display(); //Calling the Snitch's display function.
  mySnitch.move(); //Calling the Snitch's move function.
  
  harry.display(); //Calling the Seeker's display function.
  harry.move(); //Calling the Seeker's move function.
  harry.wrapAround(); //Calling the Seeker's wrapAround function.
  
  goal(100, 300, 40, 40);//goal 1
  goal(200, 250, 50, 50);//goal 1
  goal(300, 300, 40, 40);//goal 1
  
  if(mySnitch.offScreen()){ //When Snitch is off the program's screen.
    mySnitch.randomize(); //Snitch reappear randomly on the screen.
  }
  
  if(harry.caughtSnitch(mySnitch)){ //When Seeker touch Snitch
    println("victory"); //Victory on the black screen below
    Win = true; //Win did happen
    noLoop(); //Stop repeating
  }
  
  if(Win == true){ //When win happen
    Victory(); //Call the victory function
  }
}


void Victory(){ //Defining victory
  rectMode(CORNERS); //Draw rectangle from the corners.
  stroke(234, 255, 13); //Gold color
  strokeWeight(110);  //Make a frame
  fill(255, 0, 0); //Red color
  rect(0, 0, width, height);  //rectangle screen size
  textFont(font, 40); //Calling the font and size of text
  fill(0); //Black text
  text("WINNER!!!", 100, 100); //Words on screen
  textFont(font, 20);
  text("Time: " + nf((frameCount / frameRate),0,3) + " second(s)", 90, 300); //The time that it take to capture the Snitch
}

void mousePressed(){ //Press mouse
  loop(); //Program start 
}


//draws a goal
void goal(int x, int y, int w, int h){
  noFill();
  stroke(0);
  ellipse(x, y, w, h);
  line(x, y + (h / 2), x, y + (3 * h));
}  
