PImage img;

int xf = 10;
int yf = 20;
//eiffelsimple.jpg checkers.jpg diamonds.jpg eiffel.jpg
void settings(){
  img = loadImage("eiffelsimple.jpg");
  img.filter(GRAY);
  size(img.width, img.height);
}

void setup(){
  background(120);
  noStroke();
  
  
  color[][] grid = gridify();
  
  println(grid.length, grid[0].length);
  
  displayGrid(grid);
  
  tint(255, 80);
  image(img, 0,0);
}

color[][] gridify(){
  color[][] grid = new int[height/yf][width/xf];
  int w = (width / grid[0].length);
  int h = (height / grid.length);
  
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      PImage sect = img.get(j * w, i * h, w, h);
      //sect.filter(GRAY); done in advance
      sect.loadPixels();
      color ave = sect.pixels[0];
      for(color pix : sect.pixels){
        ave = lerpColor(ave, pix, 0.5);
      }
      grid[i][j] = ave;
      
    }
  }
  
  return grid;
}

void displayGrid(color[][] grid){
  int w = (width / grid[0].length);
  int h = (height / grid.length);
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      fill(grid[i][j]);
      
      rect(j * w, i * h, w, h);
    }
  }
}
