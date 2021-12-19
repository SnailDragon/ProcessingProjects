
class Dot {
  
  float x, y, r;
  float xSpeed;
  float ySpeed;
  
  Dot(float xIn, float yIn, float rIn){
    x = xIn;
    y = yIn;
    r = rIn;
    
    xSpeed = (int)random(-2,2);
    ySpeed = (int)random(-2,2);
    if(xSpeed == 0) xSpeed = 1;
    if(ySpeed == 0) ySpeed = 1;
  }
  
  void update(Dot[] dots){
    boolean hasSpace = true;
    
    
    if(hasSpace){
      x += xSpeed;
      y += ySpeed;
    }
    
    if(x > width-r){
      x = width-r;
      xSpeed *= -1;
    }
    else if (x < r){
      x = r;
      xSpeed *= -1;
    }
    
    if(y > height-r){
      y = height-r;
      ySpeed *= -1;
    }
    else if (y < r){
      y = r;
      ySpeed *= -1;
    }
  }
  
  void display(){
    circle(x,y,r);
  }
  
}
