class Ball extends Circle {
  //class vars
  float xStart, yStart, xSpeed, ySpeed, xSpeedChange, ySpeedChange;
  float tablex, tabley, tablew, tableh;
  float paddlex, paddley, paddlew, paddleh;
  Boolean rSide;

  Ball (color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    xStart = x;
    yStart = y;
    xSpeed = 3*xSpeedChange();
    ySpeed = 3*ySpeedChange();
    xSpeedChange = 1.0; //break bounce physics - change speed
    ySpeedChange = 1.0;
    rSide = false;
  }
  
  /*Ball (color colParameter, float xParameter) {
    super(col, x, y, w, h);
  }*/

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
    //upper branch Circle()
    fill (col);
    ellipse(x, y, w, h);
    fill(defaultCol);


    move();
  }

  /* color nightModeCol() { ---------- potential nightMode...
   color nm = 0;
   return nm;
   }*/

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
    
    /*paddlex = (x <= (tablew * 1/2)) ? rpaddlexParameter: lpaddlexParameter;
    paddley = (x <= (tablew * 1/2)) ? rpaddleyParameter: lpaddleyParameter;
    paddlew = (x <= (tablew * 1/2)) ? rpaddlewParameter: lpaddlewParameter;
    paddleh = (x <= (tablew * 1/2)) ? rpaddlehParameter: lpaddlehParameter;*/
  }
}

//RESP:::
//NETEXPLOSION
