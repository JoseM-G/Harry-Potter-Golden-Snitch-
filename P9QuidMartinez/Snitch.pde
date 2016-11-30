//Class for drawing the Snitch in the program

class Snitch {
  float x;//Snitch's x position
  float y;//Snitch's y position
  final float MAXSPEED = 4.0;//fastest the Snitch can move
  float xSpeed = random(-MAXSPEED, MAXSPEED);//Snitch's x speed
  float ySpeed = random(-MAXSPEED, MAXSPEED);//Snitch's y speed
  final int snitchSize = 10;//size of Snitch


//constructor for the Snitch class
  Snitch(int initialX, int initialY) {
    x = initialX;//allows user to set initial x position
    y = initialY;//allows user to set initial x position
  }


//detects if Snitch moves off screen
  boolean offScreen() {
    if (x < 0 || y < 0 || x > width || y > height)
    return true;
    else
    return false;
  }
  
  
//resets the snitch to a random location with random velocity
  void randomize(){
    x = random(0, width);
    y = random(0, height);
    xSpeed = random(-MAXSPEED, MAXSPEED);
    ySpeed = random(-MAXSPEED, MAXSPEED);
  }


//draws the Snitch
  void display() {
    fill(255, 230, 0);//gold/yellow color
    noStroke();
    ellipse(x, y, snitchSize, snitchSize);
  }


////function for Snitch's movement
  void move() {
    x = x + xSpeed;//horizontal movement
    y = y + ySpeed;//vertical movement
  }
  
  
//gets the x and y position of Snitch for collision detection  
 void setToPos(Snitch pos){
   x = pos.x;
   y = pos.y;
 }
 
}

