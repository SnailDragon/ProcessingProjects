
class Line implements Comparable<Line> {
  
  public double m, b; 
  public double x_min, x_max, y_min, y_max; 
  public double len; 
  
  public Node n1, n2; 
  
  Line(Node n1, Node n2){
    this.n1 = n1;
    this.n2 = n2; 
    this.len = Math.sqrt(Math.pow((n1.x - n2.x), 2) + Math.pow((n1.y - n2.y), 2)); 
    
    this.m = ((double)(n1.y - n2.y)) / (n1.x - n2.x); 
    this.b = n1.y - this.m * n1.x; 
    
    this.x_max = Math.max(n1.x, n2.x); 
    this.x_min = Math.min(n1.x, n2.x); 
    this.y_min = Math.min(n1.y, n2.y); 
    this.y_max = Math.max(n1.y, n2.y); 
  }
  
  boolean hasPoint(Node n){
    if(this.inBoundsX(n.x) || this.inBoundsY(n.y)){
      return n.y == this.m * n.x + this.b; 
    } else {
      return false; 
    }
  }
  
  boolean crosses(Line other){
    if(this.m == other.m){ 
      System.out.println("parallel"); 
      if(this.b != other.b) return false; 
      else return this.overlaps(other); 
    }
    
    double x = (other.b - this.b) / (this.m - other.m); 
    System.out.println("\tx = " + x); 
    //double y = this.m * x + this.b; 
    
    return this.inBoundsX(x) && other.inBoundsX(x); 
  }
  
  public boolean overlaps(Line other){
    return this.x_min <= other.x_max &&
               this.x_max >= other.x_min &&
               this.y_min <= other.y_max &&
               this.y_max >= other.y_min;
  }
  
  public boolean inBoundsX(double x_test){
    return x_test <= this.x_max && x_test >= this.x_min; 
  }
  
  public boolean inBoundsY(double y_test){
    return y_test <= this.y_max && y_test >= this.y_min; 
  }
  
  public int compareTo(Line other) {
    return Double.compare(other.len, this.len); 
  }
  
  public String toString(){
    return "Line: [" + this.n1.toString() + "|" + this.n2.toString() + "]"; 
  }
}
