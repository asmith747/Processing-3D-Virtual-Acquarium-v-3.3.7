class BlueFish extends Animals{   //Takes all Methods/Constructors but changes Color 
  
    color cB;
    color cTailB;
  
  BlueFish(){
    super();
    this.cB = color(81, 215, 230);
    this.cTailB = color(50, 46, 235);
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
      stroke(this.cB);
      pushMatrix();
      translate(xTrans[i], yTrans[i], zTrans[i]);
      rotateY(HALF_PI);
      ellipse(this.xPosit, this.yPosit, this.high[i], this.wide[i]);
      popMatrix();
    }

    for (int i=16; i<nRings; i++) {
      pushMatrix();
      translate(xTrans[i], yTrans[i], zTrans[i]);
      stroke(this.cTailB);
      rotateY(HALF_PI);
      ellipse(this.xPosit, this.yPosit, this.high[i], this.wide[i]);
      popMatrix();
    }


    pushMatrix();
    fill(cTail);

    translate(this.x1, this.y1, this.z1);
    stroke(this.cTailB);
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

    super.updatePosition();
    super.wiggle();
    super.wiggleCheck();

  }
}