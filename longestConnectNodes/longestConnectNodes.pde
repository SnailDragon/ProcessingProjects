import java.util.HashSet;
import java.util.PriorityQueue; 

int NODE_COUNT = 10; 
int ROW_COUNT = 10; 
int COL_COUNT = 10; 
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
      x = (int)((int)(random(ROW_COUNT-1)+1)); 
      y = (int)((int)(random(COL_COUNT-1)+1));
    } while(used.contains(x + "," + y)); 
    used.add(x + "," + y); 
    nodes.add(new Node(x, y)); 
  }
  
  nodes = new ArrayList<Node>(); 
  
  Line line1 = new Line(
    new Node(1,1),
    new Node(-1,-1)
  );
  
  Line line2 = new Line(
    new Node(-1,1),
    new Node(1,-1)
  );
  
  System.out.println("Line1: " + line1.toString() + " " + line1.y1 + " " + line1.x1 + " " + line1.m); 
  System.out.println("Line2: " + line2.toString() + " " + line2.y1 + " " + line2.x1 + " " + line2.m); 
  
  System.out.println(line1.x_max + " " + line1.x_min); 
  System.out.println(line2.x_max + " " + line2.x_min); 
  System.out.println(line1.crosses(line2)); 

  //drawNodes(); 
  
  while(true); 
  
}

void draw(){
  // pick a node
  int chosen_node = (int)(nodes.size() * random(1)); 
  System.out.println("Chose node #" + chosen_node + " " + 
                      nodes.get(chosen_node).toString()); 
  
  // create possible lines 
  //ArrayList<Line> lines = new ArrayList<Line>(); 
  PriorityQueue<Line> candidate_lines = new PriorityQueue<Line>();
  for(int i = 0; i < nodes.size(); i++){
    if(i == chosen_node) continue; 
    candidate_lines.add(new Line(
      nodes.get(chosen_node),
      nodes.get(i)
    ));
  }
  System.out.println("created all possible lines"); 
  
  // pick the largest allowed 
  Line chosen;
  do {
    chosen = candidate_lines.poll();
    System.out.println("Looking at line: " + chosen.toString());
    if(candidate_lines.size() == 0) return; 
  } while(crossesLineOrNode(chosen)); 
  System.out.println("Chose: " + chosen.toString()); 
  
  // draw it
  drawLine(chosen); 
  System.out.println("drawn"); 
  
  // store it 
  existing_lines.add(chosen); 
  System.out.println("Stored"); 
  
  delay(1000); 
}

void drawLine(Line line){
  stroke(255); 
  strokeWeight(5); 
  line(line.n1.x * (width / ROW_COUNT), 
        line.n1.y * (height / COL_COUNT), 
        line.n2.x * (width / ROW_COUNT), 
        line.n2.y * (height / COL_COUNT)); 
  noStroke(); 
}

void mouseClicked() {
  setup(); 
}

void drawNodes(){
  fill(255); 
  for(Node node : nodes){
    System.out.println(node.x + " " + node.y + " " + node.r); 
    circle(node.x * (width / ROW_COUNT), 
            node.y * (height / COL_COUNT), node.r); 
  }
}

boolean crossesLineOrNode(Line line){
  for(Line other : existing_lines){
    if(line.crosses(other)){
      return true; 
    }
  }
  
  for(Node other : nodes){
    if((other.equals(line.n1) || other.equals(line.n2)) == false 
        && line.hasPoint(other)){
      return true; 
    }
  }
  
  return false; 
}
