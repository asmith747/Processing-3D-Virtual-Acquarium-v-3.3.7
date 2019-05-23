class Animals {
  //Properties
  int nRings = 23;
  float high[] = new float[nRings];
  float wide[] = new float[nRings];
  int strokeWA;
  float xAdd;
  float xAdd1;
  float xAdd2;
  float xAddDecrease;
  float xAddDecrease1;
  float yAdd;
  float yAddDecrease;
  float highInit;
  float wideInit;
  float xTrans[] = new float[nRings];
  float yTrans[] = new float[nRings];
  float zTrans[] = new float[nRings];
  color cA;
  color cTail;

  float yPosit;
  float xPosit;
  float xDet;
  float yDet;

  float xSpeed;
  float ySpeed;
  float zSpeed;

  float x1;
  float y1;
  float z1;
  int iAdd;
  int iDec;
  int d;

  float xMax;
  float xMin;
  float xMinUpd;

  float xTransUpd;
  float zSide;

  boolean reverse = false;

  int p = 0;

  float revTrans;
  float tailSpeed[] = new float[nRings];
  float tailAdd;

  //Constructor
  Animals() {
    zSide = 0;
    tailAdd = 0;
    xMinUpd = -900;
    xTransUpd = 875;
    xMin = -440;

    x1 = 15;
    y1 = 2.5;
    z1 = -5.75;
    this.yPosit = 0;
    this.xPosit = 0;

    this.xSpeed = -.5 - random(1);
    this.ySpeed =.15 + random(1);
    this.zSpeed = random(1) - random(1);
    xAdd = 0;

    xAddDecrease = 2.5;

    yAdd = 0;
    yAddDecrease = 1;

    // X and Y Positioning for Rings that Construct Fish
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

    highInit = 10;
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

    //Height of all Rings
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

    for (int i=0; i<16; i++) {
      zTrans[i] = 0;
    }

    for (int i=16; i<nRings; i++) {
      tailSpeed[i] = .5;
      zTrans[i] = tailAdd;
      tailAdd = tailAdd + .225;
    }
  }



  //Methods
  void display() { 
    pushMatrix();
    translate(0, 0, zSide);  //Z Moving
    d=d+1;
    pushMatrix();
    translate(revTrans, 0, 0);

    //Making Fish Turn Around
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

    //Drawing Ellipses for Body
    strokeWeight(this.strokeWA);
    noFill();
    for (int i=0; i<16; i++) {
      stroke(this.cA);
      pushMatrix();
      translate(xTrans[i], yTrans[i], zTrans[i]);
      rotateY(HALF_PI);
      ellipse(this.xPosit, this.yPosit, this.high[i], this.wide[i]);
      popMatrix();
    }

    //Drawing Ellipses for Tail
    for (int i=16; i<nRings; i++) {
      pushMatrix();
      translate(xTrans[i], yTrans[i], zTrans[i]);
      stroke(this.cTail);
      rotateY(HALF_PI);
      ellipse(this.xPosit, this.yPosit, this.high[i], this.wide[i]);
      popMatrix();
    }

    //Drawing Eyes and Side Fins
    pushMatrix();
    fill(cTail);
    translate(this.x1, this.y1, this.z1);
    stroke(this.cTail);
    rotateZ(HALF_PI);
    ellipse(this.xDet, this.yDet, 1.5, 8.5);
    translate(0, 0, 11.5);
    ellipse(this.xDet, this.yDet, 1.5, 8.5);
    translate(-2, -1, -5.75);
    translate(-2.5, 9.5, 4);
    strokeWeight(5);
    noFill();
    stroke(0);
    ellipse(this.xDet, this.yDet, 1.5, 1.5); 
    translate(0, 0, -8);
    ellipse(this.xDet, this.yDet, 1.5, 1.5); 
    popMatrix();

    noStroke();
    strokeWeight(1);

    if ((reverse==true)||(reverse == false)) {
      popMatrix();
    }
    popMatrix();
    updatePosition();
    wiggle();
    wiggleCheck();
  }


  void updatePosition() {
    this.x1 = this.x1 + this.xSpeed;
    this.y1 = this.y1 + this.ySpeed;
    this.zSide = this.zSide + this.zSpeed;

    for (int i=0; i<nRings; i++) {
      this.yTrans[i] = this.yTrans[i] + this.ySpeed;
      this.xTrans[i] = this.xTrans[i] + this.xSpeed;

      if (this.xTrans[i] < xMin) {
        reverse = !reverse;
        p=p+1;
      }

      if ((this.yTrans[i] < -190) || (this.yTrans[i] > 130)) {
        this.ySpeed = this.ySpeed * -1;
      }
    }
    if ((this.x1>xTrans[6]+.25)||(this.x1<xTrans[6]-.25)) {
      this.x1 = xTrans[6];
    }

    if ((zSide > 121) || (zSide < -121)) {
      zSpeed = zSpeed * -1;
    }

    xTrans[3] = xTrans[4]-2.5;
    xTrans[2] = xTrans[3]-2.5;
    xTrans[1] = xTrans[2]-2.5;
    xTrans[0] = xTrans[1]-2.5;

    xTrans[19] = xTrans[18]+2.5;
    xTrans[20] = xTrans[18]+2.5;
    xTrans[21] = xTrans[19]+2.5;
    xTrans[22] = xTrans[19]+2.5;

    yTrans[16] = yTrans[15];
    yTrans[17] = yTrans[16] - 1;
    yTrans[18] = yTrans[17] - .5;
    yTrans[19] = yTrans[18]- 5.5;
    yTrans[20] = yTrans[19] + 10;
    yTrans[21] = yTrans[20] - 10;
    yTrans[22] = yTrans[21] + 10;
  }

   //Method for Tail Wiggle
  void wiggle() {
    for (int i=16; i<nRings; i++) {
      this.zTrans[i] = this.zTrans[i] + tailSpeed[i];
    }
  }

  void wiggleCheck() {
    zTrans[16]=0;
    for (int i=16; i<nRings; i++) {
      if (this.zTrans[i] > 2) tailSpeed[i] = tailSpeed[i] * -1;
      if (this.zTrans[i]< -2) tailSpeed[i] = tailSpeed[i] * -1;
    }
  }
}