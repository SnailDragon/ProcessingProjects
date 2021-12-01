int len = 150;

void setup(){
  size(960,540);
  background(0);
  stroke(0);
  strokeWeight(5);
  fill(255);
  
  frameRate(10);
}

int x1 = 450;
int y1 = 250;
int x2 = x1;
int y2 = y1;
boolean turn = true;
int fil = 255;

int it = 0;
void draw(){
  //if(turn){
  //  x2 = (int)random(len)+5;
  //  y2 = 0;
  //  turn = !turn;
  //}
  //else {
  //  y2 = (int)random(len)+5;
  //  x2 = 0;
  //  turn = !turn;
  //}
  if(turn){
    x2 += (int)random(-len,len);
    turn = !turn;
  }
  else{
    y2 += (int)random(-len,len);
    turn = !turn;
  }
  
  
  if(x2 > width) x2 = width-2;
  if(y2 > height) y2 = height-2;
  if(x2 < 0) x2 = 2;
  if(y2 < 0) y2 = 2;
  
  stroke(fil);
  print(fil + "\t");
  //if(it % 500 == 0) fil = (int)random(255);
  line(x1,y1,x2,y2);
  print(x1 + "\t" + y1 + "\t" + x2 + "\t" + y2 + "\t");
  x1 = x2;
  y1 = y2;

  it++;
  println(it);
}
