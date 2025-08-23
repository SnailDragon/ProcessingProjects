import java.util.HashSet;
import java.util.PriorityQueue; 

int NODE_COUNT = 20; 
int ROW_COUNT = 25; 
int COL_COUNT = 50; 
ArrayList<Node> nodes;
ArrayList<Line> existing_lines; 

void setup(){
  size(960, 540); 
  noStroke(); 
  background(0); 
  
  nodes = new ArrayList<Node>(); 
  existing_lines = new ArrayList<Line>(); 
  HashSet<String> used = new HashSet<String>(); 
  for(int i = 0; i < NODE_COUNT; i++){
    int x, y; 
    do {
      x = (int)((int)(random(ROW_COUNT-1)+1) * (width / ROW_COUNT)); 
      y = (int)((int)(random(COL_COUNT-1)+1) * (height / COL_COUNT));
    } while(used.contains(x + "," + y)); 
    used.add(x + "," + y); 
    nodes.add(new Node(x, y)); 
  }
    
  drawNodes(); 
    
}

void draw(){
  // pick a node
  int chosen_node = (int)(nodes.size() * random(1)); 
  System.out.println("Chose node #" + chosen_node + " " + 
                      nodes.get(chosen_node).toString()); 
  
  // create possible lines 
  //ArrayList<Line> lines = new ArrayList<Line>(); 
  Line best = null; 
  for(int i = 0; i < nodes.size(); i++){
    if(i == chosen_node) continue; 
    Line testing = new Line(
      nodes.get(chosen_node),
      nodes.get(i)
    );
    
    if(crossesLineOrNode(testing) == false){
      if(best == null || testing.len >= best.len){
        best = testing; 
      }
    }
    
  }
  System.out.println("checked lines "); 
  
  if(best == null){
    System.out.println("trapped node: " + nodes.get(chosen_node).toString()); 
    return; 
  }
  
  System.out.println("Chose: " + best.toString()); 
  
  // draw it
  drawLine(best); 
  System.out.println("drawn"); 
  
  // store it 
  existing_lines.add(best); 
  System.out.println("Stored"); 
  
  delay(1000); 
  
}

void drawLine(Line line){
  stroke(255); 
  strokeWeight(5); 
  line(line.n1.x, // * (width / ROW_COUNT), 
        line.n1.y, // * (height / COL_COUNT), 
        line.n2.x, // * (width / ROW_COUNT), 
        line.n2.y); // * (height / COL_COUNT)); 
  noStroke(); 
}

boolean toggle = true; 
Node first_node; 
void mouseClicked() {
  setup(); 
  /*
  System.out.println("click (" + nodes.size() + ")"); 
  if(toggle){
    first_node = new Node(mouseX, mouseY); 
    System.out.println("node at " + first_node.x + " " + first_node.y); 
    nodes.add(first_node); 
  } else {
    Node next_node = new Node(mouseX, mouseY); 
    nodes.add(next_node); 
    System.out.println("node at " + next_node.x + " " + next_node.y); 
    Line new_line = new Line(first_node, next_node); 
    if(crossesLineOrNode(new_line) == false){
      System.out.println("Good line"); 
      existing_lines.add(new_line); 
      drawLine(new_line); 
    } else {
      System.out.println("bad line"); 
    }
  }
  drawNodes(); 
  toggle = !toggle; 
  */
}

void drawNodes(){
  fill(255); 
  for(Node node : nodes){
    //System.out.println(node.x + " " + node.y + " " + node.r); 
    //circle(node.x * (width / ROW_COUNT), 
    //        node.y * (height / COL_COUNT), node.r); 
    circle(node.x, node.y, node.r);
  }
}

boolean crossesLineOrNode(Line line){
  for(Line other : existing_lines){
    if(line.crosses(other)){
      System.out.println(line.toString() + " crosses " + other.toString()); 
      return true; 
    }
  }
  
  for(Node other : nodes){
    if((other.equals(line.n1) || other.equals(line.n2)) == false 
        && line.hasPoint(other)){
      System.out.println(line.toString() + " hits " + other.toString()); 
      return true; 
    }
  }
  
  return false; 
}
