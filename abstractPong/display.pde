float appWidth, appHeight;
boolean correctlyOriented;

void display() {
  appWidth = width;
  appHeight = height;
  correctlyOriented = (appWidth >= appHeight) ? true : false;
  println("orientation :", appWidth, "by", appHeight, "-- correctly oriented (t/f) :", correctlyOriented);
}

void portrait() {
  fill(red);
  rect (0, 0, width, height);
  fill(0);
  println("portrait");
}
