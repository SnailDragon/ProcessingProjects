
class Cell{
  
  float r, theta;
  PVector location, speed;
  
  Cell(float xpos, float ypos, float rin){
    location = new PVector(xpos, ypos);
    r = rin;
    speed = new PVector(0,0);
  }
  
  void Display(){
    circle(location.x,location.y,r);
  }
  
  void Move(){
    
    speed.add(new PVector(random(-10/r, 10/r),random(-10/r, 10/r)));
    location.add(speed);
    if(location.x > width){
      location.x = width;
      speed.x = -10/r;
    }
    else if(location.x < 0){
      location.x = 0;
      speed.x = 10/r;
    }
    if(location.y > height){
      location.y = height;
      speed.y = -10/r;
    }
    else if(location.y < 0){
      location.y = 0;
      speed.y = -10/r;
    }
  }
  
  PVector GetLocation(){
    return location;
  }
  
  float GetRadius(){
    return r;
  }
  
  void SetRadius(float rin){
    r = rin;
  }
  
  void ResetSpeed(){
    speed = new PVector(r,r);
  }
    
  
  
  
}
