float[][] dots;
int NUM_DOTS = 1000;
float STROKE_WEIGHT = .5;
float DOT_RAD = 1;
float DRIFT = 10;
float CONNECT_DIST = 50;


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
  background(0);
  
  Drift();
  
  for(float[] c : dots){
    fill(255);
    circle(c[0], c[1], DOT_RAD);
  }
  
  for(int i = 0; i < dots.length; i++){
    for(int j = 0; j < dots.length; j++){
      if(Distance(dots[i], dots[j]) < CONNECT_DIST){
        stroke(255);
        strokeWeight(STROKE_WEIGHT);
        line(dots[i][0],dots[i][1], dots[j][0], dots[j][1]);
      }
    }
  }
}

float Distance(float[] pointA, float[] pointB){
  return sqrt(pow(pointA[0] - pointB[0], 2) + pow(pointA[1] - pointB[1], 2));
}

void Drift(){
  for(int i = 0; i < dots.length; ++i){
    dots[i][0] += random(-DRIFT, DRIFT);
    dots[i][1] += random(-DRIFT, DRIFT);
    if(dots[i][0] > width){
      dots[i][0] = width;
    }
    else if(dots[i][0] < 0){
      dots[i][0] = 0;
    }
    if(dots[i][1] > height){
      dots[i][1] = height;
    }
    else if(dots[i][1] < 0){
      dots[i][1] = 0;
    }
  }
}
