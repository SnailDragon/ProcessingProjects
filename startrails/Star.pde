
class Star{
  
  float r;
  float theta;
  float speed;
  float x1, y1, x2, y2;
  
  Star(float rin, float thetaIn, float speedIn){
    theta = thetaIn;
    r = rin;
    speed = speedIn;
  }
  
  void Update(){
    theta += speed;
    println(theta);
    x1 = r * cos(theta);
    y1 = r * sin(theta);
    x2 = r * cos(theta - 0.01);
    y2 = r * sin(theta - 0.01);
  }
  
  float GetTheta(){
    return theta;
  }
  
  void SetRadius(float rin){
    r = rin;
  }
  
  void Display(){
    stroke(255);
    strokeWeight(3);
    translate(width, height);
    line(x1,y1,x2,y2);
  }
  
  
  
  
  
}
