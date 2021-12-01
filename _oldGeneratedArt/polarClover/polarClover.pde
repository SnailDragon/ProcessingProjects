float r = 0;
float x = 0;
float y = 0;

void setup(){
  size(1000,1000, P3D);
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(2);
  
  frameRate(30);
  
  //r = 2cos(2 * theta)

  
  //for(float theta=0; theta< 2*PI; theta+=.04){
  //  r = 200 * cos(6*theta);
  //  x = r * cos(theta);
  //  y = r * sin(theta);
  //  //circle(x,y,5);
    
  //  line(0,0,x,y);
  //}
  
}

float theta = 0;

void draw(){
  translate(width/2,height/2);
  clear();
  for(float i=theta; i<theta+3.12; i += .12){
    r = 200 * cos(2*i);
    x = r * cos(i);
    y = r * sin(i);
    //translate(0,0,10*sin(2*theta));
    rotate(theta/20);
    circle(x,y,5);
    circle(-x,-y,5);
    line(-x,-y,x,y);
  }
  theta += .015; //.03;
  //saveFrame("screen-#######.png");
  //if(theta >= 2*PI){
  //  //delay(1000);
  //  clear();
  //  theta = 0;
  //}
  
}
