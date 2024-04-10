class Ball extends Circle {
  //class vars
  float xStart, yStart, xSpeed, ySpeed, xSpeedChange, ySpeedChange;
  float tablex, tabley, tablew, tableh;
  float paddleX, paddleY, paddleW, paddleH;
  Boolean rSide;

  Ball (color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    xStart = x;
    yStart = y;
    xSpeed = 3*xSpeedChange();
    ySpeed = 3*ySpeedChange();
    xSpeedChange = 1.0; //break bounce physics - change speed
    ySpeedChange = 1.0;
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

    if (x <= (tablew*1/2)) {
      rSide = true;
    } else {
      rSide = false;
    }
  }

  void bounce() {
    if (y < tabley + (w/2) || y > (tabley + tableh - (w/2))) {
      ySpeed *= -1;
    }
    if (x < tablex + (w/2) || x > tablew - (w/2)) {
      xSpeed *=  -1;
    }
  }

  void tableUpdate(float tablexParameter, float tableyParameter, float tablewParameter, float tablehParameter) {
    tablex = tablexParameter;
    tabley = tableyParameter;
    tablew = tablewParameter;
    tableh = tablehParameter;
  }
}

//RESP:::
//NETEXPLOSION
