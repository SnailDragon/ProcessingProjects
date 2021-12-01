int fillVal = 0;

void setup(){
  size(700,700);
  
  noStroke();
  
  int d = 30;
  
  float w = width/d;
  float h = height/d;
  
  int[] colors = {#0000FF,#FF0000,#008000,#FFA500,#FFFF00,#EE82EE,#800080};
  
  for(int i=0; i<width; i += w){
    for(int j=0; j<height; j += h){
      fill(colors[(int)random(4)+3]);
      //fill(random(255));
      rect(i,j,w,h);
    }
  }
  
}

void draw(){
  if(mousePressed == true){
    setup();
  }

}
