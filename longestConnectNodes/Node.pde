
class Node implements Comparable<Node> {
  
  public int x; 
  public int y; 
  public int r; 
  public int line_count; 
  
  Node(int x, int y){
    this.x = x; 
    this.y = y; 
    this.r = 10; 
    this.line_count = 0; 
  }
  
  public String toString(){
    return "(" + this.x + "," + this.y + ")"; 
  }
  
  public boolean equals(Node other){
    return this.x == other.x && this.y == other.y && this.r == other.r; 
  }
  
  public int compareTo(Node other) {
    return Double.compare(this.line_count, other.line_count); 
  }
  
}
