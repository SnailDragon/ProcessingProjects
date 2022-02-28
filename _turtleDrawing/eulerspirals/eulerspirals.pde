Turtle t;

int speed;
float deg;
float change;
int it = 0;
float d;
float pos;

void setup(){
  size(960,540);
  background(0);
  
  t = new Turtle(width/2, height/2, 2);
  
  speed = 1000;
  deg = 0;
  change = PI / 3.5;
  d = 5;
  
  pos = mouseX;
  change = pos / 500 + 1;
  
}

//interesting change values --> 2.75, 5.18, 4.4, 5.07, 2.208

void draw(){
  if(mousePressed) setup();
    for(int i = 0; i < speed; i++){
      deg += change;
      deg %= 360;
      t.turnLeft(radians(deg));
      t.forward(d);
      it++;
      println(frameRate + "\t" + change + "\t" + pos);
    }
}
