//global vars
PongTable myTable;
Paddle rPaddle, lPaddle;
Fireworks[] fireworks = new Fireworks[25];

Ball myBall;

color black=#000000, white=#FFFFFF, red=#951111, Lgreen=#27C149, gray=#CBCBCB;

void setup() {
  //size(400, 600);
  fullScreen();
  noStroke();
  println("intitiated");
  display();

  if (correctlyOriented == true) {
    myTable = new PongTable(gray, appWidth*0, appHeight*1/10, appWidth, appHeight*8/10);
    myBall = new Ball(white, myTable.w*1/2, (myTable.y + myTable.h*1/2), myTable.w*1/35, myTable.w*1/35);
    rPaddle = new Paddle(white, myTable.w*1/30, (myTable.y + (myTable.h*1/2) - (myTable.h*1/6)), myBall.w*1/2, myTable.h*1/4);
    lPaddle = new Paddle(white, (myTable.w*29/30 - myBall.w*1/2), (myTable.y + (myTable.h*1/2) - (myTable.h*1/6)), myBall.w*1/2, myTable.h*1/4);

    myBall.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);

    rPaddle.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);
    lPaddle.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);

    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i] = new Fireworks(0, appWidth*-1, appHeight*-1, appHeight*1/30, appWidth*1/30, 0.5);
    }
  }
}

void draw() {
  background(black);
  if (correctlyOriented == false) {
    portrait();
  } else {

    myTable.draw();
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i].draw();
    }

    myBall.draw();

    rPaddle.draw();
    lPaddle.draw();

    myBall.paddleUpdate(rPaddle.x, lPaddle.x, rPaddle.y, lPaddle.y, rPaddle.w, lPaddle.w, rPaddle.h, lPaddle.h);



  //goal
    if (myBall.x < myBall.w) {
      myBall.netExplosion(myBall.x, myBall.y, 0.5);
    }
    if (myBall.x > (appWidth - myBall.w)) {
      myBall.netExplosion(myBall.x, myBall.y, 0.5);
    }
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i].tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);
    }
  }
}

void mousePressed() {
  if (correctlyOriented == true) {
    if (mouseX > myTable.x && mouseX < (myTable.x + myTable.w) && mouseY > myTable.y && mouseY < (myTable.y + myTable.h)) { //movedBall error catch
      println("ball moved");
      myBall.x = mouseX;
      myBall.y = mouseY;
    }
  }
}


void keyPressed() {
  if (correctlyOriented == true) {
    rPaddle.keyPressedWASD();
    lPaddle.keyPressedARROW();
  }

  if (key == ESC) {
    println("terminated");
  }
}

void keyReleased() {
  if (correctlyOriented == true) {
    rPaddle.keyReleasedWASD();
    lPaddle.keyReleasedARROW();
  }
}