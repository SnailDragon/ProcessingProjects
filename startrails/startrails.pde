Star stars[] = new Star[200];

void setup(){
  size(960,540);
  background(0);
  
  stroke(255);
  strokeWeight(3);
  
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star(random(100,width), random(0, 2*PI), random(0.01,0.03));
  }

}

void draw(){
  translate(width, height);
  background(0);
  
  for(int i = 0; i < stars.length; i++){
    stars[i].Update();
    stars[i].Display();
    if(abs((stars[i].GetTheta() % (2*PI)) - (PI/2)) < 0.01){
      stars[i].ReRandomize();
    }
  }
  
  frameRate(24);
  println(frameRate);
 
}
