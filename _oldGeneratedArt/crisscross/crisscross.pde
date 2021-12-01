

void setup(){
  
  size(1920,1080);
  //background(0);
  noStroke();
  
  frameRate(120);
}

color colo = 0;
int move = 1;
int i=0;
int j=0;
boolean side = true;
boolean top = false;
int pace = 2000;

void draw(){
  //grayScale();
  //randomColor();
  randomColorBounce();
}

int adderi = 1;
int adderj = 1;

void randomColorBounce(){
  if(random(100) < 2 || side){
    side = true;
    if(random(100) < 1) colo = color((int)random(255),(int)random(255),(int)random(255));
    for(int ii=0;ii<pace;ii++){
      println(colo);
    fill(colo);
    rect(j,i,1,1);
    
    i += adderi;
    if(i > width){
      adderi = -1;
      j += adderj;
      if(j > height) adderj = -1;
      if(j < 0) adderj = 1;
    }
    if(i < 0){
      adderi = 1;
    }
  }
  
  }
  if(random(100) < 2 || !side) {
    side = false;
    if(random(100) < 1) colo = color((int)random(255),(int)random(255),(int)random(255));
  for(int ii=0;ii<pace;ii++){
    println(colo);
    fill(colo);
    rect(i,j,1,1);
    
    i += adderi;
    if(i > width){
      adderi = -1;
      j += adderj;
      if(j > height) adderj = -1;
      if(j < 0) adderj = 1;
    }
    if(i < 0){
      adderi = 1;
    }
  }
  }
}

void randomColor(){
  if(random(100) < 2 || side){
    side = true;
    if(random(100) < 1) colo = color((int)random(255),(int)random(255),(int)random(255));
    for(int ii=0;ii<pace;ii++){
      println(colo);
    fill(colo);
    rect(j,i,1,1);
    
    i++;
    if(i == width){
      i = 0;
      j++;
      if(j == height) j = 0;
    }
  }
  
  }
  if(random(100) < 2 || !side) {
    side = false;
    if(random(100) < 1) colo = color((int)random(255),(int)random(255),(int)random(255));
  for(int ii=0;ii<pace;ii++){
    println(colo);
    fill(colo);
    rect(i,j,1,1);
    
    i++;
    if(i == width){
      i = 0;
      j++;
      if(j == height) j = 0;
    }
  }
  }
}

void grayScale(){
  if(random(100) < 2 || side){
    side = true;
    top = false;
    for(int ii=0;ii<1000;ii++){
    if(colo > 254) move = -1;
    if(colo < 1) move = 1;
    colo += move;
    fill(colo,colo,colo);
    rect(j,i,1,1);
    
    i++;
    if(i == width){
      i = 0;
      j++;
      if(j == height) j = 0;
    }
  }
  
  }
  if(random(100) < 2 || top) {
    top = true;
    side = false;
  for(int ii=0;ii<1000;ii++){
    if(colo > 254) move = -1;
    if(colo < 1) move = 1;
    colo += move;
    fill(colo);
    rect(i,j,1,1);
    
    i++;
    if(i == width){
      i = 0;
      j++;
      if(j == height) j = 0;
    }
  }
  }
}
