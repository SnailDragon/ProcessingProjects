
void setup(){
  size(860,540);
  background(0);
  stroke(0);
  
}

float theta = 0;

void draw(){
  println(frameRate);
  background(0);
  
  float[] circle1 = orbitPoint(width/2, height/2, 100, 50, .1);
  float[] circle2 = orbitPoint(circle1[0], circle1[1], 100, 20, .5);
  float[] circle3 = orbitPoint(circle2[0], circle2[1], 40, 20, 1);

  
  
  theta += .1;
  
}

float[] orbitPoint(float xIn, float yIn, float rIn, float size, float speedMod){
  translate(xIn, yIn);
  float r = rIn;
  float x = r * sin(theta*speedMod);
  float y = r * cos(theta*speedMod);
  circle(x,y,size);
  float[] newCoors = {x,y};
  return newCoors;
}
