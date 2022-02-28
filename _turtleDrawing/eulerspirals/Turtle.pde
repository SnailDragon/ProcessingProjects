
class Turtle {
  
  float x,y,weight,theta;
  boolean penDown;
  int colo = #FFFFFF;
  
  Turtle(float xIn, float yIn, float weightIn){
    x = xIn;
    y = yIn;
    weight = weightIn;
    theta = 0;
    penDown = true;
  }
  
  void display(){
    circle(x,y,20);
  }
  
  void turnRight(float th){
    theta += th;
  }
  
  void turnLeft(float th){
    theta -= th;
  }
  
  void forward(float d){
    float new_x = x + d * cos(theta);
    float new_y = y + d * sin(theta);
    if(penDown){
      strokeWeight(weight);
      stroke(colo);
      line(x,y,new_x,new_y);
    }
    x = new_x;
    y = new_y;
  }
  
  
  
  
  
}
