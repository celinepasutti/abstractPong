abstract class Shape {
  //class vars
  float x, y, w, h;
  color col, defaultCol;

  Shape(color col, float x, float y, float w, float h) {
    this.col = col;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    defaultCol = 0; //nightModeCol();
  }



  //methods
  abstract void draw();


  /* color nightModeCol() { ---------- potential nightMode...
   color nm = 0;
   return nm;
   }*/
}
