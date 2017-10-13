//Dylan Knobel
//October 13, 2017
//basic animation of Mario and Luigi standard move controls left with A and right with D space to jump
//left click to change to Mario right click to change to Luigi
//when a and d key are pushed together the animation bugs and doesnt know what to do after 
//one of the keys are let go often pointing the wrong way and there is no animation
//

int x = 300;
int y = 360;
boolean jumping = false;
boolean movingLeft = false;
boolean movingRight = false ;
int counter = 0;
PImage[] marioR = new PImage[5];
PImage[] marioL = new PImage[5];
PImage standingMarioR, standingMarioL;
int marioWalkR, marioWalkL;
int state = 3;
int animationState = 1;
PImage[] luigiR = new PImage[4];
PImage[] luigiL = new PImage[4];
PImage standingLuigiR, standingLuigiL;
int luigiWalkR, luigiWalkL;


void setup() {
  //loads sprites, sets screen size, loads sounds, and sets up animation
  size(1000, 600);
  marioWalkR = 0;
  marioWalkL = 0;


  standingMarioR = loadImage("r0.png");
  standingLuigiR = loadImage("Lr0.png");

  //mario animation setup
  for (int iR=0; iR<marioR.length; iR++) {
    marioR[iR] =loadImage("r"+ iR + ".png");
  }
  for (int iL=0; iL<marioL.length; iL++) {
    marioL[iL] =loadImage("l" + iL + ".png");
  }
  //luigi animation setup
  for (int iR=0; iR<luigiR.length; iR++) {
    luigiR[iR] =loadImage("Lr"+ iR + ".png");
  }
  for (int iL=0; iL<luigiL.length; iL++) {
    luigiL[iL] =loadImage("Ll" + iL + ".png");
  }
}

void draw() {
  background(255); //<>//
  moveSprite();
  if (animationState == 1) {
    walkingAnimationMario();
  } else if (animationState == 2) {
    walkingAnimationLuigi();
  }
  if (mousePressed && (mouseButton == RIGHT)) {
    animationState = 2;
    state = 7;
  } else if (mousePressed && (mouseButton == LEFT)) {
    animationState = 1;
    state = 3;
  } //<>//
}


//moves the image left, right and jumps also puts out boundaries
void moveSprite() {
  if (jumping == true) {
    if (y > 200) {
      y -= 5;
      if (y == 200) {
        jumping = false;
      }
    }
  } else if (jumping == false) {
    if (y == 430) {
      y = y + 0;
    } else {
      y = y + 5;
    }
  }
  if (movingRight) {
    x += 5;
  } else if (x == 0) {
    x = x + 0;
  }
  if (movingLeft) {
    x -= 5;
  } else {
    if (x <= 0) {
      x = 0;
    }
    if (x >= 915) {
      x = 915;
    }
  }
}
//checks if you pushed the key
void keyPressed() {
  //this function will be called automatically every time a key on the keyboard is pressed
  if (key == ' ') {
    jumping = true;
  } else if (key == 'a') {
    movingLeft = true;
    if (animationState == 1) {
      state = 2;
    } else if (animationState == 2) {
      state = 6;
    }
  } else if (key == 'd') {
    movingRight = true;
    if (animationState == 1) {
      state = 1;
    } else if (animationState == 2) {
      state = 5;
    }
  }
}
//checks for release of the key
void keyReleased() {
  if (key == ' ') {
    jumping = false;
  } else if (key == 'a') {
    movingLeft = false;
    if (animationState == 1) {
      state = 4;
    } else if (animationState == 2) {
      state = 8;
    }
  } else if (key == 'd') {
    movingRight = false ;
    if (animationState == 1) {
      state = 3;
    } else if (animationState == 2) {
      state = 7;
    }
  }
}

//walking animation for mario
void walkingAnimationMario() {
  if (state == 1) {
    image(marioR[marioWalkR], x, y);
    if (frameCount % 4 == 0) { 
      marioWalkR++;
      marioWalkR = marioWalkR % marioR.length;
    }
  } else if (state == 2) {
    image(marioL[marioWalkL], x, y);
    if (frameCount % 4 == 0) { 
      marioWalkL++;
      marioWalkL = marioWalkL % marioL.length;
    }
  } else if (state == 3) {
    standingMarioR = loadImage("r0.png");
    image(standingMarioR, x, y);
  } else if (state == 4) {
    standingMarioL = loadImage("l0.png");
    image(standingMarioL, x, y);
  }
}

//walking animation for luigi
void walkingAnimationLuigi() {
  if (state == 5) {
    image(luigiR[luigiWalkR], x, y, luigiR[luigiWalkR].width*5, luigiR[luigiWalkR].height*5);
    if (frameCount % 5 == 0) { 
      luigiWalkR++;
      luigiWalkR = luigiWalkR % luigiR.length;
    }
  } else if (state == 6) {
    image(luigiL[luigiWalkL], x, y,luigiL[luigiWalkL].width*5, luigiL[luigiWalkL].height*5);
    if (frameCount % 5 == 0) { 
      luigiWalkL++;
      luigiWalkL = luigiWalkL % luigiL.length;
    }
  } else if (state == 7) {
    standingLuigiR = loadImage("Lr0.png");
    image(standingLuigiR, x, y, standingLuigiR.width*5, standingLuigiR.height*5);
  } else if (state == 8) {
    standingLuigiL = loadImage("Ll0.png");
    image(standingLuigiL, x, y, standingLuigiR.width*5, standingLuigiR.height*5);
  }
}