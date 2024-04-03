int appWidth, appHeight;
boolean correctlyOriented;
color red = #C11F1F;

void display() {
  println(width, height, displayWidth, displayHeight);
  appWidth = width;
  appHeight = height;
  correctlyOriented = (appWidth >= appHeight) ? true : false;
}

void portrait() {
  fill(red);
  rect (0, 0, width, height);
  fill(0);
  println("stop");
}
