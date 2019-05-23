class Bubble {  

  float y;
  float x;
  float z;
  float size;
  float bubbleSpeed;
  float bSize;

  Bubble() {
   y = random(5);
    
   bSize = 2+random(2);
   x = random(245)-random(245);
   z = random(120)-random(120);
   bubbleSpeed = 1 + random(1.5);
  }

  void display() {
    pushMatrix();
    translate(0, 160,0);
    translate(x, y, z);
    fill(97, 185, 222);
    sphere(bSize);
    popMatrix();
    updateBubble();
    bubbleCheck();
  }
  
  void updateBubble(){
    y = y-bubbleSpeed;
  }
  
  void bubbleCheck(){
     if(y < - 350){
   x = random(245)-random(245);
   z = random(120)-random(120);
   y = random(5);
   bubbleSpeed = 1 + random(3);
    }
  }
}