class JellyFish extends Animals{ 
  
  int nRingsJ = 5;
  int nRings2 = 10;
  int totRings = nRingsJ+nRings2;
  float strokeWJ;
  float xTransJ[] = new float[nRingsJ];
  float yTransJ[] = new float[nRingsJ];
  float zTransJ[] = new float[nRingsJ];
  float zTransJ2[] = new float[nRings2];
  float highJ[] = new float[nRingsJ];
  float wideJ[] = new float[nRingsJ];
  color cJ;
  float zInit;
  float zAddJ;
  float zInit2;
  float zAdd2;
  float highInit;
  float highAdd;
  float rX;
  float xJ;
  float yJ;
  float zJ;

  float xJTrans;
  float yJTrans;
  float zJTrans;
  float xSpeedJ;
  float ySpeedJ;
  float zSpeedJ;
  float zSideJ;
  
  JellyFish(){
    
    xSpeedJ = .25+random(.125);
    ySpeedJ = .1+random(.2) - random(.3);
    zSpeedJ = random(.4) - random(.4);
    
    float rX = QUARTER_PI;
    strokeWJ = 20;
    cJ = color(200, 95, 211, 120);
    
    zInit = 0;
    zAddJ = 2;
    zInit2 = -2;
    zAdd2 = -1.5;
    highInit = 10;
    highAdd = -2;
    
    for(int i=0; i<nRingsJ; i++){
      zTransJ[i] = zInit;
      zInit = zInit + zAddJ;
    }
    for(int i=0; i<nRings2; i++){
      zTransJ2[i] = zInit2;
      zInit2 = zInit2 + zAdd2;
    }
    
    highJ[0] = 11;
    highJ[1] = 12.75;
    highJ[2] = 11.75;
    highJ[3] = 8.5;
    highJ[4] = 4.5;
    
  }
  
  
  
  void display(){
    
    pushMatrix();
    translate(0,0,zSideJ);
    translate(xJ, yJ, zJ);
    rotateX(HALF_PI);
    translate(195, 0, 0);
  //  rotateY((PI/3)*5.75);
    rotateZ(PI/7);
    
    for(int i=0; i<nRingsJ; i++){
      pushMatrix();
      translate(0, 0, zTransJ[i]);
      strokeWeight(strokeWJ);
      noFill();
      stroke(cJ);
      ellipse(0, 0, highJ[i], highJ[i]);
      popMatrix();
    }
    
    for(int i=0; i<nRings2; i++){
      pushMatrix();
      translate(4.5,0, zTransJ2[i]);
      strokeWeight(5);
      ellipse(0,0,1.5,1.5);
      popMatrix();
    }
    
     for(int i=0; i<nRings2; i++){
      pushMatrix();
      translate(-4.5,0, zTransJ2[i]);
      strokeWeight(5);
      ellipse(0,0,1.5,1.5);
      popMatrix();
    }
    
    for(int i=0; i<nRings2; i++){
      pushMatrix();
      translate(0,4.5, zTransJ2[i]);
      strokeWeight(5);
      ellipse(0,0,1.5,1.5);
      popMatrix();
    }
    
    for(int i=0; i<nRings2; i++){
      pushMatrix();
      translate(0,-4.5, zTransJ2[i]);
      strokeWeight(5);
      ellipse(0,0,1.5,1.5);
      popMatrix();
    }
    
    stroke(1);
    popMatrix();
    updateJelly();
    
  }
  
  
  
  void updateJelly(){
    xJ = xJ - xSpeedJ;
    yJ = yJ + ySpeedJ;
    zSideJ = zSideJ + zSpeedJ;
    if((xJ>0)||(xJ<-440)){
      xSpeedJ = xSpeedJ * -1;
    }
    if((yJ>125)||(yJ<-130)){
      ySpeedJ = ySpeedJ*-1;
    }
    if((zSideJ > 121) || (zSideJ < -121)){
      zSpeedJ = zSpeedJ * -1;
    }
  }
}