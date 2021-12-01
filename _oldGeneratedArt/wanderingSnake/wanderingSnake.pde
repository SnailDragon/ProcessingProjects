int len = 5;
int pipeNum = 100;
int[] x = new int[pipeNum];
int[] y = new int[pipeNum];
int min = 20;

void setup(){
  size(960,540);
  background(0);
  stroke(255);
  strokeWeight(10);
  strokeCap(ROUND);
  
  for(int i=0; i<x.length; i++){
    x[i] = 490;
    y[i] = 270;
  }
  
  frameRate(10);
}

boolean turn = false;

int it = 0;
void draw(){
  background(0);
  nextPipe();
  display();
  println();
}

void nextPipe(){
  
  int oldx = x[x.length-1];
  int oldy = y[y.length-1];

  
  for(int i=0; i<x.length-1; i++){
    x[i] = x[i+1];
    y[i] = y[i+1];
  }
  
  int addonx = (int)random(-len,len);
  if(addonx < min && addonx > 0) addonx = min;
  else if(addonx > -min && addonx < 0) addonx = -min;
  
  int addony = (int)random(-len,len);
  if(addony < min && addony > 0) addony = min;
  else if(addony > -min && addony < 0) addony = -min;
  
  x[x.length-1] += addonx;
  y[y.length-1] += addony;
  
  float segementOneTwo = dist(x[x.length-1],y[y.length-1],x[x.length-2],y[y.length-2]);
  float segementOneThree = dist(x[x.length-1],y[y.length-1],x[x.length-3],y[y.length-3]);
  
  print(segementOneTwo + " | " + segementOneThree);
  
  if(segementOneTwo > segementOneThree){
      x[x.length-1] = oldx;
      y[y.length-1] = oldy;
      print("\t worked"); 
  }
  
  if(x[x.length-1] > width) x[x.length-1] = width-2;
  if(y[y.length-1] > height) y[y.length-1] = height-2;
  if(x[x.length-1] < 0) x[x.length-1] = 2;
  if(y[y.length-1] < 0) y[y.length-1] = 2;


}

void display(){
  for(int i=0; i<x.length-1; i++){
    line(x[i],y[i],x[i+1],y[i+1]);
  }
}
