class Fireworks extends Circle {
  //class vars
  float gravity;
  float xSpeed, ySpeed;
  float xSpeedChange = 1, ySpeedChange = 1;
  float tablex, tabley, tablew, tableh, ballx, bally;
  Boolean paused = false;

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
    this.w = random(width*1/90);
    this.h = this.w;
    this.col = color (int(random(255)), int(random(255)), int(random(255)));
    gravity = gravityParameter;
    this.xSpeed = random(-5, 5);
    this.ySpeed = random(-5, 5);
  }

  //methods
  void draw() {
    fill (col);
    ellipse(x, y, w, h);
    fill(defaultCol);

    move();
  }

  void move() {
    bounce();

    ySpeed += gravity;
    x += xSpeed * xSpeedChange;
    y += ySpeed * ySpeedChange;
  }

  void bounce() {
    if (this.y < tabley + (this.w*1/2) || this.y > (tabley + tableh - (this.w*1/2))) {
      ySpeed *= -1;
    }
    if (this.x < tablex + (this.w*1/2) || this.x > tablew - (this.w*1/2)) {
      xSpeed *=  -1;
    }
    if (this.y > (tabley + tableh + this.w)) {
      this.y = appHeight*-1;
    }
  }

  void tableUpdate (float tablexParameter, float tableyParameter, float tablewParameter, float tablehParameter) {
    tablex = tablexParameter;
    tabley = tableyParameter;
    tablew = tablewParameter;
    tableh = tablehParameter;
  }
  
  void pauseUpdate(Boolean pauseParameter) {
   paused = pauseParameter;
   if (paused == false) {
     this.x = appWidth*-1;
     this.y = appHeight*-1;
   }
  }
}
