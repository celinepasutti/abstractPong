abstract class Circle extends Shape {
  // class vars
  Circle(color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
  }

  //methods
  abstract void draw();

  void ball() {
    fill (col);
    ellipse(x, y, w, h);
    fill(defaultCol);
  }

  /* color nightModeCol() { ---------- potential nightMode...
   color nm = 0;
   return nm;
   }*/
}
