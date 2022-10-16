PImage img;

int xf = 26;
int yf = 50;
//eiffelsimple.jpg checkers.jpg diamonds.jpg eiffel.jpg
void settings(){
  img = loadImage("diamonds.jpg");
  img.filter(GRAY);
  size(img.width, img.height);
}

void setup(){
  background(255);
  noStroke();
  
  
  //color[][] cgrid = colorGridify();
    
  //displayColorGrid(cgrid);
  
  
  int[][] grid = gridify();
  
  displayGrid(grid);
  
  
  //tint(255, 100);
  //image(img, 0,0);
}

int[][] gridify(){
  int[][] grid = new int[height/yf][width/xf];
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
      println(red(ave));
      grid[i][j] = (red(ave) < 250)? 1: 0;
    }
  }
  
  return grid;
}

void displayGrid(int[][] grid){
  String nums = "";
  int w = (width / grid[0].length);
  int h = (height / grid.length);
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      nums += grid[i][j];
    }
    nums += "\n";
  }
  fill(0);
  textSize(h);
  text(nums, 0, h);
}

color[][] colorGridify(){
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

void displayColorGrid(color[][] grid){
  int w = (width / grid[0].length);
  int h = (height / grid.length);
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      fill(grid[i][j]);
      
      rect(j * w, i * h, w, h);
    }
  }
}
