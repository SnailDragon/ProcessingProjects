// IDEA - cityscape on a circle - 
//loops around and draws a new one again and again
Turtle t;

void setup(){
  size(960,540);
  background(0);
  t = new Turtle(width/2, height/2, 5);
}

void draw(){
  t.forward(10);
  t.turnRight(PI/90);
  
}
