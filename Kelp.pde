class Kelp{
  
  float strokeW;
  float xKelp[] = new float[26];
  float yKelp;
  float wideKelp;
  float translateHeight;
  float waveSpeedB[] = new float[4];
  float waveSpeed[] = new float[26];
  color c;
  
  Kelp(){
    this.strokeW = 8;
    for(int i=0; i<25; i++){
    this.xKelp[i] = random(2)-random(2);
    }
    for(int i=0; i<4; i++){
      this.waveSpeedB[i] = random(.021)-random(.021);
    }
    for(int i=4; i<25; i++){
      this.waveSpeed[i] = random(.075)-random(.075);
    }
    this.yKelp = 0;
    this.wideKelp = 10;
    this.c = color(39, 154, 51);
    translateHeight = 2;
  }
  
  void display(){
    pushMatrix();
    translate(0, 160, 0);
    stroke(this.c);
    strokeWeight(this.strokeW);
    noFill();
    rotateX(HALF_PI);
    translate(0, 0, 0);
    ellipse(this.xKelp[0], this.yKelp, this.wideKelp, this.wideKelp/3);
    
    for(int i=0; i<25; i++){
    translate(0, 0, translateHeight);
    ellipse(this.xKelp[i+1], this.yKelp, this.wideKelp-widthDecrease, this.wideKelp/divider);
    widthDecrease = widthDecrease + decreaser;
    divider = divider + .3;
    }
 
    widthDecrease = .25;
    divider = 3;
    popMatrix();
    noStroke();
    strokeWeight(1);
    updateKelp();
    checkKelp();
  }
  
  void updateKelp(){
    for(int i=0; i<4; i++){
    this.xKelp[i] = this.xKelp[i] + waveSpeedB[i];
    }
    for(int i=4; i<25; i++){
    this.xKelp[i] = this.xKelp[i] + waveSpeed[i];
    }
  }
  
  void checkKelp(){
     for(int i=0; i<25; i++){
       if(this.xKelp[i] > 2) waveSpeed[i] = waveSpeed[i] * -1;
       if(this.xKelp[i]< -2) waveSpeed[i] = waveSpeed[i] * -1;
    }
    for(int i=0; i<4; i++){
       if(this.xKelp[i] > 1) waveSpeedB[i] = waveSpeedB[i] * -1;
       if(this.xKelp[i]< -1) waveSpeedB[i] = waveSpeedB[i] * -1;
    }
  }
}