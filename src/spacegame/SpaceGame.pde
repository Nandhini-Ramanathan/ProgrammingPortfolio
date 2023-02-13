// Nandhini Ramanathan | 28 Nov 2022 | SpongebobGame
import processing.sound.*;
SoundFile blaster, explosion;
SpaceShip s1;
Timer burgerTimer, powerUpTimer;
ArrayList<Burger> burgers = new ArrayList<Burger>();
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star[] stars = new Star[200];
int score, level, rockCount, laserCount, burgersPassed;
boolean play;

void setup() {
  size(800, 800);
  blaster = new SoundFile(this, "blaster.wav");
  explosion = new SoundFile(this, "explosion.wav");
  s1 = new SpaceShip();
  burgerTimer = new Timer(500);
  burgerTimer.start();
  powerUpTimer = new Timer(5000);
  powerUpTimer.start();
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  rockCount = 0;
  laserCount = 0;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(25);

    //Rendering Stars
    for (int i = 0; i<stars.length; i++) {
      stars[i]. display();
      stars[i]. move();
    }
    noCursor();

    //Distributing PowerUps
    if (powerUpTimer.isFinished()) {
      powerUps.add(new PowerUp());
      powerUpTimer.start();
    }

    //Rendering PowerUps and Detecting Ship Collison
    for (int i = 0; i < powerUps.size(); i++) {
      PowerUp pu = powerUps.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health+=100;
        } else if (pu.type == 'A') {
          s1.ammo+=100;
        } else {
          s1.turretCount++;
        }
        // todo: add sound of explosion
        // todo: add animation of explosion
        // todo: visual effect on the ship
        powerUps.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerUps.remove(pu);
        println(powerUps.size());
      } else {
        pu.display();
        pu.move();
      }
    }


    //Distributing Burgers
    if (burgerTimer.isFinished()) {
      burgers.add(new Burger());
      burgerTimer.start();
      println("Burgers:"  + burgers.size());
    }

    //Rendering Burgers and Detecting Ship Collison
    for (int i = 0; i < burgers.size(); i++) {
      Burger b = burgers.get(i);
      if (s1.intersect(b)) {
        explosion.stop();
        explosion.play();
        s1.health-=b.diam;
        score-=b.diam;
        // todo: add sound of explosion
        // todo: add animation of explosion
        // todo: visual effect on the ship
        burgers.remove(b);
      }
      if (b.reachedBottom()) {
        burgers.remove(b);
        burgersPassed++;
        println(burgers.size());
      } else {
        b.display();
        b.move();
      }
    }



    //Render lasers and Detect Rock Collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < burgers.size(); j++) {
        Burger b = burgers.get(j);
        if (b.intersect(l)) {
          // ToDo: add sound to collision
          // ToDo: add animation of explosion
          lasers.remove(l);
          b.diam -= 50;
          if (b.diam<10) {
            burgers.remove(b);
          }
          score+=b.diam;
        }
        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }

    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();

    if (s1.health<1 || burgersPassed>9) {
      gameOver();
    }
  }
}

//Add Laser based on event
void mousePressed() {
  blaster.stop();
  blaster.play();
  handleEvent();
}

void keyPressed() {
  if (key == ' ') {
    handleEvent();
    blaster.stop();
    blaster.play();
  }
}

void handleEvent() {
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add (new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add (new Laser(s1.x-20, s1.y));
    lasers.add(new Laser (s1.x+20, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 3) {
    lasers.add (new Laser(s1.x-20, s1.y));
    lasers.add(new Laser (s1.x+20, s1.y));
    lasers.add (new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 4) {
    lasers.add (new Laser(s1.x-20, s1.y));
    lasers.add(new Laser (s1.x+20, s1.y));
    lasers.add (new Laser(s1.x+40, s1.y));
    lasers.add(new Laser (s1.x-40, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 5) {
    lasers.add (new Laser(s1.x-20, s1.y));
    lasers.add(new Laser (s1.x+20, s1.y));
    lasers.add (new Laser(s1.x+40, s1.y));
    lasers.add(new Laser (s1.x-40, s1.y));
    lasers.add (new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  }
}

void infoPanel() {
  fill(128, 127);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textAlign(LEFT);
  PFont s;
  s = createFont("SpongeTitle.ttf", 27);
  textFont(s);
  text("Health:" + s1.health +" | Score:" + score + " | Ammo:" + s1.ammo + " | Burgers Passed:" + burgersPassed, 20, 40);
}

void startScreen() {
  background (0);
  fill(255);
  textAlign(CENTER);
  PFont s;
  s = createFont("SpongeTitle.ttf", 35);
  textFont(s);
  text("Spongebob: Mission to Outer Space", width/2, height/2-100);
  PFont k;
  k = createFont("SPACE.ttf", 18);
  textFont(k);
  text("Help Spongebob find Gary, his pet snail, \n who got lost in space! \n And destroy burger asteroids along the way \n  without getting hit.", width/2, height/2-20);
  PFont j;
  j = createFont("EVILDEAD.TTF", 25);
  textFont(j);
  text("Click or press any key to start...", width/2, height/2+150);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background (0);
  fill(255);
  textAlign(CENTER);
  text("Game Over!", width/2, height/2);
  play = false;
  noLoop();
}
