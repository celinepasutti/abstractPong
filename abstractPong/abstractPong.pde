//global vars


void setup() {
  size(400, 600);
  //fullScreen();
  noStroke();
  println("intitiated:");
  display();
}

void draw() {
  if (correctlyOriented == false) {
    portrait();
  }
}

void mousePressed() {
  
}

void keyPressed() {
  
}
