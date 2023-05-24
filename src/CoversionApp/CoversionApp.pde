// Nandhini Ramanathan | 5 October 2022 | Conversion App

void setup() {
  size(1010, 250);
}

void draw() {
  background(#BCE5F5);
  line(0, 120, width, 120);
  fill(#A57B3C);
  textSize(25);
  textAlign(CENTER);
  text("Miles To Kilometers", width/2, 40);
  textSize(15);
  text("by Nandhini Ramanathan", width/2, 60);
  text ("Use your mouse to slide the box along the line to get conversions from Miles to Kilometrs. The cursor represents Miles.", width/2, 225);
  fill(#053D95);
  for (int i=0; i<width; i+=20) {
    line(i, 115, i, 125);
    textSize(9);
    textAlign(CENTER);
    text(i, i, 110);
  }
  rect(mouseX, 118, 5, 5);
  text(mouseX, mouseX, 135);
  
  textSize(12);
  text("Kilometers:" + milToKil(mouseX), width/2, 200);
  text("Miles:" + kilToMil(mouseX), width/2, 180);
}

float milToKil(float val) {
  val = val*1.609;
  return val;
}

float kilToMil(float val) {
  val = mouseX;
  return val;
}
