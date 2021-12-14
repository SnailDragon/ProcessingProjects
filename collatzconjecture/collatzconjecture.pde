
int NUM_POINTS = 50;
float[][] points = new float[NUM_POINTS][2];

void setup(){
  size(960,580);
  background(0);
  stroke(255);
  strokeWeight(5);
  
  points[0][0] = 0;
  points[0][1] = 40;
  for(int i = 1; i < points.length; i++){
    points[i][0] = i;
    if(points[i-1][1] % 2 == 0){
      points[i][1] = points[i-1][1] / 2;
    }
    else {
      points[i][1] = points[i-1][1] * 3 + 1;
    }
  }
  
  float[] max = GetMax(points);
  for(int i = 0; i < points.length; i++){
    points[i][0] = map(points[i][0], 0, max[0], 0, width);
    points[i][1] = height - map(points[i][1], 0, max[1], 0, height);
  }
  
  
  
}


float x = 0;
float y = 0;
int it = 0;
float slope = (points[0][1] - points[1][1]) / (points[0][0] - points[1][0]);
void draw(){
  
  fill(255);
  
  if( abs(x - points[it][0]) < 1){
    println(it);
    circle(points[it][0], points[it][1], 10);
    slope = (points[it][1] - points[it+1][1]) / (points[it][0] - points[it+1][0]);
    it++;
  }
  else{
    println(y+slope);
    circle(x,y+slope,5);
  }
  x++;
  
  for(int i = 0; i < points.length; i++){
    fill(#FF0000);
    circle(points[i][0], points[i][1], 10);
  }
  
  frameRate(24);
}

float[] GetMax(float[][] p){
  float maxX = p[0][0];
  float maxY = p[0][0];
  for(int i = 0; i < p.length; i++){
    if(p[i][0] > maxX) maxX = p[i][0];
    if(p[i][1] > maxY) maxY = p[i][1];
  }
  float[] maxes = {maxX, maxY};
  return maxes;
}
