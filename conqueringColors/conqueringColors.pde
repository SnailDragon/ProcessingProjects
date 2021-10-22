int[] colors = {#0000FF,#FF0000,#008000,#FFA500,#FFFF00,#EE82EE,#800080};
//int[] colors = {#0000FF,#008000};
int[][] colorGrid;
int dimensionW = width/2;
int numXPix = (int)(width * 3);
int numYPix = (int)(height * 3);
int numToIntro = 1000;
int spreadSpeed = 600;

void setup(){
  size(960,540);
  noStroke();
  colorGrid = new int[numXPix][numYPix];
  for(int i = 0; i < colorGrid.length; i++){
    for(int j = 0; j < colorGrid[0].length; j++){
      colorGrid[i][j] = colors[0];
    }
  }
  
  IntroduceNew(colorGrid, numToIntro, colors[1]);
  
}

int spreadingColor = #008000;
int colIndex = 1;
void draw(){

  DrawGrid(colorGrid);
  
  Spread(spreadSpeed, colors[colIndex]);
  
  if(EnoughOne(colorGrid, colorGrid.length*colorGrid[0].length-5, colors[colIndex])){
    colIndex = (colIndex+1) % colors.length;
    IntroduceNew(colorGrid, numToIntro, colors[colIndex]);
  }
    
  
  println(frameRate);
  
}

void IntroduceNew(int[][] grid, int numIntroduced, int col){
  for(int i = 0; i < numIntroduced; i++){
    int x = (int)(random(grid.length));
    int y = (int)(random(grid[0].length));
    grid[x][y] = col;
  }
}

boolean EnoughOne(int[][] grid, int threshold, int col){
  int count = 0;
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      if(grid[i][j] == col) count++;
    }
  }
  println(count);
  return count > threshold;
}

void Spread(int numToModify, int spreadColor){
  int turned = 0;
  while(turned < numToModify){
    int x = (int)random(colorGrid.length);
    int y = (int)random(colorGrid[0].length);
    int colorVal = colorGrid[x][y];
    if(colorVal == spreadColor){
      if((x-1 >= 0 && colorGrid[x-1][y] == colorVal) && (x+1 < colorGrid.length && colorGrid[x+1][y] == colorVal) 
        && (y-1 >= 0 && colorGrid[x][y-1] == colorVal) && (y+1 < colorGrid[0].length && colorGrid[x][y+1] == colorVal)){
          continue;
        }
      if(x-1 >= 0) colorGrid[x-1][y] = colorVal;
      if(x+1 < colorGrid.length) colorGrid[x+1][y] = colorVal;
      if(y-1 >= 0) colorGrid[x][y-1] = colorVal;
      if(y+1 < colorGrid[0].length) colorGrid[x][y+1] = colorVal; 
      turned++;
    }
    
  }
  
}

void DrawGrid(int[][] squares){
  float wdim = width / (float)squares.length;
  float hdim = height / (float)squares[0].length;
  for(int i = 0; i < squares.length; i++){
    for(int j = 0; j < squares[0].length; j++){
      fill(squares[i][j]);
      rect(i*wdim, j*hdim, wdim, hdim);
    }
  }
}
