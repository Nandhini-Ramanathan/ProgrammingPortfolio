class SpaceShip {
  int x, y, w, ammo, turretCount, health;
  PImage spaceship;

  SpaceShip() {
    x = 0;
    y = 0;
    w = 100;
    ammo = 1000;
    turretCount = 1;
    health = 1000;
    spaceship = loadImage("sponge.png");
  }

  void display() {
    imageMode(CENTER);
    spaceship.resize(100, 150);
    image(spaceship, x, y);
  }

  void move(int tempx, int tempy) {
    x = tempx;
    y = tempy;
  }

  boolean fire() {
    if (ammo>0) {
      ammo--;
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
