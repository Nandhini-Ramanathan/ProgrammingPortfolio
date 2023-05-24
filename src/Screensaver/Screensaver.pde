// Nandhini ramanathan | 10 October 2022 | Screensaver App
float xpos, ypos, strokeW, pointCount;

void setup() {
  size(displayWidth, displayHeight);
  xpos = random(width);
  ypos = random(height);
  background(random(255));
}

void draw() {
  strokeW = random(2, 10);
  pointCount = random(10, 30);
  stroke(random(255), random(22), random(99));
  strokeWeight(strokeW);
  if (xpos <0 || xpos > width || ypos < 0 || ypos > height) {
    xpos = random(width);
    ypos = random(height);
  }
  if (random(100)>70) {
    moveRight(xpos, ypos, pointCount);
  } else if (random(100)>65) {
    moveUp(xpos, ypos, pointCount);
  } else if (random(100)>55) {
    moveDown(xpos, ypos, pointCount);
  } else {
    moveLeft(xpos, ypos, pointCount);
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX - i;
    ypos = startY;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    xpos = startX;
    ypos = startY-i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY+i;
  }
}
