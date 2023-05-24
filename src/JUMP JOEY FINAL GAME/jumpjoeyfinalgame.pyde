from platform_class import *
from player_class import *
from functions import *

def mousePressed():
    global platforms
    platforms = []
    starter_platform = platform([100, 700])
    platforms.append(starter_platform)
    global p1
    p1 = player()
    loop()

def setup():
    size(500, 800)
       
    global img
    global screen
    img = loadImage("startscreenn.png")
    screen = 1
    
    #list of platforms
    global platforms
    platforms = []
    starter_platform = platform([100, 700])
    platforms.append(starter_platform)
    global p1
    p1 = player()

def draw(): 
    print(screen)
    if screen == 1:
        startScreen()
    elif screen == 2:
        playScreen()

def mouseClicked():
    global screen
    if screen == 1:
        screen = 2
    elif screen == 2:
        screen = 2
        
def startScreen():
    global img
    image(img, 0, 0)

def playScreen():
    background(0)
    frameRate(30)
    background(255)
    for platform in platforms:
        platform.display()
    p1.update(platforms)
    platform_manager(platforms)
    
    #this ends the game if the player falls off the screen
    if p1.ypos > height+25:
        background(0)
        fill(255, 255, 255)
        textAlign(CENTER, CENTER)
        textSize(80)
        text("GAME", width/2, 2*height/10)
        text("OVER", width/2, 3*height/10)
        textSize(40)
        text("Score: "+str(p1.score/100), width/2, 5*height/10)
        text("Play Again: [CLICK]", width/2, 7*height/10)
        textAlign(LEFT)
        noLoop()
    



    

        
        
