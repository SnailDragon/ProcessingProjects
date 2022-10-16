float DOT_RAD = 1;

class DotCircle {
  
  float x, y, r;
  ArrayList<Dot> dots;
  
  public DotCircle(float x, float y, float r, int numDots){
    this.x = x;
    this.y = y;
    this.r = r;
    
    dots = new ArrayList<Dot>();
    for(float i = 0; i <= 2*PI; i += (2*PI)/numDots){
      dots.add(new Dot(this.x + this.r * cos(i), this.y + this.r * sin(i), DOT_RAD, i));
    }
  }
  
  public void incRadius(float inc){
    for(int i = 0; i < dots.size(); i++){
      dots.get(i).x = dots.get(i).x + inc * cos(dots.get(i).theta);
      dots.get(i).y = dots.get(i).y + inc * sin(dots.get(i).theta);
    }
  }
  
  public void display(){
    for(Dot d : dots){
      d.display();
    }
  }
  
  public void pickDeaths(float thresh, ArrayList<DotCircle> circs){
    for(DotCircle dc : circs){
      if(dc == this) continue;
      for(Dot myD : dots){
        for(Dot theirD : dc.dots){
          if(myD.distance(theirD) <= thresh){
            myD.delete();
            theirD.delete();
          }
        }
      }
    }
  }
  
  public void killDots(){
    for(int i = 0; i < dots.size(); i++){
      if(dots.get(i).toDelete){
        dots.remove(i);
        i--;
      }
    }
  }
  
}
