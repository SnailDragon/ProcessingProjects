Dot[] dots = new Dot[100];

void setup(){
  size(960,520);
  background(0);
  noStroke();
  
  for(int i = 0; i < dots.length; i++){
    dots[i] = new Dot(random(width), random(height), 5);
  }
  
}

void draw(){
  background(0);
  
  for(Dot d : dots){
    d.update(dots);
    d.display();
  }
  
  
  
}
