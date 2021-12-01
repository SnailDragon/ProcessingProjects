//Orbiter o1 = new Orbiter(200, 20, 0.02);
Orbiter[] orbits = new Orbiter[36];


void setup(){
  size(960,540);
  background(0);
  noStroke();
  fill(255);
  translate(width/2, height/2);
  
  //orbits[0] = new Orbiter(35, 10, 0.002);
  //orbits[1] = new Orbiter(70, 10, 0.005);
  //orbits[2] = new Orbiter(105, 10, 0.008);
  //orbits[3] = new Orbiter(140, 10, 0.011);
  //orbits[4] = new Orbiter(175, 10, 0.014);
  //orbits[5] = new Orbiter(210, 10, 0.017);
  //orbits[6] = new Orbiter(245, 10, 0.02);
  
  float radius = 20;
  float speed = 0.005;
  for(int i=0; i<orbits.length; i++){
    orbits[i] = new Orbiter(radius, 10, speed);
    
    radius += 250 / orbits.length;
    speed += 0.015 / orbits.length;
  }

  
}

void draw(){  
  translate(width/2, height/2);
  background(0);
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
    float tempR = r;
    float x = tempR * cos(pos);
    float y = tempR * sin(pos);
    fill(255);
    circle(x,y,size);
  }
  
}
