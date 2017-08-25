class Brush3 {

// declaring global variables  
  float x;
  float y;
  float size;
  
  PImage FACE_2;

  
//--------------------------------------------------  

void setPosition(int mouseX, int mouseY) {
// initializing variables   
  x = mouseX;
  y = mouseY;
  
  //frameRate(7);
  FACE_2 = loadImage("FACE_2.png");
  
}

void setSize (float s) {
  
size = s;
  
}

void drawBrush3() {
  
  imageMode(CENTER); 
  stroke(255,153,153);
  fill(255,252,252);
  ellipse(x, y, 130, 130); 
  image(FACE_2, x, y+5, 100, 100);
  
  noStroke(); 
  fill(random(255,255), random(200,255), random(200,255)); 
  // keeping RGB specifications all close to and at 255 creates 
  // lighter parameters when creating colour
  
  ellipse(x-50, y-50, size, size);  
  ellipse(x+50, y-50, size, size);
 
  fill(255,102,102);
  stroke(255,153,153);
  ellipse(x+30, y-60, size, size);
  ellipse(x-30, y-60, size, size);
  ellipse(x, y-80, size+10, size+10);
  ellipse(x-60, y-30, size, size);
  ellipse(x+60, y-30, size-5, size-5);
  ellipse(x-70, y-10, size-10, size-10);
  ellipse(x+70, y-10, size-10, size-10);
  }
}