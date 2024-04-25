class Paddle extends Rectangle {
  //class vars
  Boolean up, down;
  float speed, speedStart;
  float hStart;
  float tablex, tabley, tablew, tableh;
  float bally;
  float buffer;
  Boolean adv3 = false;

  Paddle(color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    hStart = h;
    speedStart = 9;
    speed = speedStart;
    this.up = false;
    this.down = false;
    buffer = (random(-200, 200));
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
    
    decrease();
  }

  void movePaddleUp() {
    y -= speed;
    if (y < tabley) { //error catch
      y = tabley;
    }
  }

  void movePaddleDown() {
    y += speed;
    if ((y + h) > (tabley + tableh)) {
      y = ((tabley + tableh) - h);
    }
  }

  void ballSnipe() {
    if (this.y < (bally + - this.h*1/2)) {
      this.y += speed;
    }
    if (this.y > (bally + - this.h*1/2)) {
      this.y -= speed;
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
      this.y += speed;
    }
    if (this.y > (bally + - this.h*1/2 + this.buffer)) {
      this.y -= speed;
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
      this.y += speed;
    }
    if (this.y > yStart) {
      this.y -= speed;
    }
  }

  void reset() {
    this.h = hStart;
    this.speed = speedStart;
  }

  void decrease() {
    if (adv3 == true) {
      this.h *= 0.9;
      this.speed *= 0.75;
      adv3 = false;
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
      buffer = (random(-200, 200));
      down = false;
      up = true;
    }
    if ( key == 's' || key == 'S') {
      buffer = (random(-200, 200));
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
