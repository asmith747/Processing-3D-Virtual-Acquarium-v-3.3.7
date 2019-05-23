/* Austin Smith
CSE MWF 11:00 - 11:50
Virtual Aquarium
Artist - Austin Smith

Let the program run for a little to randomize animal positions.

If code runs slow, lower amount of kelp. The movement of all ellipses
comes from the translation of the x, y, and z so there is a lot 
happening every runthrough.
*/

//Import Peasy Cam
import peasy.*;
PeasyCam cam;

//Global Variables
float z;
int t = 0;
float widthDecrease = .25;
float decreaser = .25;
float divider = 3;
float waveX = random(2)-(2);

int check = 0;

//Variables for Sand Terrain
int cols, rows;
int scl = 10;
int w = 510;
int h = 260;
//Terrain Variables
float waves = 0;
float[][] terrain;

//Animal/Kelp Varibales
int nKelp = 60;                              //Number of Kelp
Kelp[] allKelp = new Kelp[nKelp];
int nBubble = 50;                            //Number of Bubbles
Bubble[] allBubbles = new Bubble[nBubble];
int nA = 4;                                  //Number of Yellow Fish
Animals[] allA = new Animals[nA];
int nR = 2;                                  //Number of Big Red Fish
RedFish[] allR = new RedFish[nR];

BlueFish b1;           //Single Blue Fish
JellyFish j1, j2, j3;  //Three JellyFish

//Random Posiitoning for Kelp
float randomX[] = new float[nKelp];
float randomY[] = new float[nKelp];
float randomZ[] = new float[nKelp];


void setup() {
  //noLoop();

  for (int i = 0; i <nKelp-10; i ++) {    //Random x,y,z for Kelp
    randomX[i] = random(250)-random(250);
    randomY[i] = random(15);
    randomZ[i] = random(130)-random(130);
  }
  for (int i = nKelp-10; i <nKelp; i ++) {    //Different Height for Kelp
    randomX[i] = random(250)-random(250);
    randomY[i] = 10 + random(15);
    randomZ[i] = random(130)-random(130);
  }
  //Terrain
  cols = w/ scl;
  rows = h/ scl;
  terrain = new float[cols][rows];

  size(1500, 1500, P3D);
  //Peasy Cam Initial Variables + Max Distance
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(2000);
  rectMode(CENTER);
  textMode(SHAPE);
  ellipseMode(CENTER);
  //Functions for Making all Animals
  makeKelp();
  makeBubbles();
  makeA();
  makeR();
  b1 = new BlueFish();
  j1 = new JellyFish();
  j2 = new JellyFish();
  j3 = new JellyFish();
}

void draw() {  
  //Sand Moving
   waves -= .0005;

  pushMatrix();
  translate(0, 0, 150);      //Push Camera Setting to Certain Angle
  rotateX(169);
  background(125);
  noStroke();
  j1.display();
  j2.display();
  j3.display();
  
  for (int i = 0; i <nKelp; i ++) {    //Drawing Kelp at Random Positions
    pushMatrix();
    translate(randomX[i], randomY[i], randomZ[i]);
    allKelp[i].display();
    popMatrix();
   //Drawing All Animals
  }
  for (int i = 0; i <nBubble; i ++) {
    allBubbles[i].display();
  }
  for (int i =0; i<nA; i++) {
    allA[i].display();
  }
  for (int i =0; i<nA; i++) {
    allA[i].display();
  }
  for (int i =0; i<nR; i++) {
    allR[i].display();
  }
  b1.display();


  pushMatrix();                    //"Virtual Aquarium" Text 
  translate(-210, -250, -85);
  rotateX(195);
  textSize(50);
  fill(255);
  text("Virtual Aquarium", 0, 0, 10);
  popMatrix();

  pushMatrix();                    //Aquarium Top 
  translate(0, -212.5, -67.5);
  fill(206, 112, 34);
  box(510, 25, 125);
  popMatrix();

  pushMatrix();
  translate(0, -212.5, 110);
  box(510, 25, 40);
  popMatrix();

  pushMatrix();
  translate(150, -212.5, 0);
  box(240, 25, 200);
  popMatrix();

  pushMatrix();
  translate(-215, -212.5, 0);
  box(115, 25, 200);
  popMatrix();

  pushMatrix();   
  translate(0, -232.5, -67.5);
  fill(0);
  box(450, 15, 100);
  popMatrix();

  pushMatrix();                    //"Austin Smith" Text
  translate(150, -225.5, 0);
  box(150, 10, 50);
  pushMatrix();
  rotateX(95);
  fill(255);
  textSize(20);
  text("Austin Smith", -60, -5, 7.5);  
  popMatrix();
  popMatrix();

  pushMatrix();                //Sand
  translate(0, 180, 0);
  stroke(1);
  fill(227, 209, 121);
  box(505, 40, 255);
  popMatrix();
  noStroke();

  pushMatrix();                //Blue Outer Base
  translate(0, 160, 130); 
  stroke(1);
  fill(72, 53, 249);
  box(515, 75, 5);
  popMatrix();

  pushMatrix();
  translate(0, 160, -130); 
  stroke(1);
  fill(72, 53, 249);
  box(515, 75, 5);
  popMatrix();

  pushMatrix();
  translate(255, 160, 0); 
  stroke(1);
  fill(72, 53, 249);
  box(5, 75, 265);
  popMatrix();

  pushMatrix();
  translate(-255, 160, 0); 
  stroke(1);
  fill(72, 53, 249);
  box(5, 75, 265);
  popMatrix();

  pushMatrix();
  translate(0, 200, 0); 
  stroke(1);
  fill(72, 53, 249);
  box(515, 5, 265);
  popMatrix();


  stroke(1);                  //Aquarium Main Water (68, 164, 215, 20);  
  noFill();  
  box(505, 400, 255);

  fill(165);   // Background
  sphere(2150);


  //Sand Terrain Thanks to Bennet Cook
  float yoff = waves;
  for (int y = 0; y < rows; y++) 
  {
    float xoff = 0;
    for (int x = 0; x < cols; x++) 
    {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -50, 50);
      xoff += 0.07;
    }
    yoff += 0.07;
  } 
  
  pushMatrix();
  fill(227, 209, 121);
  stroke(0);
  translate(-249, 150, -124);
  rotateX(HALF_PI);
  for (int y = 0; y < rows-1; y++) 
  {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) 
    {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
  popMatrix();



  popMatrix(); //Pop matrix for initial camera angle
}

void makeKelp() {
  for (int i = 0; i <nKelp; i ++) {
    allKelp[i] = new Kelp();
  }
}

//Functions for Making Animals
void makeBubbles() {
  for (int i = 0; i<nBubble; i++) {
    allBubbles[i] = new Bubble();
  }
}

void makeA() {
  for (int i = 0; i<nA; i++) {
    allA[i] = new Animals();
  }
}

void makeR() {
  for (int i = 0; i<nR; i++) {
    allR[i] = new RedFish();
  }
}