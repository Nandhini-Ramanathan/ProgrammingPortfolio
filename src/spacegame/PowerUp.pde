class PowerUp {
  int x, y, diam, speed;
  char type;
  //PImage burger;

  PowerUp() {
    x = int(random(width));
    y = -50;
    diam = int(random(40, 100));
    speed = int(random(2, 10));
    //burger = loadImage("burger.png");
    int rand = int(random(3));
    if (rand == 0) {
      type = 'A';
    } else if (rand==1) {
      type = 'H';
    } else {
      type = 'T';
    }
  }

  void display() {
    fill(#FFB412);
    ellipse(x, y, diam, diam);
    fill(0);
    textAlign(CENTER);
    text(type, x, y+12);
    //burger.resize(diam, diam);
    //imageMode(CENTER);
    //image(burger, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(SpaceShip ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
