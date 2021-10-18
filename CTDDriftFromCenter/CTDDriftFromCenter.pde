float[][] dots;
int NUM_DOTS = 150;
float STROKE_WEIGHT = .5;
float DOT_RAD = 5;
float DRIFT = 1;
float CONNECT_DIST = 100; //70
int BORDER = 10;
float START_BOX = 40;


void setup(){
  size(960, 540);
  background(0);
  dots = new float[NUM_DOTS][2];
  for(int i = 0; i < dots.length; ++i){
    dots[i][0] = random(width); //random(width / 2 - START_BOX, width / 2 + START_BOX); 
    dots[i][1] = random(height); //random(height / 2 - START_BOX, height / 2 + START_BOX); 
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
  frameRate(24);
}

float Distance(float[] pointA, float[] pointB){
  return sqrt(pow(pointA[0] - pointB[0], 2) + pow(pointA[1] - pointB[1], 2));
}

void DriftOutCenter(){
  for(int i = 0; i < dots.length; ++i){
    float vectorx = dots[i][0] - width/2;
    float vectory = dots[i][1] - height/2;
    float unitVectorX = vectorx / sqrt(pow(vectorx, 2) + pow(vectory, 2));
    float unitVectorY = vectory / sqrt(pow(vectorx, 2) + pow(vectory, 2));
    float xdrift = unitVectorX * DRIFT + vectorx/30;
    float ydrift = unitVectorY * DRIFT + vectory/30;
    
    dots[i][0] += xdrift/2; //random(xdrift); // vectorx / 30 
    dots[i][1] += ydrift/2; //random(ydrift);   
    
    if(dots[i][0] > width-BORDER){
      dots[i][0] = width-BORDER;
    }
    else if(dots[i][0] < BORDER){
      dots[i][0] = BORDER;
    }
    if(dots[i][1] > height-BORDER){
      dots[i][1] = height-BORDER;
    }
    else if(dots[i][1] < BORDER){
      dots[i][1] = BORDER;
    }
  }
}

void RecycleDots(){
  for(int i = 0; i < dots.length; i++){
    //if((dots[i][0] == BORDER && dots[i][1] == BORDER) || 
    // (dots[i][0] == BORDER && dots[i][1] == height-BORDER) || 
    // (dots[i][0] == width-BORDER && dots[i][1] == BORDER) || 
    // (dots[i][0] == width-BORDER && dots[i][1] == height-BORDER)){
    //  dots[i][0] = width/2 + random(-START_BOX, START_BOX);
    //  dots[i][1] = height/2 + random(-START_BOX, START_BOX);
    //  println("Recycled");
    //  //println(dots[i][0] + " " + dots[i][1]);
    //}
    
    if(dots[i][0] == width-BORDER){
      dots[i][0] = width/2 + random(-START_BOX, START_BOX);
      dots[i][1] = height/2 + random(-START_BOX, START_BOX);
    }
    else if(dots[i][0] == BORDER){
      dots[i][0] = width/2 + random(-START_BOX, START_BOX);
      dots[i][1] = height/2 + random(-START_BOX, START_BOX);
    }
    if(dots[i][1] == height-BORDER){
      dots[i][0] = width/2 + random(-START_BOX, START_BOX);
      dots[i][1] = height/2 + random(-START_BOX, START_BOX);
    }
    else if(dots[i][1] == BORDER){
      dots[i][0] = width/2 + random(-START_BOX, START_BOX);
      dots[i][1] = height/2 + random(-START_BOX, START_BOX);
    }
  }
}
