float[][] grid;
int DENSITY = 50;
int ZOOMIN = 2;

void setup(){
  size(960,540);
  background(0);
  stroke(255);
  grid = new float[(int)(width/DENSITY)][(int)(height/DENSITY)];
}

void draw(){
  background(0);
  createSlopes(grid);
  createFlow(grid);
}

float equation(float x, float y){
  return pow(x,2) + pow(y,2);
}

float inclination(float x, float y){
  return atan(equation(x,y));
}

void createSlopes(float[][] grid){
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      grid[i][j] = inclination((i-grid.length/2)/ZOOMIN,(j-grid[0].length/2)/ZOOMIN);
    }
  }
}

void createFlow(float[][] grid){
  float xoffset = width/grid.length/2;
  float yoffset = height/grid[0].length/2;
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      float x = i * width/grid.length + xoffset;
      float y = j * height/grid[0].length + yoffset;
      float startX = x - (width/grid.length)/2.0 * cos(grid[i][j]);
      float startY = y - (height/grid[0].length)/2.0 * sin(grid[i][j]);
      float endX = x + (width/grid.length)/2.0 * cos(grid[i][j]);
      float endY = y + (height/grid[0].length)/2.0 * sin(grid[i][j]);  
      line(startX, startY, endX, endY);
    }
  }
  
}
