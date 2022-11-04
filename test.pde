PImage img; 
// Code Music start
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
// Code Music end
float z = -1000;

void setup() {
  //size(900, 900, P3D);
  size(900, 900, P3D);
  img = loadImage("venus.jpg");
  //img.resize(900, 900);
  img.resize(900, 900);
  minim = new Minim(this);
  mySound = minim.loadFile("Phan.mp3", 1024);    
  mySound.play();
}


void draw() {
  background(#f1f1f1);
  fill(0);
  noStroke();
  float tiles = 200;
  float tileSize = width/tiles;

  push();
  //z -= 2;
  translate(width/2, height/2, z);
  //rotateY(radians(frameCount));
  //if (z < -300) {
  //  z = -300;
  //}
//  for (int i = 0; i < mySound.bufferSize() - 1; i++) { 
   float b = mySound.position();
   //print(b);
   print("__");
   float z_ = mySound.mix.level()*200;
   //float z_ = map(b,-1,1, -200, 200);
   print(z_);
           //}
    for (int x = 0; x < tiles; x++) {
      for (int y = 0; y < tiles; y++) {
        
        color c = img.get(int(x*tileSize),int(y*tileSize));
        float b_ = map(brightness(c), 0, 255, 1, 0);
        
        
        float z__ = map(b_,0,1, -200, 200);
        
        
        push();
        translate(x*tileSize - width/2, y*tileSize - height/2, z_*b_*7);
        box(tileSize*b_);
        pop();
      
    }
  }

  pop();
  rec();

}
