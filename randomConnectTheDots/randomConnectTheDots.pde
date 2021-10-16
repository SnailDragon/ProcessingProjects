float[][] dots;
int NUM_DOTS = 1000;
float STROKE_WEIGHT = .5;
float DOT_RAD = 1;


void setup(){
  size(960, 540);
  background(0);
  dots = new float[NUM_DOTS][2];
  for(int i = 0; i < dots.length; ++i){
    dots[i][0] = random(width);
    dots[i][1] = random(height);
  }
  
  for(float[] c : dots){
    fill(255);
    circle(c[0], c[1], DOT_RAD);
  }
  
  for(int i = 0; i < dots.length; i++){
    for(int j = 0; j < dots.length; j++){
      if(Distance(dots[i], dots[j]) < 50){
        stroke(255);
        strokeWeight(STROKE_WEIGHT);
        line(dots[i][0],dots[i][1], dots[j][0], dots[j][1]);
      }
    }
  }
  println("Setup Done");
}

void draw(){
  if(mousePressed){
    setup();
  }
}

float Distance(float[] pointA, float[] pointB){
  return sqrt(pow(pointA[0] - pointB[0], 2) + pow(pointA[1] - pointB[1], 2));
}
