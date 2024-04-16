class Button extends Rectangle {
  //class vars
  PFont font = createFont("MS UI Gothic", 55);
  int textSize;
  String text;
  color hoverOver;

  Button(String textParameter, int textSizeParameter, color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    this.text = textParameter;
    this.textSize = textSizeParameter;
    this.hoverOver = col;
  }

  //methods
  void draw() {
    if (mouseX >= this.x && mouseX <= (this.x + this.w) && mouseY >= this.y && mouseY <= (this.y + this.h)) {
      this.col = hoverOver;
    } else {
      this.col = black;
    }
    fill(col);
    rect(x, y, w, h);
    fill(defaultCol);
    fill(white);
    createText(this.x, this.y, this.w, this.h);
    fill(defaultCol);
  }


  void createText (float x, float y, float w, float h) {
    fill(white);
    textAlign (CENTER, CENTER);
    textFont(font, textSize);
    text(text, x, y, w, h);
    fill(defaultCol);
  }
}
