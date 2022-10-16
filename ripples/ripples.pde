ArrayList<DotCircle> circs;

void setup(){
  size(960,540);
  background(0);
  stroke(255);
  circs = new ArrayList<DotCircle>();
  
  println("setup done");
}
int it = 0;
void draw(){
  if(mousePressed) setup();
  background(0);
  
  if(it % 10 == 0 && it < 1000){
    for(int i = 0; i < (int)random(2); i++) circs.add(new DotCircle(random(width), random(height), 1, 800));
  }
  
  for(DotCircle dc : circs){
    dc.incRadius(0.5);
  }
  for(DotCircle dc : circs){
    dc.pickDeaths(2, circs);
  }
  for(DotCircle dc : circs){
    dc.killDots();
  }
  for(DotCircle dc : circs){
    dc.display();
  }
  
  
  
  it += (int)random(2);
  saveFrame("zr-######.png");
  println(frameRate + "\t" + it);
}
