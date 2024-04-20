class Paddle extends Rectangle {
  //class vars
  Boolean up, down;
  float paddleSpeed;
  float tablex, tabley, tablew, tableh;
  float bally;
  float buffer;

  Paddle(color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    paddleSpeed = 9;
    this.up = false;
    this.down = false;
    this.buffer = (random(-500, 500));
  }

  //methods
  void draw() {
    rectangle();


    if (up == true) {
      movePaddleUp();
    }
    if (down == true) {
      movePaddleDown();
    }
  }

  void movePaddleUp() {
    y -= paddleSpeed;
    if (y < tabley) { //error catch
      y = tabley;
    }
  }

  void movePaddleDown() {
    y += paddleSpeed;
    if ((y + h) > (tabley + tableh)) {
      y = ((tabley + tableh) - h);
    }
  }

  void ballSnipe() {
    if (this.y < (bally + - this.h*1/2)) {
      this.y += paddleSpeed;
    }
    if (this.y > (bally + - this.h*1/2)) {
      this.y -= paddleSpeed;
    }
    if (this.y < tabley) { //error catch
      this.y = tabley;
    }
    if ((y + h) > (tabley + tableh)) {
      this.y = ((tabley + tableh) - h);
    }
  }
  
  void closeIsh() {
    if (this.y < (bally + - this.h*1/2 + this.buffer)) {
      this.y += paddleSpeed;
    }
    if (this.y > (bally + - this.h*1/2 + this.buffer)) {
      this.y -= paddleSpeed;
    }
    if (this.y < tabley) { //error catch
      this.y = tabley;
    }
    if ((y + h) > (tabley + tableh)) {
      this.y = ((tabley + tableh) - h);
    }
  }

  void newGame() {
    if (this.y < yStart) {
      this.y += paddleSpeed;
    }
    if (this.y > yStart) {
      this.y -= paddleSpeed;
    }
  }

  void tableUpdate(float tablexParameter, float tableyParameter, float tablewParameter, float tablehParameter) {
    tablex = tablexParameter;
    tabley = tableyParameter;
    tablew = tablewParameter;
    tableh = tablehParameter;
  }

  void ballUpdate(float ballyParameter) {
    bally =  ballyParameter;
  }

  void keyPressedWASD() {
    if (key == 'w' || key == 'W') {
      down = false;
      up = true;
    }
    if ( key == 's' || key == 'S') {
      up = false;
      down = true;
    }
  }

  void keyPressedARROW() {
    if (key == CODED && keyCode == UP) {
      down = false;
      up = true;
    }
    if (key == CODED && keyCode == DOWN) {
      up = false;
      down = true;
    }
  }

  void keyReleasedWASD() {
    if (key == 'w' || key == 'W') {
      up = false;
    }
    if (key == 's' || key == 'S') {
      down = false;
    }
  }

  void keyReleasedARROW() {
    if (key == CODED && keyCode == UP) {
      up = false;
    }
    if (key == CODED && keyCode == DOWN) {
      down = false;
    }
  }
}

//RESP:::
//GIVE X, Y, W, H to BALL
//
