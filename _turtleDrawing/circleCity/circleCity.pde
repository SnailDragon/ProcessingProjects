// IDEA - cityscape on a circle - 
//loops around and draws a new one again and again
Turtle t;
Turtle t2;

void setup(){
  size(960,540);
  background(100);
  //t = new Turtle(width/2, height/4, 5);
  //t2 = new Turtle(width/2, height/4, 5);
  //t.setColor(#000000);
  //t.forward(10);
  //t.turnRight(PI/45);
  
  
  
}

float th = .001;
float sweep = .1;
int it = 0;
void draw(){
  //wiper
  translate(width/2, height/2);
  fill(225);
  triangle(0,0, 1000*cos(th*it), 1000*sin(th*it), 1000*cos((th+sweep)*it), 1000*sin((th+sweep)*it));
  
  it++;
  println(frameRate);
}

//t.forward(10);
//  t.turnRight(PI/45);
//  t2.forward(t.old_dist);
//  t2.turnRight(t.old_turn);
