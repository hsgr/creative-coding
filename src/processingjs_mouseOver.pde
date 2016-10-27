
void setup(){
  size(400, 400, P3D);
  frameRate(8);
}

void draw(){
  background(0);
  stroke(255);
  smooth();

  float x = width;
  float y = height;
  float angle = 1.019 * frameCount%24;
  float r = 0.0;

  translate(width/2, height/2);

  r = 10.0;

  for(int i = 0; i < int(mouseX); i+=3){
    for(int j = 1; j <= (int(mouseY)/3); j++){
      for(int k = i; k <= j; k++){
        rotate(2*PI/19.0*i);
        stroke(255, 23, 55, (j-k)*angle);
        strokeWeight(1.91 + abs(i*402));
        beginShape(LINES);
        // beginShape( TRIANGLE_FAN );
        vertex(r, j*r, k*r); // left channel
        vertex(r*x/5,i*r, -j*r);  // right channel
        endShape();
      }
    }
  }
}
