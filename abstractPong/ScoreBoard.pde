class ScoreBoard extends Rectangle {
  //class vars
  PFont font = createFont("MS UI Gothic", 55);
  String text;
  int score = 0;
  int textSize;
  String scoreText;
  Boolean inNet = false;

  ScoreBoard(color col, float x, float y, float w, float h) {
    super(col, x, y, w, h);
    this.scoreText = str(this.score);
    textSize = int(appWidth*1/40);
  }

  //methods
  void draw() {
    rectangle();
    fill(white);
    createText(this.x, this.y, this.w, this.h);
    fill(defaultCol);

    if (this.inNet == true) {
      scoreUpdate();
      this.inNet = false;
    }
  }

  void scoreUpdate() {
    println("score!");
    this.score += 1;
    this.scoreText = str(this.score);
  }

  void scoreReset() {
    this.score = 0;
    this.scoreText = str(this.score);
  }

  void createText (float x, float y, float w, float h) {
    fill(white);
    textAlign (CENTER, CENTER);
    textFont(font, textSize);
    text(scoreText, x, y, w, h);
    fill(defaultCol);
  }
}
