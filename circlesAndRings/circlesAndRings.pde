ArrayList<Bullseye> bulls = new ArrayList<Bullseye>();

float RING_WIDTH = 5;

void setup(){
  size(960,540);
  background(0);
  bulls.clear();
  for(int i = 0; i < 1; i++){
    bulls.add(new Bullseye((int)random(10, width-10), (int)random(10, height-10), RING_WIDTH));
  }
  
}

boolean growing = true;
int it = 0;
void draw(){
  if(mousePressed) setup();
  background(0);
  
  if(growing){
    for(int i = 0; i < bulls.size(); i++){
      boolean hasSpace = true;
      for(int j = 0; j < bulls.size(); j++){
        if(i == j) continue;
        if(dist(bulls.get(i).GetX(), bulls.get(i).GetY(), bulls.get(j).GetX(), bulls.get(j).GetY()) 
          < bulls.get(i).GetRadius() + bulls.get(j).GetRadius() + RING_WIDTH * 1.5){
            hasSpace = false;
          }
        
      }
      
      float bx = bulls.get(i).GetX();
      float by = bulls.get(i).GetY();
      float br = bulls.get(i).GetRadius() + 15;
      if(bx + br > width || bx - br < 0 || by + br > height || by - br < 0){
        hasSpace = false;
      }
      
      if(hasSpace){
        bulls.get(i).AddRing();      
      }
    }
  }
  else {
    for(Bullseye b : bulls){
      if(random(10) > 7) b.RemoveRing();
    }
  }
  
  for(Bullseye b : bulls){
    b.Display();
  }
  
  
  if(growing){
    float newX = (int)random(10, width-10);
    float newY = (int)random(10, height-10);
    boolean newSpace = true;
    for(Bullseye b : bulls){
      if(dist(newX, newY, b.GetX(), b.GetY()) < b.GetRadius() + RING_WIDTH * 1.5){
        newSpace = false;
      }
    }
    if(newSpace){
      bulls.add(new Bullseye(newX, newY, RING_WIDTH));
    }
  }
  
  it++;
  
  if(it > 1500){
    growing = false;
  }
  
  
  println(frameRate);
  println(it);
  
  //saveFrame("zcr-######.png");
  
}
