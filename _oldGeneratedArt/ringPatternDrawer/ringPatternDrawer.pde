//Orbiter o1 = new Orbiter(200, 20, 0.02);
Orbiter[] orbits = new Orbiter[7];


void setup(){
  size(960,540);
  background(0);
  noStroke();
  fill(255);
  translate(width/2, height/2);
  
  orbits[0] = new Orbiter(100, 10, 0.01);
  orbits[1] = new Orbiter(125, 10, 0.01);
  orbits[2] = new Orbiter(150, 10, 0.01);
  orbits[3] = new Orbiter(175, 10, 0.01);
  orbits[4] = new Orbiter(200, 10, 0.01);
  orbits[5] = new Orbiter(225, 10, 0.01);
  orbits[6] = new Orbiter(250, 10, 0.01);
  
}

void draw(){  
    translate(width/2, height/2);

  for(Orbiter o : orbits){
    o.display();
  }
}

class Orbiter {
  float r, size, speed;
  float pos;
  
   Orbiter (float rIn, float sizeIn, float speedIn){
    r = rIn;
    size = sizeIn;
    speed = speedIn;
    pos = 0;
  }
  
  void display(){
    pos += speed;
    float tempR = r; //* cos(2*pos);
    float x = tempR * cos(pos);
    float y = tempR * sin(pos);
    fill(255);
    circle(x,y,size);
  }
  
}
