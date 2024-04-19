class Fireworks extends Ball {
  //class vars
  float gravity;
  int amt = 50;
  float[] fx = new float [amt];
  float[] fy = new float [amt];
  float[] fw = new float [amt];

  float[] fxSpeed = new float[amt];
  float[] fySpeed = new float[amt];

  color[] fc = new color [amt];


  float xSpeedChange() {
    float xSpeedChange = int (random(-2, 2));
    while (xSpeedChange == 0) {
      xSpeedChange = int (random(-2, 2));
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

  Fireworks(color col, float x, float y, float w, float h, float gravityParameter) {
    super(col, x, y, w, h);
    for (int i=0; i < fx.length; i++) {
      fx[i] = this.x;
      fy[i] = this.y;
      fw[i] = random (appWidth*1/90);
      //fH[i] = h;
      fc[i] = color(random(255), random(255), random(255));
      gravity = gravityParameter;
      fxSpeed[i] = random(-2, 2);
      fySpeed[i] = random(-2, 2);
      gravity = gravityParameter;
    }
  }

  //methods
  void draw() {
    for (int i=0; i < fx.length; i++) {
      fill(fc[i]);
      ellipse(fx[i], fy[i], fw[i], fw[i]);
      fill(defaultCol);
    }
    //ball();

    move();
  }

  void move() {
    bounce();

    for (int i=0; i < fx.length; i++) {
      fySpeed[i] += gravity;
      fx[i] += fxSpeed[i] * xSpeedChange;
      fy[i] += fySpeed[i] * ySpeedChange;
    }
  }

  void bounce() {
    for (int i=0; i < fx.length; i++) {
      if (fy[i] < tabley + (fw[i]/2) || fy[i] > (tabley + tableh - (fw[i]/2))) {
        fySpeed[i] *= -1;
      }
      if (fx[i] < tablex + (fw[i]/2) || fx[i] > tablew - (fw[i]/2)) {
        fxSpeed[i] *=  -1;
      }
      if (fy[i] > (tabley + tableh + fw[i])) {
        fy[i] = appHeight*-1;
      }
    }
  }

  void pauseUpdate() {
    for (int i=0; i < fx.length; i++) {
      if (scoreCondition == false) {
        fx[i] = appWidth*-1;
        fy[i] = appHeight*-1;
      }
    }
  }
}
