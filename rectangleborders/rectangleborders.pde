ArrayList<BRect> rects = new ArrayList<BRect>();

float RING_WIDTH = 10;
float RING_HEIGHT = 10;

void setup(){
  size(960,540);
  background(0);
  
  rects.clear();
  for(int i = 0; i < 1; i++){
    rects.add(new BRect(random(10, width-10), random(10, height-10), RING_WIDTH, RING_HEIGHT));
  }
  
}

int it = 0;
void draw(){
  if(mousePressed) setup();
  background(0);
  
  for(int i = 0; i < rects.size(); i++){
    boolean hasSpace = true;
    
    for(int j = 0; j < rects.size(); j++){
      if(i != j){
        float distX = abs(rects.get(i).GetX() - rects.get(j).GetX()) - 1.5*rects.get(i).GetWidth();
        float distY = abs(rects.get(i).GetY() - rects.get(j).GetY()) - 1.5*rects.get(i).GetHeight();
        if(rects.get(i).XDist() + rects.get(j).XDist() > distX && rects.get(i).YDist() + rects.get(j).YDist() > distY){
          println(rects.get(i).XDist() + rects.get(j).XDist() + "\t" + distX);
          hasSpace = false;
        }
      }
    }
    
    if(rects.get(i).XDist() + rects.get(i).GetX() > width-10 || rects.get(i).GetX() - rects.get(i).XDist() < 10 || 
      rects.get(i).YDist() + rects.get(i).GetY() > height-10 || rects.get(i).GetY() - rects.get(i).YDist() < 10){
        hasSpace = false;
      }
    
    if(hasSpace){
      rects.get(i).AddRing();
    }
  }
  
  float newX = random(10, width-10);
  float newY = random(10, height-10);
  boolean hasSpace = true;
  for(int i = 0; i < rects.size(); i++){
    float distX = abs(rects.get(i).GetX() - newX) - 1.5*rects.get(i).GetWidth();
    float distY = abs(rects.get(i).GetY() - newY) - 1.5*rects.get(i).GetHeight();
    if(rects.get(i).XDist() > distX && rects.get(i).YDist() > distY){
      hasSpace = false;
    }
  }
  
  if(hasSpace){
    rects.add(new BRect(newX, newY, RING_WIDTH + random(-5,5), RING_HEIGHT + random(-5,5)));
  }
  
  for(BRect r : rects){
    r.Display();
  }
  //it++;
  //println(it);
  //println(frameRate);
}
