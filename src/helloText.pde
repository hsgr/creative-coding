
void setup(){
  size(400, 400);  // size of the window
  background(255); // color of backroung (monochrome)
                   // 3 arguments for RGB colors
  frameRate(30);
  smooth();        // apply smooth filter in graphics
}

void draw(){
  int i; // a local variable
                      // modulo will have effect only if u comment if condition
  i = frameCount%256; // frameCount: starts from value 1 in void draw
                      //           : has the value 0 in void setup
  textAlign(CENTER);
  fill(i);
  textSize(45);
  text("Hello World", width/2, height/2);

  println(i);   // print and change line frameCount

  if(i == 255){
    noLoop();   // stop when fades out
  }
}
