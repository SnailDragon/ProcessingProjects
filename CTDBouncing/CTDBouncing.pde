float[][] dots;
int NUM_DOTS = 100;
float STROKE_WEIGHT = 1;
float DOT_RAD = 5;
float DRIFT = 1;
float CONNECT_DIST = 50;
float speed = 5;


void setup(){
  size(960, 540);
  background(0);
  dots = new float[NUM_DOTS][4];
  for(int i = 0; i < dots.length; ++i){
    dots[i][0] = random(width);
    dots[i][1] = random(height);
    dots[i][2] = random(-speed, speed);
    dots[i][3] = random(-speed, speed);
  }
  
  println("Setup Done");
}

void draw(){
  background(0);
  
  
  
  for(float[] c : dots){
    fill(255);
    c[0] += c[2];
    c[1] += c[3];
    if(c[0] > width){
      c[2] *= -1;
      c[0] = width;
    } 
    else if (c[0] < 0){
      c[2] *= -1;
      c[0] = 0;
    }
    if(c[1] > height){
      c[3] *= -1;
      c[1] = height;
    }
    else if (c[1] < 0){
      c[3] *= -1;
      c[1] = 0;
    }
    
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
  println(frameRate);
  frameRate(24);
}

float Distance(float[] pointA, float[] pointB){
  return sqrt(pow(pointA[0] - pointB[0], 2) + pow(pointA[1] - pointB[1], 2));
}
