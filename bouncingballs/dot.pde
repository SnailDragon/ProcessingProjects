
class Dot {
  
  float x, y, r;
  float xSpeed = random(-1, 1);
  float ySpeed = random(-1, 1);
  
  Dot(float xIn, float yIn, float rIn){
    x = xIn;
    y = yIn;
    r = rIn;
  }
  
  void update(Dot[] dots){
    boolean hasSpace = true;
    
    for(Dot d : dots){
      if(dist(x,y,d.x,d.y) < (r*2)){
        
      }
    }
    
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
