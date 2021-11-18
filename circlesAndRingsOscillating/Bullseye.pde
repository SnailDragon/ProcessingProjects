
class Bullseye {
  
  float x, y, rw;
  float numRings;
  float change = 1;
  
  Bullseye(float xIn, float yIn, float rwIn){
    x = xIn;
    y = yIn;
    rw = rwIn;
    numRings = 0.5;
  }
  
  void AddRing(){
    numRings++;
  }
  
  void SetChange(float c){
    change = c;
  }
  
  void ChangeRing(){
    numRings += change;
  }
  
  float GetX(){
    return x;
  }
  
  float GetY(){
    return y;
  }
  
  float GetRadius(){
    return numRings * rw;
  }
  
  float GetNumRings(){
    return numRings;
  }
  
  void RemoveRing(){
    numRings--;
  }
  
  void Display(){
    noStroke();
    for(float i = numRings; i > 0; i--){
      fill(255);
      circle(x,y,(2*rw)*i);
      fill(0);
      circle(x,y,(2*rw*i) - rw);
    }
  }
  
}
