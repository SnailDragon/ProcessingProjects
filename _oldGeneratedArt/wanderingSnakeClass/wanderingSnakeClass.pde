int[] colors = {#FF0000, #FFFF00, #008000, #0000FF, #FFFFFF, #f5deb3, #00cdcd};

Snake[] snakes = new Snake[10];


void setup(){
  size(960,540);
  background(0);

  for(int i=0; i<snakes.length; i++){
    snakes[i] = new Snake(3,100,20, width/2, height/2);
  }
  
  frameRate(24);
}

int speedFactor = 2;

void draw(){
  background(0);
  for(int i=0; i<speedFactor; i++){
    for(Snake s : snakes){
      s.move();
    }
  }
   
  for(Snake s : snakes){
      //s.display();
      s.display(colors[(int)random(7)]); 
   }
}
