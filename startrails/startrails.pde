

void setup(){
  size(960,540);
  background(0);
  
  stroke(255);
  strokeWeight(3);
  
}

void draw(){
  background(0);
  Star s1 = new Star(300, 0, 0.01);
  
  s1.Update();
  println(s1.GetTheta());
  s1.Display();
  
  println(frameRate);
 
}
