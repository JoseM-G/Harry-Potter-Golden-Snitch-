//Class for drawing the seeker in the program

class Seeker {
  float x;//Seeker's x position
  float y;//Seeker's y position
  int w;//Seeker's width
  int h;//Seeker's height
  final float SPEEDSCALE = 70.0;


//constructor for the Seeker class
  Seeker(int initialX, int initialY, int iWidth, int iHeight) {
    x = initialX;//allows user to set initial x position
    y = initialY;//allows user to set initial y position
    w = iWidth;//allows user to set initial width
    h = iHeight;//allows user to set initial height
  }


//draws the Seeker
  void display() {
    stroke(203, 150, 33);  //Brown
    strokeWeight(2); //Make line visible
    line(x, y+h, x+w, y+h);  //Boom's stick
    noStroke();  //No outline
    fill(228, 232, 42);  //Yellow
    rectMode(CENTER);
    rect(x, y+h, w/2, h/4); //Boom's end
    fill(227, 23, 26); //Red
    ellipseMode(CENTER);
    ellipse(x+w/2, y+ 2*(h/2.7), w/2, h/2); //Seeker
  }


//function for Seeker's movement
  void move() {
    x = x + speedX();//horizontal movement
    y = y + speedY();//vertical movement
  }


//function for horizontal speed
  float speedX() {
    float delta = mouseX - width/2;
    return delta/SPEEDSCALE;
  }


//function for vertical speed
  float speedY() {
    float delta = mouseY - height/2;
    return delta/SPEEDSCALE;
  }


//detects if Seeker has caught the snitch
  boolean caughtSnitch(Snitch pos) {
    //if snitch is within the Seeker's grasp
    if ( (dist(pos.x, pos.y, x, y)) < w)
      return true;
    else
      return false;
  }


//Seeker appears at the opposite side of the screen if goes off screen
  void wrapAround() {
    //if Seeker goes off left "wall"
    if (x + w < 0) {
      x = width;
      //if Seeker goes off top "wall"
    } else if ( y + h < 0) {
      y = height;
      //if Seeker goes off right "wall"
    } else if ( x > width) {
      x = 0;
      //if Seeker goes off bottom "wall"
    } else if ( y > height) {
      y = 0;
    }
  }
  
}

