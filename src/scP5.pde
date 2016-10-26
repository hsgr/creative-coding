
import oscP5.*;
import netP5.*;
OscP5 oscP5;

float x; // global variable

void setup() {
  size(400, 300);
  frameRate(24);
  background(0);
  smooth();

  OscProperties properties = new OscProperties();
  properties.setListeningPort(47120); // osc receive port (from sc)
  oscP5 = new OscP5(this, properties);
}

void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/sc3p5")) {
    x = msg.get(0).floatValue(); // receive floats from sc
  }
}

void draw() {
  background(x, x, x);
  println("POST: ", x);
  // draw rect
  stroke(256-x/2, 256-x*abs(sin(x)), 256-x/4);
  strokeWeight(4);
  fill(256-x/2, 256-x, 256-x*abs(sin(x)));
  translate(width/2, height/2);
  rotate(x%64);
  rect(x%64, x%64, x*abs(sin(x))%128, x*abs(sin(x))%128, 6);
  // saveFrame("./img/rect###.png");
}
