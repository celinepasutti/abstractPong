class Fireworks extends Circle {
  //class vars

  Fireworks(color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    //add gravity - dictates firework move physics.
  }

  //methods
  void draw() {
    fill (col);
    ellipse(x, y, w, h);
    fill(defaultCol);
  }

  /* color nightModeCol() { ---------- potential nightMode...
   color nm = 0;
   return nm;
   }*/

  void move() { //NOT the same as Ball.move() ... the physics are different!! It could be a different name.
    // Students to finish.
  }
}
