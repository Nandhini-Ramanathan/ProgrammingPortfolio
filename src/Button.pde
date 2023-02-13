class Button {
  // Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;
  boolean click;

  // Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(#AEAD0D);
    c2 = color(#D3D273);
    on = false;
    click = false;
  }

  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect (x, y, w, h, 8);
    if (click) {
      noFill();
      strokeWeight(2);
      stroke(#52522A);
      rect(x, y, w, h, 8);
    } 

    fill(255);
    textSize(30);
    noStroke();
    textAlign(CENTER);
    if (val == 'C') {
      text("AC", x+90, y+50);
    } else if (val == 's') {
      text("x²", x+40, y+50);
    } else if (val=='0') {
      text(val, x+90, y+50);
    } else {
      text(val, x+40, y+50);
    }
  }

  void hover(int mx, int my) {
    on = (mx > x && mx < x+w && my > y && my < y+h);
  }
}
