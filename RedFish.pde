class RedFish extends Animals{
  
    color cR;
    color cTailR;
  
  RedFish(){
    zSide = 0;
    tailAdd = 0;
    xMinUpd = -900;
    xTransUpd = 875;
    xMin = -440;
    int d = 0;

    x1 = 15;
    y1 = 2.5;
    z1 = -5.75;
    this.yPosit = 0;
    this.xPosit = 0;

    this.xSpeed = -.25 - random(.65);
    this.ySpeed =.15 + random(.75);
    this.zSpeed = random(1) - random(1);
    xAdd = 0;

    xAddDecrease = 2.5;

    yAdd = 0;
    yAddDecrease = 1;


    for (int i =0; i<nRings; i++) {

      this.yPosit = 0;
      this.xPosit = 0;

      if ((i>=0)&&(i<19)) {
        xTrans[i] = xAdd;
        xAdd = xAdd + xAddDecrease;
      }
      if ((i>18)&&(i<=19)) {
        xTrans[i] = xAdd;
      }
      if ((i>19)&&(i<=20)) {
        xTrans[i] = xAdd;
        xAdd = xAdd + xAddDecrease;
      }
      if ((i>20)&&(i<=23)) {
        xTrans[i] = xAdd;
      }


      yTrans[i] = 0;

      if ((i>=11)&&(i<16)) {
        yTrans[i] = yAdd;
        yAdd = yAdd + 1;
      }
    }

    yTrans[16] = 4;
    yTrans[17] = 3;
    yTrans[18] = 2.5;
    yTrans[19] = -3;
    yTrans[20] = 7;
    yTrans[21] = -3;
    yTrans[22] = 7;
    yTrans[0] = 0;
    yTrans[1] = 0;
    yTrans[2] = 0;

    highInit = 15;
    //Tail
    for (int i=16; i<nRings; i++) {
      this.high[i] = highInit - 9.9;
    }
    //Body
    this.high[15] = highInit - 9.5;
    this.high[14] = highInit - 8.75;
    this.high[13] = highInit - 8;
    this.high[12] = highInit - 6;
    this.high[11] = highInit - 4.5;
    this.high[10] = highInit - 2.5;
    this.high[9] = highInit - 1;
    this.high[8] = highInit - .5;
    this.high[7] = highInit - .5;
    this.high[6] = highInit - 1.25;
    this.high[5] = highInit - 2;
    this.high[4] = highInit - 2.5;
    this.high[3] = highInit - 3;
    //Head
    this.high[0] = highInit - 6.5;
    this.high[1] = highInit - 5.5;
    this.high[2] = highInit - 4;


    wideInit = highInit*2;
    //Head
    this.wide[0] = wideInit - 15.5;
    this.wide[1] = wideInit - 12;
    this.wide[2] = wideInit - 9.5;
    //Tail
    this.wide[22] = wideInit - 16.5;
    this.wide[21] = wideInit - 16;
    this.wide[20] = wideInit - 14;
    this.wide[19] = wideInit - 13;
    this.wide[18] = wideInit - 4;
    this.wide[17] = wideInit - 9;
    this.wide[16] = wideInit - 14.5;
    //Body
    this.wide[15] = wideInit - 16.5;
    this.wide[14] = wideInit - 13;
    this.wide[13] = wideInit - 10.5;
    this.wide[12] = wideInit - 7.5;
    this.wide[11] = wideInit - 4;
    this.wide[10] = wideInit - 2.35;
    this.wide[9] = wideInit - 1.75;
    this.wide[8] = wideInit - .5;
    this.wide[7] = wideInit - .25;
    this.wide[6] = wideInit - 1.25;
    this.wide[5] = wideInit - 2.75;
    this.wide[4] = wideInit - 5.75;
    this.wide[3] = wideInit - 8;

    this.strokeWA = 15;
    this.cA = color(243, 243, 10);
    this.cTail = color(202, 28, 202);
    revTrans = 195;
    
    for(int i=0; i<16; i++){
      zTrans[i] = 0;
    }
    
     for (int i=16; i<nRings; i++) {
      tailSpeed[i] = .5;
      zTrans[i] = tailAdd;
      tailAdd = tailAdd + .225;
    }
    cR = color(231,112,24);
    cTailR = color(80);
  }
  
  void display(){
pushMatrix();
    translate(revTrans, 0, zSide);

    if (reverse == true) {
      xMin = -875;
      translate(-830, 0, 0);
      rotateY(PI);
    }

    while (p==2) {
      if (reverse == false) {
        xMin = -440;
        xAdd=0;
        for (int i =0; i<nRings; i++) {

          if ((i>=0)&&(i<19)) {
            xTrans[i] = xAdd;
            xAdd = xAdd + xAddDecrease;
          }
          if ((i>18)&&(i<=19)) {
            xTrans[i] = xAdd;
          }
          if ((i>19)&&(i<=20)) {
            xTrans[i] = xAdd;
            xAdd = xAdd + xAddDecrease;
          }
          if ((i>20)&&(i<=23)) {
            xTrans[i] = xAdd;
          }
        }

        p=0;
      }
    }


    strokeWeight(this.strokeWA);
    noFill();
    for (int i=0; i<16; i++) {
      stroke(this.cR);
      pushMatrix();
      translate(xTrans[i], yTrans[i], zTrans[i]);
      rotateY(HALF_PI);
      ellipse(this.xPosit, this.yPosit, this.high[i], this.wide[i]);
      popMatrix();
    }

    for (int i=16; i<nRings; i++) {
      pushMatrix();
      translate(xTrans[i], yTrans[i], zTrans[i]);
      stroke(this.cTailR);
      rotateY(HALF_PI);
      ellipse(this.xPosit, this.yPosit, this.high[i], this.wide[i]);
      popMatrix();
    }


    pushMatrix();
    fill(cTailR);

    translate(this.x1, this.y1, this.z1-2);
    stroke(this.cTailR);
    rotateZ(HALF_PI);
    ellipse(this.xDet, this.yDet-2, 2.25, 11.5);
    translate(0, 0, 16);
    ellipse(this.xDet, this.yDet-2, 2.25, 11.5);
    translate(-2, -1, -8.75);
    translate(-2.5, 9.5, 7.5);
    strokeWeight(7.5);
    noFill();
    stroke(0);
    ellipse(this.xDet, this.yDet, 2.25, 2.25); 
    translate(0, 0, -14.5);
    ellipse(this.xDet, this.yDet, 2.25, 2.25); 
    popMatrix();

    noStroke();
    strokeWeight(1);

    if ((reverse==true)||(reverse == false)) {
      popMatrix();
    }

    super.updatePosition();
    super.wiggle();
    super.wiggleCheck();
  }
}