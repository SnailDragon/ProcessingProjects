GravityBox box;

void setup(){
  size(960,580);
  background(100);
  fill(255);
  noStroke();
  
  box = new GravityBox(width/2, height/4, 50, 90, 100, 45);
  
}

void draw(){
  background(100);
  
  box.update();
  box.display();
  
}
