// Nandhini Ramanathan | 19 Sept 2022 | Grades
float val;

void setup() {
  size(1000, 200);
  val = 0.0;
}

void draw() {
  background(#F5DD8F);
  textSize(30);
  stroke(#3E1F83);
  fill(#3E1F83);
  text("Grades: by Nandhini Ramanathan",500,50);
  val = mouseX/250.0;
  noCursor();
  line(0, 100, width, 100);
  ellipse(mouseX, 100, 5, 5);
  textAlign(CENTER);
  textSize(12);
  //text(mouseX, mouseX, 90);
  text(val, mouseX, 115);
  text("Letter Grade: " + calcGrade(val),width/2,150);
  line(0,105,0,95);
  text("0.400",100,100);
  line(100,105,100,95);
  text("0.800",200,100);
  line(200,105,200,95);
  text("1.200",300,100);
  line(300,105,300,95);
  text("1.600",400,100);
  line(400,105,400,95);
  text("2.000",500,100);
  line(500,105,500,95);
  text("2.400",600,100);
  line(600,105,600,95);
  text("2.800",700,100);
  line(700,105,700,95);
  text("3.200",800,100);
  line(800,105,800,95);
  text("3.600",900,100);
  line(900,105,900,95);
  text("0.00",5,100);
  line(999,105,999,95);
  text("4.000",995,100);
}

String calcGrade(float grade) {
  String letterGrade = "";
  if (grade > 3.5) {
    letterGrade = "A";
  } else if (grade>=3.0) {
    letterGrade = "A-";
  } else if (grade>=2.84) {
    letterGrade = "B+";
  } else if (grade>=2.67) {
    letterGrade = "B";
  } else if (grade>=2.50) {
    letterGrade = "B-";
  } else if (grade>=2.34) {
    letterGrade = "C+";
  } else if (grade>=2.17) {
    letterGrade = "C";
  } else if (grade>=2.00) {
    letterGrade = "C-";
  } else if (grade>=1.66) {
    letterGrade = "D+";
  } else if (grade>=1.33) {
    letterGrade = "D";
  } else if (grade>=1.00) {
    letterGrade = "D-";
  } else {
    letterGrade = "F";
  }
  return letterGrade;
}
