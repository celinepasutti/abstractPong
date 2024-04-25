//global vars
PongTable myTable;
Button quit, restart, oneP, twoP, nullP;
ScoreBoard lScore, rScore;
Paddle rPaddle, lPaddle;
Fireworks fireworks;
Ball myBall, yourBall;

Boolean onePlayer = false;
Boolean twoPlayer = false;
//Boolean multipleBalls = false;

color black=#000000, white=#FFFFFF, red=#951111, Lgreen=#27C149, gray=#898989;

void setup() {
  //size(400, 600);
  fullScreen();
  noStroke();
  println("initiated");
  display();

  if (correctlyOriented == true) {
    myTable = new PongTable(gray, appWidth*0, appHeight*1/10, appWidth, appHeight*8/10);

    quit = new Button("x", int(appWidth*1/45), red, appWidth*17/20, appHeight*1/30, appWidth/10, appHeight/24);
    restart = new Button("NEW GAME", int(appWidth*1/60), Lgreen, appWidth*1/20, appHeight*1/30, appWidth/10, appHeight/24);
    oneP = new Button("ONE PLAYER", int(appWidth*1/40), myTable.col, appWidth*1/5, appHeight*3/5, appWidth*1/5, appHeight*1/5);
    //nullP = new Button("SCREEN SAVER", 20, myTable.col, appWidth*9/20, appHeight*28/30, appWidth/10, appHeight/24);
    twoP = new Button("TWO PLAYERS", int(appWidth*1/40), myTable.col, appWidth*3/5, appHeight*3/5, appWidth*1/5, appHeight*1/5);

    rScore = new ScoreBoard(black, appWidth*6/20, appHeight*1/30, appWidth/10, appHeight/24);
    lScore = new ScoreBoard(black, appWidth*12/20, appHeight*1/30, appWidth/10, appHeight/24);


    myBall = new Ball(white, myTable.w*1/2, (myTable.y + myTable.h*1/2), myTable.w*1/35, myTable.w*1/35);
    //yourBall = new Ball(white, myTable.w*1/2, (myTable.y + myTable.h*1/2), myTable.w*1/35, myTable.w*1/35);


    rPaddle = new Paddle(white, myTable.w*1/30, (myTable.y + (myTable.h*1/2) - (myTable.h*1/6)), myBall.w*1/2, myTable.h*1/4);
    lPaddle = new Paddle(white, (myTable.w*29/30 - myBall.w*1/2), (myTable.y + (myTable.h*1/2) - (myTable.h*1/6)), myBall.w*1/2, myTable.h*1/4);

    myBall.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);
    //yourBall.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);

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
    /*if (myBall.paused == false && multipleBalls == true) {
     yourBall.draw();
     }
     */

    fireworks.draw();

    quit.draw();
    restart.draw();

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
    /*
    if (multipleBalls == true && myBall.paused == false) {
     yourBall.paddleUpdate(rPaddle.x, lPaddle.x, rPaddle.y, lPaddle.y, rPaddle.w, lPaddle.w, rPaddle.h, lPaddle.h);
     }*/

    goals();
  }
}

void goals() {
  if (myBall.paused == false && myBall.x < myBall.w) {
    lScore.inNet = true;
    myBall.netExplosion(myBall.x, myBall.y, 0.5);
    myBall.paused = true;
    myBall.scoreCondition = true;
    if ((lScore.score - rScore.score) % 3 == 0) {
      lPaddle.adv3 = true;
    }
  }
  if (myBall.paused == false && myBall.x > (appWidth - myBall.w)) {
    rScore.inNet = true;
    myBall.netExplosion(myBall.x, myBall.y, 0.5);
    myBall.paused = true;
    myBall.scoreCondition = true;
    if ((rScore.score - lScore.score) % 3 == 0) {
      rPaddle.adv3 = true;
    }
  }
  /*
    if (myBall.paused == false && multipleBalls == true && yourBall.x < yourBall.w ) {
   lScore.inNet = true;
   yourBall.netExplosion(yourBall.x, yourBall.y, 0.5);
   myBall.paused = true;
   myBall.scoreCondition = true;
   }
   if (myBall.paused == false && multipleBalls == true && yourBall.x > (appWidth - yourBall.w)) {
   rScore.inNet = true;
   yourBall.netExplosion(yourBall.x, yourBall.y, 0.5);
   myBall.paused = true;
   myBall.scoreCondition = true;
   }
   */
}

void scoreComparisons () {
}

void mousePressed() {
  if (correctlyOriented == true) {
    if (myBall.paused == false && mouseX > myTable.x && mouseX < (myTable.x + myTable.w) && mouseY > myTable.y && mouseY < (myTable.y + myTable.h)) { //movedBall error catch
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

      lScore.scoreReset();
      rScore.scoreReset();
      rPaddle.reset();
      lPaddle.reset();
    }
    if (myBall.paused == true && myBall.scoreCondition == false && mouseX >= oneP.x && mouseX <= (oneP.x + oneP.w) && mouseY >= oneP.y && mouseY <= (oneP.y + oneP.h)) {
      println("one player selected");
      onePlayer = true;
      twoPlayer = false;
      myBall.endPauseMP();
    }
    if (myBall.paused == true && myBall.scoreCondition == false && mouseX >= twoP.x && mouseX <= (twoP.x + twoP.w) && mouseY >= twoP.y && mouseY <= (twoP.y + twoP.h)) {
      println("two player selected");
      onePlayer = false;
      twoPlayer = true;
      myBall.endPauseMP();
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
    myBall.endPauseKP();

    /*
    if (key == 'b' || key == 'B') {
     if (multipleBalls == false) {
     multipleBalls = true;
     } else {
     multipleBalls = false;
     }
     }*/
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
