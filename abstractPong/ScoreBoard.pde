class ScoreBoard extends Rectangle {
  //class vars
  PFont font = createFont("MS UI Gothic", 55);
  String text;
  int score = 0;
  String scoreText;
  Boolean inNet = false;

  ScoreBoard(color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    this.scoreText = str(this.score);
  }

  //methods
  void draw() {
    fill (col);
    rect(x, y, w, h);
    fill(white);
    createText(this.x, this.y, this.w, this.h);
    fill(defaultCol);

    if (this.inNet == true) {
      scoreUpdate();
      this.inNet = false;
    }
  }

  void scoreUpdate() {
    this.score += 1;
    this.scoreText = str(this.score);
  }

  void createText (float x, float y, float w, float h) {
    fill(white);
    textAlign (CENTER, CENTER);
    textFont(font, 40);
    text(scoreText, x, y, w, h);
    fill(defaultCol);
  }
}
