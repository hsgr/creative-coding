
void setup(){
  size(300, 300);
  background(255);
  smooth();
  // frameRate(2);
}

void draw(){
  float x = width/3;
  float y = height/2;
  // println(frameCount);

  smooth();

  pushStyle();
  stroke(255, 180, 23, 23);   // yellow circle style
  strokeWeight(30);
  ellipse(x, y, y, y);
  pushStyle();              // it builds on the current style information
  stroke(255, 23, 32, 80);  // red circle style
  strokeWeight(20);
  ellipse(2*x, y, y, y);
  pushStyle();
  stroke(0, 12, 241, 120);
  strokeWeight(30);
  point(x, y);
  popStyle();
  popStyle();
  popStyle();
  //saveFrame("circle.png");
}
