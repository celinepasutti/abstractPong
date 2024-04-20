//global vars
PongTable myTable;
Button quit, restart, oneP, twoP, nullP;
ScoreBoard lScore, rScore;
Paddle rPaddle, lPaddle;
Fireworks fireworks;
Ball myBall;

Boolean onePlayer = false;
Boolean twoPlayer = false;

color black=#000000, white=#FFFFFF, red=#951111, Lgreen=#27C149, gray=#898989;

void setup() {
  //size(400, 600);
  fullScreen();
  noStroke();
  println("initiated");
  display();

  if (correctlyOriented == true) {
    myTable = new PongTable(gray, appWidth*0, appHeight*1/10, appWidth, appHeight*8/10);

    quit = new Button("x", 40, red, appWidth*17/20, appHeight*1/30, appWidth/10, appHeight/24);
    restart = new Button("NEW GAME", 20, Lgreen, appWidth*1/20, appHeight*1/30, appWidth/10, appHeight/24);
    oneP = new Button("ONE PLAYER", 20, myTable.col, appWidth*1/20, appHeight*28/30, appWidth/10, appHeight/24);
    //nullP = new Button("SCREEN SAVER", 20, myTable.col, appWidth*9/20, appHeight*28/30, appWidth/10, appHeight/24);
    twoP = new Button("TWO PLAYERS", 20, myTable.col, appWidth*17/20, appHeight*28/30, appWidth/10, appHeight/24);

    rScore = new ScoreBoard(black, appWidth*6/20, appHeight*1/30, appWidth/10, appHeight/24);
    lScore = new ScoreBoard(black, appWidth*12/20, appHeight*1/30, appWidth/10, appHeight/24);


    myBall = new Ball(white, myTable.w*1/2, (myTable.y + myTable.h*1/2), myTable.w*1/35, myTable.w*1/35);


    rPaddle = new Paddle(white, myTable.w*1/30, (myTable.y + (myTable.h*1/2) - (myTable.h*1/6)), myBall.w*1/2, myTable.h*1/4);
    lPaddle = new Paddle(white, (myTable.w*29/30 - myBall.w*1/2), (myTable.y + (myTable.h*1/2) - (myTable.h*1/6)), myBall.w*1/2, myTable.h*1/4);

    myBall.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);

    rPaddle.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);
    lPaddle.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);


    fireworks = new Fireworks(0, appWidth*-1, appHeight*-1, appHeight*1/30, appWidth*1/30, 0.5);

    myBall.paused = true;
  }
}

void draw() {
  background(black);
  if (correctlyOriented == false) {
    portrait();
  } else {
    myTable.draw();

    rPaddle.draw();
    lPaddle.draw();

    myBall.draw();
    fireworks.draw();

    quit.draw();
    restart.draw();
    oneP.draw();
    twoP.draw();
    //nullP.draw();

    lScore.draw();
    rScore.draw();

    if (onePlayer == true) {
     lPaddle.ballUpdate(myBall.y); 
    }
    if (onePlayer == false && twoPlayer == false) {
     rPaddle.ballUpdate(myBall.y);
     lPaddle.ballUpdate(myBall.y);
    }

    myBall.paddleUpdate(rPaddle.x, lPaddle.x, rPaddle.y, lPaddle.y, rPaddle.w, lPaddle.w, rPaddle.h, lPaddle.h);

    //goal
    if (myBall.x < myBall.w) {
      lScore.inNet = true;
      myBall.netExplosion(myBall.x, myBall.y, 0.5);
    }
    if (myBall.x > (appWidth - myBall.w)) {
      rScore.inNet = true;
      myBall.netExplosion(myBall.x, myBall.y, 0.5);
    }
    fireworks.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);
  }
}

void mousePressed() {
  if (correctlyOriented == true) {
    if (mouseX > myTable.x && mouseX < (myTable.x + myTable.w) && mouseY > myTable.y && mouseY < (myTable.y + myTable.h)) { //movedBall error catch
      println("ball moved");
      myBall.x = mouseX;
      myBall.y = mouseY;
    }
    if (mouseX >= quit.x && mouseX <= (quit.x + quit.w) && mouseY >= quit.y && mouseY <= (quit.y + quit.h)) {
      println("terminated");
      exit();
    }
    if (mouseX >= restart.x && mouseX <= (restart.x + restart.w) && mouseY >= restart.y && mouseY <= (restart.y + restart.h)) {
      println("newly initiated");
      myBall.paused = true;
      onePlayer = false;
      twoPlayer = false;
    } 
    if (mouseX >= oneP.x && mouseX <= (oneP.x + oneP.w) && mouseY >= oneP.y && mouseY <= (oneP.y + oneP.h)) {
      myBall.paused = true;
      onePlayer = true;
      twoPlayer = false;
    }
    if (mouseX >= twoP.x && mouseX <= (twoP.x + twoP.w) && mouseY >= twoP.y && mouseY <= (twoP.y + twoP.h)) {
      myBall.paused = true;
      onePlayer = false;
      twoPlayer = true;
    }
  }
}


void keyPressed() {
  if (correctlyOriented == true) {
    if (twoPlayer == true) {
      rPaddle.keyPressedWASD();
      lPaddle.keyPressedARROW();
    } else if (onePlayer == true) {
      rPaddle.keyPressedWASD();
    }
    myBall.endPause();
  }

  if (key == ESC) {
    println("terminated");
  }
}

void keyReleased() {
  if (correctlyOriented == true) {
    if (twoPlayer == true) {
      rPaddle.keyReleasedWASD();
      lPaddle.keyReleasedARROW();
    } else if (onePlayer == true) {
      rPaddle.keyReleasedWASD();
    }
  }
}
