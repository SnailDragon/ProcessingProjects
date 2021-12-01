void setup(){
  size(500,500);
  stroke(255);
  strokeWeight(10);
  float h = height;
  float w = width;
  for(int i=0; i<height; i += h){
    h = h-(random(h)-20);
    if(i+h > height){
        h = height-i;
      }
    for(int j=0; j<width; j += w){
      w = w-(random(w)-20);
      fill(random(255),random(255),random(255));
      if(j+w > width){
        w = width-j;
        rect(j,i,w,h);
        break;
      }
      rect(j,i,w,h);
    }
  }
}

float rdown(float num, int max){
  if(num > max) return (float)max;
  else return num;
}


void draw(){
  if(mousePressed == true){
    setup();
  }

}
