
class Star{
  
  float r;
  float theta;
  float speed;
  float x1, y1, x2, y2;
  float len = 0.1;
  float col, weight;
  
  Star(float rin, float thetaIn, float speedIn){
    theta = thetaIn;
    r = rin;
    speed = speedIn;
    col = random(100, 200);
    weight = random(1,5);
    len = random(0.05, 0.15);
  }
  
  void Update(){
    theta += speed;
    x1 = r * cos(theta);
    y1 = r * sin(theta);
    x2 = r * cos(theta - len);
    y2 = r * sin(theta - len);
  }
  
  float GetTheta(){
    return theta;
  }
  
  void SetRadius(float rin){
    r = rin;
  }
  
  void Display(){
    stroke(col);
    strokeWeight(weight);
    line(x1,y1,x2,y2);
  }
  
  void ReRandomize(){
    col = random(100, 200);
    weight = random(1,5);
    r = random(100, width);
    speed = random(0.01,0.04);
    len = random(0.05, 0.15);
  }
  
  
  
  
  
}
