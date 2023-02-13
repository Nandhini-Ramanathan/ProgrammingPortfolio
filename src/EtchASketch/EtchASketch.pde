// Nandhini Ramanathan | Oct 3 2022 | EtchASketch
int x, y;

void setup() {
  size(500, 500);
  x = width/2;
  y = height/2;
  background(127);
}

void draw() {
  stroke(0);
  strokeWeight(2);
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      moveUp(5);
    } else if (key == 'a' || key == 'A') {
      moveLeft(5);
    } else if (key == 's' || key == 'S') {
      moveDown(5);
    } else if (key == 'd' || key == 'D') {
      moveRight(5);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      moveUp(5);
    } else if (keyCode == RIGHT) {
      moveRight(5);
    } else if (keyCode == LEFT) {
      moveLeft(5);
    } else if (keyCode == DOWN) {
      moveDown(5);
    }
  }
}

void mousePressed() {
  saveFrame("line-######.png");
}

void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+rep;
}

void moveDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}

void moveUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

void moveLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}

void moveRightDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y+i);
  }
  y=y+rep;
  x=x+rep;
}
