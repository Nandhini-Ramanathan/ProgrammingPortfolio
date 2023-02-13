// Nandhini Ramanathan | Nov 2022 | Calc Project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0";
boolean left = true;
boolean newNum = false;
float l, r, result;
char op = ' ';

void setup () {
  size(420, 900);
  numButtons[0] = new Button(20, 800, 180, 80, '0');
  numButtons[1] = new Button(20, 700, 80, 80, '1');
  numButtons[2] = new Button(120, 700, 80, 80, '2');
  numButtons[3] = new Button(220, 700, 80, 80, '3');
  numButtons[4] = new Button(20, 600, 80, 80, '4');
  numButtons[5] = new Button(120, 600, 80, 80, '5');
  numButtons[6] = new Button(220, 600, 80, 80, '6');
  numButtons[7] = new Button(20, 500, 80, 80, '7');
  numButtons[8] = new Button(120, 500, 80, 80, '8');
  numButtons[9] = new Button(220, 500, 80, 80, '9');

  opButtons[0] = new Button(320, 800, 80, 80, '=');
  opButtons[1] = new Button(220, 800, 80, 80, '.');
  opButtons[2] = new Button(320, 700, 80, 80, '+');
  opButtons[3] = new Button(320, 600, 80, 80, '-');
  opButtons[4] = new Button(320, 500, 80, 80, 'x');
  opButtons[5] = new Button(320, 400, 80, 80, '÷');
  opButtons[6] = new Button(20, 300, 180, 80, 'C');
  opButtons[7] = new Button(120, 400, 80, 80, '±');
  opButtons[8] = new Button(320, 300, 80, 80, 's');
  opButtons[9] = new Button(20, 400, 80, 80, '%');
  opButtons[10] = new Button(220, 300, 80, 80, '√');
  opButtons[11] = new Button(220, 400, 80, 80, 'π');
}

void draw() {
  background(#FFF56C);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i]. display();
    numButtons[i]. hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i]. display();
    opButtons[i]. hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 8|| keyCode == 12) {
    handleEvent("C", false);
  } else if (keyCode == 60 || keyCode == 10) {
    handleEvent("=", false);
  } else if (keyCode == 61 ||keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 88 || keyCode == 106) {
    handleEvent("x", false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent("÷", false);
  }
}


void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 12) {
    if (dVal.equals("0")) {
      dVal = val;
    } else if (newNum) {
      dVal = val;
      newNum = false;
    } else {
      dVal += val;
    }
    if (left) {
      l=float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    for (int i = 0; i<opButtons.length; i++) {
      opButtons[i].click=false;
    }
    dVal = "0";
    left = true;
    l = 0;
    r = 0;
    result = 0;
    op = ' ';
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("+")) {
    opButtons[2].click=true;
    op = '+';
    newNum = true;
    left = false;
  } else if (val.equals("-")) {
    opButtons[3].click=true;
    op = '-';
    newNum = true;
    left = false;
  } else if (val.equals("x")) {
    opButtons[4].click=true;
    op = 'x';
    newNum = true;
    left = false;
  } else if (val.equals("÷")) {
    opButtons[5].click=true;
    op = '÷';
    newNum = true;
    left = false;
  } else if (val.equals("=")) {
    opButtons[0].click=true;
    performCalculation();
  }
}
void mouseReleased() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }

  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent(str(opButtons[i].val), false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == 'x') {
      handleEvent("x", false);
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      handleEvent("=", false);
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        opButtons[i].click=true;
        r = r * -1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      if (left) {
        l = l * 100;
        dVal = str(l);
      } else {
        opButtons[i].click=true;
        r = r * 100;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        opButtons[i].click=true;
        r = sq(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        opButtons[i].click=true;
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l = l*PI;
        dVal = str(l);
      } else {
        opButtons[i].click=true;
        r = PI;
        dVal = str(r);
      }
    }
  }
  println("l:" + l + " r:" + r + " op:" + op + " result:" + result + " left:" + left);
}

void updateDisplay() {
  fill(0);
  arc(210, 130, 280, 300, 0, PI, CHORD);
  fill(#FFF56C);
  arc(210, 120, 290, 180, 0, PI, CHORD);
  stroke(0);
  strokeWeight(4);
  arc(145, 40, 130, 60, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
  arc(275, 40, 130, 60, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
  fill(255);
  circle(145, 100, 130);
  circle(275, 100, 130);
  fill(#67BFE8);
  circle(155, 110, 50);
  circle(265, 110, 50);
  fill(0);
  circle(155, 110, 20);
  circle(265, 110, 20);
  fill(#FFF56C);
  stroke(#D16856);
  arc(90, 180, 80, 80, PI-QUARTER_PI, TWO_PI);
  arc(330, 180, 80, 80, PI, TWO_PI+QUARTER_PI);
  stroke(0);
  noFill();
  arc(99, 199, 40, 40, PI, TWO_PI-QUARTER_PI);
  arc(321, 199, 40, 40, PI+QUARTER_PI, TWO_PI);
  fill(#FFF56C);
  arc(210, 170, 50, 140, PI, TWO_PI, OPEN);
  fill(255);
  strokeWeight(6);
  line(145, 35, 145, 25);
  line(275, 35, 275, 25);
  line(175, 40, 180, 33);
  line(245, 40, 240, 33);
  line(115, 40, 110, 33);
  line(305, 40, 310, 33);
  noStroke();
  fill(#AEAD0D);
  ellipse(60, 50, 30, 40);
  ellipse(30, 100, 20, 30);
  ellipse(40, 230, 10, 20);
  ellipse(80, 260, 35, 45);
  ellipse(380, 20, 15, 25);
  ellipse(340, 250, 40, 50);
  fill(#D16856);
  ellipse(85, 170, 7, 5);
  ellipse(65, 165, 7, 5);
  ellipse(95, 155, 7, 5);
  ellipse(335, 170, 7, 5);
  ellipse(355, 165, 7, 5);
  ellipse(325, 155, 7, 5);
  fill(255);
  textAlign(CENTER);
  if (dVal.length() < 9) {
    textSize(32);
  } else if (dVal.length() < 10) {
    textSize(30);
  } else if (dVal.length() < 11) {
    textSize(28);
  } else if (dVal.length() < 12) {
    textSize(26);
  } else {
    textSize(24);
  }
  text(dVal, width-210, 255);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].click=false;
  }
  dVal = str(result);
  l = result;
  left = true;
}
