// Nandhini Ramanathan | 12 Sept | Timeline

void setup() {
  size(900, 400);
  background(#BEE5E5);
}

void draw() {
  background(#BEE5E5);

  // Render the title
  textSize(30);
  textAlign(CENTER);
  fill(#2F5458);
  text("Computer History Timeline", width/2, 60);
  fill(#b04801);
  textSize(20);
  text("by Nandhini Ramanathan", width/2, 85);

  // Rennder the timeline
  strokeWeight(3);
  stroke(#8d3901);
  line(100, 250, 800, 250);
  fill(#2F5458);
  text("1930", 80, 240);
  text("1960", 820, 240);

  // Render timeline events
  histEvent(120, 200, "Model K - 1937", "George Robert Stibitz completed this relay-based calculator, \n which became the first binary adder.", true);
  histEvent(180, 300, "Z1 - 1938", "Created by German engineer Konrad Zuseit, \n was a motor-driven mechanical computer that was binary electrically driven with limited programmability.", false);
  histEvent(300, 200, "Z2 - 1940", "Followed up by Konrad Zuseit, \n replaced the arithmetic and control logic with electrical relay circuits.", true);
  histEvent(360, 300, "Z3 - 1941", "Also created by Konrad Zuseit, \n was the world's first working electromechanical programmable, fully automatic digital computer.", false);
  histEvent(480, 200, "Colossus - 1944", "Designed by General Post Office (GPO) research telephone engineer Tommy Flowers, \n it uses vacuum tubes to perform Boolean and counting operations.", true);
  histEvent(540, 300, "ENIAC - 1945", "Created by John Mauchly and J. Presper Eckert, \n was the first programmable, electronic, general-purpose digital computer.", false);
  histEvent(660, 200, "IBM 704 - 1954", " It is a large mainframe computer introduced by IBM, which is created by Charles Ranlett FlintCreated. \n It was the first mass-produced computer with hardware for floating-point arithmetic.", true);
  histEvent(720, 300, "Ferranti Mercury - 1957", "Built by Ferranti, founded by Sebastian Ziani de Ferranti, had additional installments such as \n a floating point unit for improved performance, and increased reliability by replacing it with a core memory.", false);
}

void histEvent(int x, int y, String title, String detail, boolean top) {
  if (top == true) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  rectMode(CENTER);
  fill(77);
  strokeWeight(3);
  fill(#CB631D);
  rect(x, y, 150, 30, 8);
  fill(255);
  textSize(15);
  text(title, x, y+5);
  if (mouseX > x-75 && mouseX < x+75 && mouseY > y-20 && mouseY < y+20) {
    fill(#2F5458);
    text(detail, width/2, 350);
  }
}
