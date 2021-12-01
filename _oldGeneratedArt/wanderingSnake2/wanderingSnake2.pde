int len = 3;
int segs = 50;
int radius = 20;
int speedFactor = 2;

int[] x = new int[segs];
int[] y = new int[segs];

void setup(){
  size(960,540);
  background(0);
  fill(255);
  stroke(150);
  
  for(int i=0; i<x.length; i++){
     x[i] = width/2;
     y[i] = height/2;
  }
  
  frameRate(24);
  
}

void draw(){
  background(0);
  for(int i=0; i<speedFactor; i++){
    nextSeg();
  }
  display();
 
  println(frameRate);
}


float lastDirectionAngle = 0;
//add new to first index overwrite last index
void nextSeg(){
  
  for(int i=x.length-1; i>0; i--){
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  
  float directionAngle = random(lastDirectionAngle-PI/6,lastDirectionAngle+PI/6);
  lastDirectionAngle = directionAngle;
  
  x[0] += len * cos(directionAngle);
  y[0] += len * sin(directionAngle);
  
  
  if(x[0] > width) x[0] = width-2;
  else if(x[0] < 0) x[0] = 2;
  if(y[0] > height) y[0] = height-2;
  else if(y[0] < 0) y[0] = 2;
  
  //print("\t\t" + x[0] + ", " + y[0]);

}

void display(){
  for(int i=x.length-1; i>=0; i--){
    circle(x[i],y[i],radius);
  }
}

void printList(int[] lis){
  print("[");
  for(int elem : lis){
    print(elem + ", ");
  }
  print("]");
}
