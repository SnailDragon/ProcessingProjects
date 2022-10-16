
class Dot {
  
  float x,y,r,theta;
  boolean toDelete;
  
  public Dot(float x, float y, float r, float theta){
    this.x = x;
    this.y = y;
    this.r = r;
    this.toDelete = false;
    this.theta = theta;
  }
  
  public void delete(){
    toDelete = true;
  }
  
  public void display(){
    circle(x,y,r);
    if(x > width || x < 0 || y > height || y < 0) toDelete = true;
  }
  
  public float distance(Dot d){
    return dist(this.x, this.y, d.x, d.y);
  }
  
}
