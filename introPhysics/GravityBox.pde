
class GravityBox {
  
  float x, y, w, h, weight, angle;
  
  GravityBox(float xIn, float yIn, float wIn, float hIn, float angleIn, float weightIn){
    x = xIn;
    y = yIn;
    w = wIn;
    h = hIn;
    weight = weightIn;
    angle = angleIn;
  }
  
  void update(){
    y += 9.8;
    
    
    if(y > height-h){
      y = height-h;
    }
    else if(y < 0){
      y = 0;
    }
    
    if(x > width-w){
      x = width-w;
    }
    else if(x < 0){
      x = 0;
    }
  }
  
  void display(){
    fill(255);
    rect(x, y, w, h);
  }
  
  
}
