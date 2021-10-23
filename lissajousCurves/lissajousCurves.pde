
void setup(){
  size(960,540);
  background(0);
  noStroke();
  fill(255);
}

float A = 400;
float B = 250;
float a = 2;
float b = 1.4;
float c = 10;

float t = 0;
void draw(){
  translate(width/2, height/2);
  background(0);
  
  for(float i = 0; i < 100; i += .005){
    float x = A * sin(a*i+c);
    float y = B * sin(b*i);
    
    circle(x,y,5);
  }
  t += 0.0001;
  c += .005;
  //a = 2 * sin(t);
  //b = 1.4 * cos(t);
  
  println(frameRate);
}
