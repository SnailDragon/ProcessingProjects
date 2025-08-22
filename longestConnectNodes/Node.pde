
class Node {
  
  public int x; 
  public int y; 
  public int r; 
  
  Node(int x, int y){
    this.x = x; 
    this.y = y; 
    this.r = 10; 
  }
  
  public String toString(){
    return "(" + this.x + "," + this.y + ")"; 
  }
  
  public boolean equals(Node other){
    return this.x == other.x && this.y == other.y && this.r == other.r; 
  }
  
}
