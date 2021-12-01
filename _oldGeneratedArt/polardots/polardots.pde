
void setup(){
  size(500,500);
  background(0);
  noStroke();
  float theta = 0;
  float r = 50;
  translate(width/2, height/2);
  for(theta=0; theta<360; theta++){
    r = mouseX*cos(theta)+100;
    float x = r * cos(theta*(PI/180)); 
    float y = r * sin(theta*(PI/180));
    //line(0,0,x,y);
    circle(x,y,4);
  }
  
  // 
}
float spread = 0;
float movement = 1;
float max = 400;
void draw(){
  //if(mousePressed == true){
  //  setup();
  //}
  noStroke();
  clear();
  delay(10);
  //spread += movement;
  spread += 1;
  println(spread);
  float theta = 0;
  float r = 50;
  translate(width/2, height/2);
  for(theta=0; theta<360; theta++){
    //r = spread*cos(theta)+100;
    float spreader = 300*sin(spread/100);
    r = spreader*cos(theta)+100;
    float x = r * cos(theta*(PI/180)); 
    float y = r * sin(theta*(PI/180));
    //line(0,0,x,y);
    circle(x,y,4);
  }
  //if(spread > max || spread < -max) movement *= -1;
  
}
