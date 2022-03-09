
class Turtle {
  
  float x,y,weight,theta;
  boolean penDown;
  int colo = #FFFFFF;
  float old_dist, old_turn;
  
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
    old_turn = th;
    theta += th;
  }
  
  void turnLeft(float th){
    old_turn = th;
    theta -= th;
  }
  
  void setWeight(float w){
    weight = w;
  }
  
  void setColor(int col){
    colo = col;
  }
  
  void forward(float d){
    float new_x = x + d * cos(theta);
    float new_y = y + d * sin(theta);
    if(penDown){
      strokeWeight(weight);
      stroke(colo);
      line(x,y,new_x,new_y);
    }
    old_dist = d;
    x = new_x;
    y = new_y;
  }
  
  void lineTo(float xIn, float yIn){
    line(x, y, xIn, yIn);
    x = xIn;
    y = yIn;
  }
  
}
