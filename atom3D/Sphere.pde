
class Sphere {
  public float x, y, z, r;
  public color col; 
  
  public Sphere(int x, int y, int z, int r){
    this.x = x;
    this.y = y;
    this.z = z;
    this.r = r; 
  }
  
  public Sphere(){
    this.x = 0;
    this.y = 0;
    this.z = 0;
    this.r = 0; 
  }
  
  public Sphere(int r){
    this.r = r;
  }
  
  public void display(){
    fill(col); 
    lights(); 
    translate(width/2 + x, height/2 + y, -width/2 + z);
    sphere(r);
    translate(-(width/2 + x), -(height/2 + y), -(-width/2 + z)); 
  }
  
}
