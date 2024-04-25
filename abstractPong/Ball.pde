class Ball extends Circle {
  //class vars
  PFont font = createFont("MS UI Gothic", 55);
  float xSpeed, ySpeed, xSpeedChange, ySpeedChange;
  float tablex, tabley, tablew, tableh;
  float paddlex, paddley, paddlew, paddleh;
  Boolean rSide = false;
  Boolean scoreCondition = false;
  Boolean paused = false;

  Ball (color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    xSpeed = 3*xSpeedChange();
    ySpeed = 3*ySpeedChange();
    xSpeedChange = 1.2; //zoom zoom zoom zoom zoom zoom
    ySpeedChange = 1.2;
  }

  //methods
  float xSpeedChange() {
    float xSpeedChange = int (random(-2, 2));
    while (xSpeedChange == 0) {
      xSpeedChange = int (random(-2, 2));
    }
    return xSpeedChange;
  }

  float ySpeedChange() {
    float ySpeedChange = int (random(-2, 2)); //idk how but changing this to anything other than two literally breaks the laws of physics so leave it alone....
    while (ySpeedChange == 0) {
      ySpeedChange = int (random(-2, 2));
    }
    return ySpeedChange;
  }

  void draw() {
    ball();

    pause();
    move();

    onePlayerPaddle();
    onlyChild();
  }

  void move() {
    bounce();
    this.x += xSpeed * xSpeedChange;
    this.y += ySpeed * ySpeedChange;

    if (this.x < (tablew*1/2)) {
      this.rSide = true;
    } else {
      this.rSide = false;
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
  
  void onePlayerPaddle () {
     if (onePlayer == true) {
      if (this.rSide == false) {
        if (this.x > tablew*3/4) {
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
  }
  
  void onlyChild() {
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
        createText("New game! Select player number to start.", 0, 0, appWidth, appHeight);
        fill(defaultCol);
        oneP.draw();
        twoP.draw();
         
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
    fireworks.tableUpdate(myTable.x, myTable.y, myTable.w, myTable.h);
    
    this.xSpeed *= xSpeedChange();
    this.ySpeed *= ySpeedChange();
  }

  void endPauseKP() {
    if (paused == true && key == ' ') {
      paused = false;
      scoreCondition = false;
      fireworks.pauseUpdate();
    }
  }

  void endPauseMP() {
    if (paused == true) {
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
