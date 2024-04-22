class Ball extends Circle {
  //class vars
  PFont font = createFont("MS UI Gothic", 55);
  float xSpeed, ySpeed, xSpeedChange, ySpeedChange;
  float tablex, tabley, tablew, tableh;
  float paddlex, paddley, paddlew, paddleh;
  Boolean rSide = false;
  Boolean dangerClose = false;
  Boolean scoreCondition = false;
  Boolean paused = false;

  Ball (color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    xSpeed = 3*xSpeedChange();
    ySpeed = 3*ySpeedChange();
    xSpeedChange = 1.2; //break bounce physics - change speed
    ySpeedChange = 1.2;
  }

  //methods
  float xSpeedChange() {
    float xSpeedChange = int (random(-2, 2));
    while (xSpeedChange == 0) {
      xSpeedChange = int (random(-2, 2)); //variable must be populated FIRST!
    }
    return xSpeedChange;
  }

  float ySpeedChange() {
    float ySpeedChange = int (random(-2, 2)); //THIS IS THE CODE FOR CHANGING THE SPEED!!!!!!!!!!!11111!!!!!!1!11!!
    while (ySpeedChange == 0) {
      ySpeedChange = int (random(-2, 2));
    }
    return ySpeedChange;
  }

  void draw() {
    ball();
    println(this.xSpeed);

    pause();
    move();

    if (onePlayer == true) {
      if (this.rSide == false) {
        if (this.x > tablew*3/4 && this.xSpeed > 0) {
          lPaddle.ballSnipe();
        } else {
          if (this.xSpeed > 0) { // keep this line if you want the paddle to not move after x direction goes back to the other direction.
            lPaddle.closeIsh();
          }
        }
      } else {
        lPaddle.newGame();
      }
    }
    if (onePlayer == false && twoPlayer == false) {
      if (this.rSide == false) {
        rPaddle.newGame();
        if (this.x > tablew*3/4) {
          lPaddle.ballSnipe();
        } else {
          if (this.xSpeed > 0) {
            lPaddle.closeIsh();
          }
        }
      } else {
        lPaddle.newGame();
        if (this.x < tablew*1/4) {
          rPaddle.ballSnipe();
        } else {
          if (this.xSpeed < 0) {
            rPaddle.closeIsh();
          }
        }
      }
    }
  }

  void move() {
    bounce();
    x += xSpeed * xSpeedChange;
    y += ySpeed * ySpeedChange;

    if (x < (tablew*1/2)) {
      rSide = true;
    } else {
      rSide = false;
    }
  }

  void bounce() {
    if (this.rSide == true) {
      if (this.x < (paddlex + paddlew + (w/2)) && this.y > paddley && this.y < (paddley + paddleh)) {
        if (this.x > paddlex - w) {
          this.x = (paddlex + paddlew + (w/2));
          this.xSpeed *= -1;
        } else {
          this.xSpeed *= -1;
        }
      }
    } else {
      if (this.x > (paddlex - (w/2)) && this.y > paddley && this.y < (paddley + paddleh)) {
        if (this.x < paddlex + w) {
          this.x = (paddlex - (w/2));
          this.xSpeed *= -1;
        } else {
          this.xSpeed *= -1;
        }
      }
    }
    if (this.y < tabley + (w/2) || this.y > (tabley + tableh - (w/2))) {
      this.ySpeed *= -1;
    }
    if (this.x < tablex + (w/2) || this.x > tablew - (w/2)) {
      this.xSpeed *=  -1;
    }
  }

  void pause() {
    if (paused == true) {
      this.x = xStart;
      this.y = yStart;
      fill(black);
      rect(0, 0, appWidth, appHeight);
      fill(defaultCol);
      if (scoreCondition == true) {
        fill(white);
        createText("Score! Press SPACE to resume.", 0, 0, appWidth, appHeight);
        fill(defaultCol);
      } else {
        fill(white);
        createText("New game! Select player number and press SPACE to start.", 0, 0, appWidth, appHeight);
        fill(defaultCol);
        oneP.draw();
        twoP.draw();

        lScore.scoreReset();
        rScore.scoreReset();
        rPaddle.newGame();
        lPaddle.newGame();
      }
    }
  }

  void tableUpdate(float tablexParameter, float tableyParameter, float tablewParameter, float tablehParameter) {
    tablex = tablexParameter;
    tabley = tableyParameter;
    tablew = tablewParameter;
    tableh = tablehParameter;
  }

  void paddleUpdate(float rpaddlexParameter, float lpaddlexParameter, float rpaddleyParameter, float lpaddleyParameter, float rpaddlewParameter, float lpaddlewParameter, float rpaddlehParameter, float lpaddlehParameter) {
    if (rSide == true) {
      paddlex = rpaddlexParameter;
      paddley = rpaddleyParameter;
      paddlew = rpaddlewParameter;
      paddleh = rpaddlehParameter;
    } else {
      paddlex = lpaddlexParameter;
      paddley = lpaddleyParameter;
      paddlew = lpaddlewParameter;
      paddleh = lpaddlehParameter;
    }
  }

  void netExplosion(float xParameter, float yParameter, float gravityParameter) {
    fireworks = new Fireworks(0, xParameter, yParameter, 0, 0, gravityParameter);

    paused = true;
    scoreCondition = true;
    this.x = xStart;
    this.y = yStart;
    this.xSpeed *= xSpeedChange();
    this.ySpeed *= ySpeedChange();
  }

  void endPause() {
    if (paused == true && key == ' ') {
      paused = false;
      scoreCondition = false;
      fireworks.pauseUpdate();
    }
  }

  void createText (String text, float x, float y, float w, float h) {
    fill(white);
    textAlign (CENTER, CENTER);
    textFont(font, 40);
    text(text, x, y, w, h);
    fill(defaultCol);
  }
}

//RESP:::
//NETEXPLOSION
