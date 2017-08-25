// this button int is labled lastButton, specifiying last/ most recent button pressed
int lastButton = 0;
// this button tracks whether or not the app should start
int start = 0;
PImage startimg;

//---- BRUSH 1_RELATIVE -----

// rotations are relative to mouse x and y to acheive constant, live tracking/ drawing
int rotationOne = mouseX;
int rotationTwo = mouseY;

//---------------------------

//---- BRUSH 2_RELATIVE -----

float size;
float increment;

//---------------------------

//---- BRUSH 3_RELATIVE -----

// calling class details specified within BRUSH_3 tab 
Brush3 brush3parts;

Brush3 b;

//---------------------------

//---- FACE.PNGS ------------

// This PImage array is storing 3 hand drawn .png faces allocated to each drawing tool
PImage[] FACES = new PImage[3];

int FACES_index = 0;

//---------------------------

//-----------------------------------------------------------------
  
void setup() 
{
  surface.setTitle("..::: Dragon Draw :::..");
  
  background(255);
  size (900, 700);
  
// files locatied in and called from sketch data folder   
  FACES[0] = loadImage("FACE_1.png");
  FACES[1] = loadImage("FACE_2.png");
  FACES[2] = loadImage("FACE_3.png");
  
  brush3parts = new Brush3();
  
  startimg = loadImage("PUP_FOR_COVER_3.png");
  
//---- BRUSH 2_RELATIVE -----

  size = 0;
  increment = 0.5;     
}

//------------------------------------------------------------
void update() {
  
//---- BRUSH 2_RELATIVE -----
  
  size = size + increment; // saved value, old value + increment 

  int max_size = 130;
// setting the paramteres for BRUSH_2's size shifts 
  if (size >= max_size || size <= 0) { // if current size is greater than 
     increment = increment * -1;       // 'or' less than { increment 
  }
}

//------------------------------------------------------------
void brushTabBar() {
// holding all code related to buttons and text (located) at top of canvas  

//---- clear canvas bar ----//    
    noStroke(); 
    fill(255); 
    rect(0, 0, width, 20);
    fill(80);
    textSize(10);
    text("Press Key 'C' to Clear Canvas", 380, 13);
    
// all 'buttons' have been set to show active brush and inactive brush
// through a series of if and else statments, these staments are called 
// upon within the draw function to actuate/ draw specified commands

    noStroke(); 
    
//----- button 1 -----//
 if (lastButton == 1) {  
    //button 1 pressed
    fill(102, 178, 255);
    rect (0, 20, width/3, 70);
      textSize(10);
      fill(230, 230, 255);
      text("Blue Dragon", 110, 60); 
      
} else {
  // button not pressed
    fill(170, 230, 255);
    rect (0, 20, width/3, 70);
      textSize(10);
      fill(105, 105, 255);
      text("Press For Blue Dragon", 90, 60);
      }
  
//----- button 2 -----//
 if (lastButton == 2) {
    //button 2 pressed
    fill(255, 255, 143);
    rect (width/3, 20, width/3, 70);
      textSize(10);
      fill(255, 122, 82);
      text("Yellow Dragon", 410, 60); 
} else { 
  // button 2 not pressed
    fill(255, 255, 204);
    rect (width/3, 20, width/3, 70);
      textSize(10);
      fill(255, 178, 102);
      text("Press For Yellow Dragon", 390, 60); 
      } 
      
//----- button 3 -----//      
 if (lastButton == 3) {
  //button 3 pressed
   fill(255, 102, 102);
   rect (2*width/3, 20, width/3, 70);
      textSize(10);
      fill(255, 232, 232);
      text("Red Dragon", 725, 60); 
} else {
  //button 3 not pressed
   fill(255, 153, 153);
   rect (2*width/3, 20, width/3, 70);
      textSize(10);
      fill(255, 82, 82);
      text("Press For Red Dragon", 700, 60); 
      }
 }


//-----------------------------------------------------------------
void draw() 
{
  
// Welcoming Screen
if (start == 0) {
    noStroke();
    fill(255);
    rect(0,100, 900, 520);
    textSize(20);
    fill(0);
    text("Hello!", 420, 200);
    text("Please press ENTER to begin", 310, 510);
    stroke(255,200,200);
    fill(255);
    ellipse(450, 350, 180, 180);
    imageMode(CENTER);
    image(startimg, 450, 350, 145, 145);
}
else {

// drawing brush tab (buttons)
brushTabBar();

 if (mousePressed) {
        //button 1
     if (mouseY < 100 ){ // alligning with set button parameters (in brushTabBar) 
     // do button functions
     if (mouseX < (width/3)) {
        lastButton = 1; 
     }
     
     if ( mouseX > (width/3) & mouseX < (2*width/3) ) {
       //button 2
       lastButton = 2;
     }
     
     if ( mouseX > (2*width/3) ) {
       //button 3
       lastButton = 3;
     }
     
   } else {
     if(lastButton == 0) {
       println("select a button");
     } 
     
//-------------- BRUSH 1 ---------------

     if(lastButton == 1) { 
// lastButton == 1 is called and through mouse pressed BRUSH_1 can be 
// drawn/ showen on canvas 
       
          rotationOne +=1; //set local variable  
          
          imageMode(CENTER); // placing image in center vs top left corner
          image(FACES[0], mouseX, mouseY, 110, 110); // calling FACE_1.png from array
           
          translate(mouseX, mouseY); 
          stroke(122, 198, 255);
          fill(102, 178, 255, 98);
          ellipse(0, 0, 160, 160);
          
          rotate(rotationOne);
          translate(95, 0); // half diameter of above ellipse + 15
          stroke(255,255,0);
          fill(255, 100, 80, 80);
          ellipse(0, 0, 10, 10);
          
          translate(-190, 0); // 180/ double 95 plus 10, minused to bring ellipse to 
          fill(255, 100, 60); // opposite side
          ellipse(0, 0, 25, 25);
          
          }
          
//-------------- BRUSH 2 ---------------

     if(lastButton == 2) {
   
      update(); // calling for parameters set in update function each frame
          
          stroke(random(255,255), random(200,255), random(255));
          fill(255, 255, 153);
          ellipse(mouseX -70, mouseY, size, size);
          
          ellipse(mouseX, mouseY-70, size, size);
          
          ellipse(mouseX+70, mouseY, size, size);
          
          //------
          
          ellipse(mouseX -40, mouseY, size, size);
          
          ellipse(mouseX, mouseY-30, size, size);
          
          ellipse(mouseX+40, mouseY, size, size);
          
          noFill();
          ellipse(mouseX, mouseY+20, size, size);      
        
          fill(255, 255, 153);
          ellipse(mouseX, mouseY, 120, 120);
          
          imageMode(CENTER);
          image(FACES[2], mouseX, mouseY, 80, 80);
          }
      
//-------------- BRUSH 3 ---------------
  
     if(lastButton == 3) {
       
           b = new Brush3(); // 
           b.setPosition(mouseX, mouseY); // passing values between class and draw 
           b.size = random (10, 40); // passing values between class and draw
  
     b.drawBrush3();
     }  
       
    } 
  } 
}
}

//----------------------------------------------------------------- 
void keyPressed() {
// background is re-set to original background colour creating appearence
// cleared/ fresh canvas 
  
     if (key == 'c') background(255);    
     
     if (keyCode == ENTER) {
       start = 1;
       background(255);
     }
     
     if (key == 'p') saveFrame();
  
}


 