float[][] dots;
int NUM_DOTS = 100;
float STROKE_WEIGHT = .5;
float DOT_RAD = 5;
float DRIFT = 1;
float CONNECT_DIST = 70;
int border = 10;
float startBox = 40;


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
  
  DriftOutCenter();
  RecycleDots();
  
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
  println(frameRate);
}

float Distance(float[] pointA, float[] pointB){
  return sqrt(pow(pointA[0] - pointB[0], 2) + pow(pointA[1] - pointB[1], 2));
}

void DriftOutCenter(){
  for(int i = 0; i < dots.length; ++i){
    float vectorx = dots[i][0] - width/2;
    float vectory = dots[i][1] - height/2;
    
    dots[i][0] += random(vectorx / 30);
    dots[i][1] += random(vectory / 30);   
    
    if(dots[i][0] > width-border){
      dots[i][0] = width-border;
    }
    else if(dots[i][0] < border){
      dots[i][0] = border;
    }
    if(dots[i][1] > height-border){
      dots[i][1] = height-border;
    }
    else if(dots[i][1] < border){
      dots[i][1] = border;
    }
  }
}

void RecycleDots(){
  for(int i = 0; i < dots.length; i++){
    //if((dots[i][0] == border && dots[i][1] == border) || 
    // (dots[i][0] == border && dots[i][1] == height-border) || 
    // (dots[i][0] == width-border && dots[i][1] == border) || 
    // (dots[i][0] == width-border && dots[i][1] == height-border)){
    //  dots[i][0] = width/2 + random(-startBox, startBox);
    //  dots[i][1] = height/2 + random(-startBox, startBox);
    //  println("Recycled");
    //  //println(dots[i][0] + " " + dots[i][1]);
    //}
    
    if(dots[i][0] == width-border){
      dots[i][0] = width/2 + random(-startBox, startBox);
      dots[i][1] = height/2 + random(-startBox, startBox);
    }
    else if(dots[i][0] == border){
      dots[i][0] = width/2 + random(-startBox, startBox);
      dots[i][1] = height/2 + random(-startBox, startBox);
    }
    if(dots[i][1] == height-border){
      dots[i][0] = width/2 + random(-startBox, startBox);
      dots[i][1] = height/2 + random(-startBox, startBox);
    }
    else if(dots[i][1] == border){
      dots[i][0] = width/2 + random(-startBox, startBox);
      dots[i][1] = height/2 + random(-startBox, startBox);
    }
  }
}
