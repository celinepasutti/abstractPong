class PongTable extends Rectangle {
  //class vars

  PongTable(color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    //add gravity - dictates firework move physics.
  }

  //methods
  void draw() {
    fill (col);
    rect(x, y, w, h);
    fill(defaultCol);
  }

  /* color nightModeCol() { ---------- potential nightMode...
   color nm = 0;
   return nm;
   }*/
}

//RESP:::
//GIVES BAlL BOUNCE
//GIVES PADDLE EDGE OF NET
