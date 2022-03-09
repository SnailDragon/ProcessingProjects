boolean colored;

//cool stuff -
/* stroke(255), th = 0.001, sweep = 0.01
*
*/

void setup(){
  size(960,540);
  background(0);
  //noStroke();
  stroke(255);         
  fill(77,77,255,50);
  colored = true;
  //t = new Turtle(width/2, height/4, 5);
  //t2 = new Turtle(width/2, height/4, 5);
  //t.setColor(#000000);
  //t.forward(10);
  //t.turnRight(PI/45);
  
}
float th = .001; //0.001
float sweep = .05; //.1
int it = 1; 
void draw(){
  //wiper
  translate(width/2, height/2);
  triangle(0,0, 1000*cos(th*it), 1000*sin(th*it), 1000*cos((th+sweep)*it), 1000*sin((th+sweep)*it));
  
  if(abs(((th+sweep)*it)%(2*PI) - (th*it)%(2*PI)) <= (PI/12)){
    if(colored){
      fill(0,0,0,10);
      colored = false;
    }
    else{
      fill(77,77,255,10);
      colored = true;
    }
  }
  
  it++;
  frameRate(24);
  println(frameRate + "\t" + it);
}

//t.forward(10);
//  t.turnRight(PI/45);
//  t2.forward(t.old_dist);
//  t2.turnRight(t.old_turn);
