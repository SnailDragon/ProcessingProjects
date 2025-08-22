
class Line implements Comparable<Line> {
  
  public double m, x1, y1;
  public Boolean only_x; 
  public double x_min, x_max; 
  public double len; 
  
  public Node n1, n2; 
  
  Line(Node n1, Node n2){
    this.n1 = n1;
    this.n2 = n2; 
    this.len = Math.sqrt(Math.pow((n1.x - n2.x), 2) + Math.pow((n1.y - n2.y), 2)); 
    
    if(n1.x == n2.x){
      this.only_x = true; 
      this.x1 = n1.x;
      return; 
    }
    this.only_x = false; 
    this.m = (n1.y - n2.y) / (n1.x - n2.x); 
    if(n1.x < n2.x){
      this.x_min = n1.x; 
      this.x_max = n2.x; 
      this.x1 = n1.x; 
      this.y1 = n1.y; 
    } 
    else {
      this.x_min = n2.x; 
      this.x_max = n1.x;
      this.x1 = n2.x; 
      this.y1 = n2.y; 
    }
  }
  
  boolean hasPoint(Node n){
    if(this.only_x) return n.x == this.x1; 
    return n.y - this.y1 == this.m * (n.x - this.x1); 
  }
  
  boolean crosses(Line other){
    if(other.m == this.m && this.hasPoint(other.n1)) return true; 
    
    double c = this.y1 - this.m * this.x1;
    double d = other.y1 - other.m * other.x1; 
    System.out.println(c + " " + d); 
    
    double y = c + (d - c) * ((this.m) / (-other.m - this.m)); 
    double x = (d - c) / (-other.m - this.m); 
    
   System.out.println("cross at " + x + "," + y);    
    
    return (x <= this.x_max && x >= this.x_min);
  }
  
  public int compareTo(Line other) {
    return Double.compare(other.len, this.len); 
  }
  
  public String toString(){
    return "Line: [" + this.n1.toString() + "|" + this.n2.toString() + "]"; 
  }
}
