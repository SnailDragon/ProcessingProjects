void setup(){
  size(500,500);
  float a = 0.0;
  float inc = TWO_PI/25.0;
  for (int i = 0; i < width; i++) {
    line(i*4, width/2, i*4, width/2+cos(a)*140.0);
    a = a + inc;
  }
}

float p = 10;
float amp = 100;
float speed = 1;
float a = 0.0;
float tr = 0.0;

void draw(){
  clear();
  stroke(255);
 
  a = 0.0;
  tr += 0.02;
  //p = mouseX/10;
  //amp = mouseY;
  //p += speed/4;
  //println("p = " + p);
  //amp += speed;
  //println("amp = " + amp);
  
  float inc = TWO_PI/25.0;
  for (int i = 0; i < width; i++) {
    //line(i*p, width/2, i*p, width/2+cos(a-tr)*amp);
    circle(i*p, width/2+cos(a-tr)*amp, 5);
    a = a + inc;
  }
  
}
