ArrayList<Cell> cells;

int NUM_CELLS = 10;

void setup(){
  size(960,540);
  background(0);
  cells = new ArrayList<Cell>();
  noStroke();
  fill(255);
  for(int i = 0; i < NUM_CELLS; i++){
    cells.add(new Cell(random(width), random(height), 10));
  }
  
}

void draw(){
  background(0);
  
  CheckCollisions();
  
  for(Cell c : cells){
    c.Display();
    c.Move();
  }
  
  
  frameRate(24);
  println(frameRate);
}

void CheckCollisions(){
  for(int i = 0; i < cells.size(); i++){
    for(int j = 0; j < cells.size(); j++){
      if(i == j) continue;
      if(Hit(cells.get(i),cells.get(j))){
        if(cells.get(i).GetRadius() > cells.get(j).GetRadius()){
          cells.get(i).SetRadius(cells.get(i).GetRadius() + cells.get(j).GetRadius());
          //cells.get(i).ResetSpeed();
          cells.remove(j);
        }
        else{
          cells.get(j).SetRadius(cells.get(i).GetRadius() + cells.get(j).GetRadius());
          //cells.get(j).ResetSpeed();
          cells.remove(i);
        }
      }
    }
  }
}

boolean Hit(Cell c1, Cell c2){
  PVector loc1 = c1.GetLocation();
  PVector loc2 = c2.GetLocation();
  if(dist(loc1.x, loc1.y, loc2.x, loc2.y) < (c1.GetRadius() + c2.GetRadius())){
    return true;
  }
  return false;
}
