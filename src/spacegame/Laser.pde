class Laser {
  int x, y, w, h, speed;
  color c1;

  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 4;
    h = 15;
    speed = 5;
    c1 = color(255, 0, 0);
  }

  void display() {
    rectMode(CENTER);
    fill(c1);
    noStroke();
    rect(x, y, w, h);
    fill(255);
    rect(x, y, w-2, h-2);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-12) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Burger burger) {
    float d = dist(x, y, burger.x, burger.y);
    if (d<burger.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
