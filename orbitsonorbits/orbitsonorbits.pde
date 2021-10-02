boolean useTrace = false;
int numOrbits = 4;

void setup(){
  size(860,540);
  background(0);
  stroke(0);
  fill(255);
}

float theta = 0;

void draw(){
  println(frameRate);
  background(0);
  
  //float[] circle1 = OrbitPoint(width/2, height/2, 150, 50, .1, useTrace);
  //float[] circle2 = OrbitPoint(circle1[0], circle1[1], 100, 20, .5, useTrace);
  //float[] circle3 = OrbitPoint(circle2[0], circle2[1], 40, 20, 1, useTrace);
  float[] tempStoreCoors = {width/2,height/2};
  //OrbitPoint(tempStoreCoors[0], tempStoreCoors[1], 0, 100, 0, useTrace);
  for(float i=0; i<numOrbits; i++){
    tempStoreCoors = OrbitPoint(tempStoreCoors[0], tempStoreCoors[1], 50, 20, i*.1, useTrace);
    
  }



  
  
  theta += .1;
  
}

float[] OrbitPoint(float xIn, float yIn, float rIn, float size, float speedMod, boolean traced){
  translate(xIn, yIn);
  float r = rIn;
  float x = r * sin(theta*speedMod);
  float y = r * cos(theta*speedMod);
  if(traced){
    noFill();
    stroke(255);
    arc(0,0,rIn*2,rIn*2,0,2*PI);
  }
  
  fill(255);
  stroke(0);
  circle(x,y,size);
  
  float[] newCoors = {x,y};
  return newCoors;
}
