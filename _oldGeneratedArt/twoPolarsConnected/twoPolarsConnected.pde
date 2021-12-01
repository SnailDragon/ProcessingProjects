void setup(){
  size(500,500, P3D);
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(2);
  frameRate(30); 
}

float theta = 0;
//graph 1
float r = 0;
float x = 0;
float y = 0;
//graph 2
float r2 = 0;
float x2 = 0;
float y2 = 0;

void draw(){
  translate(width/2,height/2);
  clear();
  for(float i=theta; i<theta+3.12; i += .12){
    //graph 1
    r = 200 * cos(2*i);
    x = r * cos(i);
    y = r * sin(i);
    
    //graph 2
    r2 = 100 * cos(2*i);
    x2 = r2 * cos(i);
    y2 = r2 * sin(i);
    
    //translate(0,0,10*sin(2*theta));
    
    rotate(theta/20);
    
    circle(x,y,5);
    circle(x2,y2,5);
    line(x2,y2,x,y);
  }
  theta += .015; //.03;
  //saveFrame();
  //if(theta >= 2*PI){
  //  //delay(1000);
  //  clear();
  //  theta = 0;
  //}
  
}
