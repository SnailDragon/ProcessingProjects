PImage img;

void setup(){
  size(960,540);
  background(0);
  
  img = loadImage("landscape.jpeg");
  
  image(img, 0, 0, width, height);
  

}


void draw(){
  loadPixels();
  for(int i = 0; i < width; i += width/10){
    for(int j = 0; j < height; j += height/10){
       setGroup(i, j, i+10, j+10, #000000);
    }
  }
  
  updatePixels();
}

void setGroup(int x1, int y1, int x2, int y2, int col){
  for(int i = x1; i < x2; i++){
    for(int j = y1; j < y2; j++){
      if(i > height || j > width) continue;
      pixels[i*width+j] = col;
    }
  }
}
