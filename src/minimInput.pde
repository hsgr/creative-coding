
import ddf.minim.*;

Minim minim;
AudioInput in;

void setup(){
  size(400, 400, P3D);
  frameRate(24);
  minim = new Minim(this);
  minim.debugOn();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw(){
  background(0);
  stroke(255);
  smooth();

  float x = width;
  float y = height;
  float angle = 1.019;
  float r = 0.0;

  translate(width/2, height/2);

  r = 10.0;

  for(int i = 0; i < in.bufferSize()-1; i+=8){
    for(int j = 1; j <= 17; j++){
      for(int k = i; k <= j; k++){
        rotate(2*PI/19.0*in.right.get(i));
        stroke(255, (j-k)*angle);
        strokeWeight(1.91 + abs(in.left.get(i)*402));
        beginShape(LINES);
        // beginShape( TRIANGLE_FAN );
        vertex(in.left.get(i)*r, j*r, k*r); // left channel
        vertex(in.right.get(i)*r*x/5, i*r, -j*r);  // right channel
        endShape();
      }
    }
  }
}

void stop(){
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}
