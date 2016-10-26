
import oscP5.*;
import netP5.*;
import supercollider.*;

Synth synthTri;
Synth synthSaw;

void setup(){
  size(400, 400);
  background(0);

  synthTri = new Synth("lftri");
  synthSaw = new Synth("lfsaw");

  synthTri.set("amp", 0.0);
  synthSaw.set("amp", 0.0);
  synthTri.create();
  synthSaw.create();
}

void draw(){
  synthTri.set("amp", 0.1);
  synthTri.set("freq", 200+mouseX);
  synthSaw.set("amp", 0.1);
  synthSaw.set("freq", 200+mouseY);
}
