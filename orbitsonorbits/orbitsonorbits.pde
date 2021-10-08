boolean useTrace = false;
int numOrbits = 4;
float[][] layerOffsets;
int maxOffsets;

void setup(){
  size(1920,1080);
  background(0);
  stroke(0);
  fill(255);
  //layerOffsets = new float[numOrbits][maxOffsets];
  //for(int i=0; i<numOrbits; i++){
  //  int layers = (int)random(maxOffsets);
  //  for(int j=0; j<layers; j++){
  //    layerOffsets[i][j] = random(2*PI);
  //    if(layerOffsets[i][j] < ((2*PI)/ (layers+1))){
  //      layerOffsets[i][j] = (2*PI) / (layers+1);
  //    }
  //  }
  //}
}

float theta = 0;

void draw(){
  println(frameRate);
  background(0);
  
  float[] circle0 = OrbitPoint(width/2, height/2,        0,   1, .1, 0, useTrace);
  float[] circle1 = OrbitPointSpecial(circle0[0], circle0[1],   300, 50, .1, 0, useTrace);
  float[] circle2 = OrbitPoint(circle1[0], circle1[1],   150, 20, .5, 0, useTrace);
  float[] circle3 = OrbitPoint(circle2[0], circle2[1],   100, 20, .9, 0, useTrace);
  float[] circle4 = OrbitPoint(circle3[0], circle3[1],   75,  20, .7, 0, useTrace);
  float[] circle5 = OrbitPoint(circle4[0], circle4[1],   50,  20, .8, 0, useTrace);
  float[] circle6 = OrbitPoint(circle5[0], circle5[1],   25,  20, .9, 0, useTrace);

  
  //float[] tempCoors = {width/2, height/2};
  //for(int i=numOrbits; i>=0; i--){
  //  if(numOrbits == i){
  //    tempCoors = OrbitPoint(tempCoors[0], tempCoors[1], 0, 50-(numOrbits-i), .1+.1*(numOrbits-i), 0, useTrace); 
  //    continue;
  //  }
  //  float radius = (150-(numOrbits-i)*34);
  //  tempCoors = OrbitPoint(tempCoors[0], tempCoors[1], radius, radius/3, .1+.1*(numOrbits-i), 90, useTrace); 
      
  //}
  
  theta += .1;
  
}

float[] OrbitPointSpecial(float xIn, float yIn, float rIn, float size, float speedMod, float offset, boolean traced){
  translate(xIn, yIn);
  float r = rIn * cos(.5 * theta);
  float x = r * sin((theta*speedMod)+offset);
  float y = r * cos((theta*speedMod)+offset);
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

float[] OrbitPoint(float xIn, float yIn, float rIn, float size, float speedMod, float offset, boolean traced){
  translate(xIn, yIn);
  float r = rIn;
  float x = r * sin((theta*speedMod)+offset);
  float y = r * cos((theta*speedMod)+offset);
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
