abstract class Rectangle extends Shape {
  // class vars
  Rectangle(color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
  }

  //methods
  abstract void draw();

  void rectangle() {
    fill (col);
    rect(x, y, w, h);
    fill(defaultCol);
  }
}
