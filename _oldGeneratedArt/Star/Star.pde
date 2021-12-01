void setup(){
  size(500,500);
  background(255);
  
  drawGram(19,300);
}

float bearing = 0;

//total degrees in a star is 180
void draw(){
  
}

void drawGram(float points, int len){
  float[] coors = new float[2];
  translate(width/2+150,height/2);
  for(int i=0; i<points; i++){
     coors = lineAngle(0,0,180-(180/points),len);
     translate(coors[0],coors[1]);
  }
}

float[] lineAngle(float x, float y, float angle, float len){
  angle = radians(angle)+bearing;
  bearing = angle;
  float endX = x+len * cos(angle);
  float endY = y-len * sin(angle);
  line(x,y,endX,endY);
  float[] re = {endX, endY};
  return re;
}
