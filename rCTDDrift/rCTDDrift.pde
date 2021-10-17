float[][] dots;
int NUM_DOTS = 1000;
float STROKE_WEIGHT = .5;
float DOT_RAD = 1;
float DRIFT = 1;
float CONNECT_DIST = 40;


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
  
  //Drift();
  //DriftToCorner();
  //MiddleLine();
  //DriftToSide();
  DriftOutCenter();
  
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

void DriftOutCenter(){
  for(int i = 0; i < dots.length; ++i){
    float vectorx = dots[i][0] - width/2;
    float vectory = dots[i][1] - height/2;
    
    dots[i][0] += random(vectorx / 30);
    dots[i][1] += random(vectory / 30);   
    
    int border = 10;
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

void DriftToSide(){
  for(int i = 0; i < dots.length; ++i){
    switch (ClosestSide(dots[i])){
      case 0: 
        dots[i][0] += -random(DRIFT);
        break;
      case 1:
        dots[i][1] += -random(DRIFT);
        break;
      case 2: 
        dots[i][0] += random(DRIFT);
        break;
      case 3: 
        dots[i][1] += random(DRIFT);
        break;
      default:
         dots[i][0] += random(-DRIFT, DRIFT);
         dots[i][1] += random(-DRIFT, DRIFT);  
    }

    
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

int ClosestSide(float[] coors){
  float[] distanceFromSides = {coors[0], coors[1], width-coors[0], height-coors[1]};
  float min = distanceFromSides[0];
  int minIndex = 0;
  for(int i = 0; i < distanceFromSides.length; i++){
    if(distanceFromSides[i] < min){
      min = distanceFromSides[i];
      minIndex = i;
    }
  }
  return minIndex;
}

//by accident
void MiddleLine(){
  for(int i = 0; i < dots.length; ++i){
    switch (CenterLine(dots[i])){
      case 0: 
        dots[i][0] += -random(DRIFT);
        break;
      case 1:
        dots[i][1] += -random(DRIFT);
        break;
      case 2: 
        dots[i][0] += random(DRIFT);
        break;
      case 3: 
        dots[i][1] += random(DRIFT);
        break;
      default:
         dots[i][0] += random(-DRIFT, DRIFT);
         dots[i][1] += random(-DRIFT, DRIFT);  
    }

    
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

int CenterLine(float[] coors){
  float[] distanceFromSides = {coors[0], coors[1], width-coors[0], height-coors[1]};
  float max = distanceFromSides[0];
  int maxIndex = 0;
  for(int i = 0; i < distanceFromSides.length; i++){
    if(distanceFromSides[i] > max){
      max = distanceFromSides[i];
      maxIndex = i;
    }
    
  }
 
  return maxIndex;
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

void DriftToCorner(){
  for(int i = 0; i < dots.length; ++i){
    dots[i][0] += ChooseSide(dots[i][0], 'x') * random(DRIFT);
    dots[i][1] += ChooseSide(dots[i][1], 'y') * random(DRIFT);
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

int ChooseSide(float coor, char whichCoor){
  if(whichCoor == 'x'){
    if(coor < width/2) return -1;
    else return 1;
  }
  if(whichCoor == 'y'){
    if(coor < height/2) return -1;
    else return 1;
  }
  return 0;
  
}
