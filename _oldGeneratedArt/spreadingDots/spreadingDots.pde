int len = 10;
int pipeNum = 10000;
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
  
  //frameRate(60);
}

boolean turn = false;

int it = 0;
void draw(){
  background(0);
  nextPipe();
  display();
  println(frameRate);
}

void nextPipe(){
  for(int i=0; i<x.length-1; i++){
    x[i] = x[i+1];
    y[i] = y[i+1];
  }
  
  int addon = (int)random(-len,len);
  if(addon < min && addon > 0) addon = 10;
  else if(addon > -min && addon < 0) addon = -10;
  if(turn){
    x[x.length-1] += addon;
    turn = !turn;
  }
  else{
  y[y.length-1] += addon;
    turn = !turn;
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
