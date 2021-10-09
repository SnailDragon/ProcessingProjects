float orient = 0;
float dx = 1;
float dy = 1;

void setup(){
  size(1920,1080);
  background(0);
  
}

void draw(){
  background(0);
  dx = abs(dx);
  dy = abs(dy);
  circle(width/2, height/2, 10);
  drawLaser(width/2,height/2,orient);
  orient += 0.001;
  println(frameRate);
}

void drawLaser(int posX, int posY, float orientation){
  float[] xy = {posX,posY};
  for(int i = 0; i < 16000; i++){
    xy = drawLineFromAngle(xy[0],xy[1], orientation);
    if(xy[0] > width || xy[0] < 0){
      dx *= -1;
    }
    if(xy[1] > height || xy[1] < 0){
      dy *= -1;
    }
  }
  
}

float[] drawLineFromAngle(float px, float py, float angle){
  stroke(255);
  float[] newxy = {px + dx * cos(angle), py + dy * sin(angle)};
  line(px, py, newxy[0], newxy[1]);
  return newxy;
}

void keyPressed() {
  if(key == 'k'){
    orient -= 0.005;
  }
  if(key == 'l'){
    orient += 0.005;
  }
}
