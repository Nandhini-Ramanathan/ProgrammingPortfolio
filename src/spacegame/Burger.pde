class Burger {
  int x, y, diam, speed;
  
  PImage burger;

  Burger() {
    x = int(random(width));
    y = -50;
    diam = int(random(40, 100));
    speed = int(random(2, 10));
    burger = loadImage("burger.png");
  }

  void display() {
    burger.resize(diam, diam);
    imageMode(CENTER);
    image(burger, x, y);
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
   boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
