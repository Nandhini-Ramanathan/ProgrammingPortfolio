class Car {
  color c;
  float xpos, ypos, xspeed;

  //Contructor
  Car() {
    c = color(random(255), random(255), random(255));
    xpos = random(width);
    ypos = random(height);
    xspeed = random(-10, 10);
  }

  void display () {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 50, 12);
    arc(xpos, ypos, 35, 40, PI, TWO_PI);
    noStroke();
    fill(#ABDFE8);
    arc(xpos-4, ypos-5, 15, 20, PI, TWO_PI-PI/2);
    arc(xpos-2, ypos-5, 25, 20, PI+PI/2, TWO_PI);
    fill(0);
    circle(xpos-9, ypos+6, 8);
    circle(xpos+9, ypos+6, 8);
    fill(#C4C4C4);
    circle(xpos-9, ypos+6, 3);
    circle(xpos+9, ypos+6, 3);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos<0) {
      xpos=width;
    }
  }
}
