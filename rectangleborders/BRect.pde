
class BRect{
  
  float x, y, w, h;
  float numRings;
  
  BRect(float xIn, float yIn, float wIn, float hIn){
    x = xIn;
    y = yIn;
    w = wIn;
    h = hIn;
    numRings = 0.5;
  }
  
  void AddRing(){
    numRings++;
  }
  
  float GetX(){
    return x;
  }
  
  float GetY(){
    return y;
  }
  
  float XDist(){
    return (w * numRings);
  }
  
  float YDist(){
    return (h * numRings);
  }
  
  float GetNumRings(){
    return numRings;
  }
  
  float GetWidth(){
    return w;
  }
  
  float GetHeight(){
    return h;
  }
  
  void RemoveRing(){
    numRings--;
  }
  
  void Display(){
    noStroke();
    rectMode(CENTER);
    for(float i = numRings; i > 0; i--){
      fill(255);
      rect(x,y, 2*w*i, 2*h*i);
      fill(0);
      rect(x,y, 2*w*i - w, 2*h*i - h);
    }
  }
  
  
  
}
