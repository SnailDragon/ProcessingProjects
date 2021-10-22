//int[] colors = {#0000FF,#FF0000,#008000,#FFA500,#FFFF00,#EE82EE,#800080};
int[] colors = {#0000FF,#008000};
int[][] colorGrid;
int dimensionW = width/2;
int numXPix = (int)(width * 3);
int numYPix = (int)(height * 3);

void setup(){
  size(960,540);
  noStroke();
  colorGrid = new int[numXPix][numYPix];
  for(int i = 0; i < colorGrid.length; i++){
    for(int j = 0; j < colorGrid[0].length; j++){
      colorGrid[i][j] = colors[(int)random(colors.length)];
    }
  }
  
}

void draw(){
  DrawGrid(colorGrid);
  
  Spread(5000);
  
  println(frameRate);
}

void Spread(int numToModify){
  int turned = 0;
  while(turned < numToModify){
    int x = (int)random(colorGrid.length);
    int y = (int)random(colorGrid[0].length);
    int colorVal = colorGrid[x][y];
    if((x-1 > 0 && colorGrid[x-1][y] == colorVal) && (x+1 < colorGrid.length && colorGrid[x+1][y] == colorVal) 
      && (y-1 > 0 && colorGrid[x][y-1] == colorVal) && (y+1 < colorGrid[0].length && colorGrid[x][y+1] == colorVal)){
        continue;
      }
    if(x-1 > 0) colorGrid[x-1][y] = colorVal;
    if(x+1 < colorGrid.length) colorGrid[x+1][y] = colorVal;
    if(y-1 > 0) colorGrid[x][y-1] = colorVal;
    if(y+1 < colorGrid[0].length) colorGrid[x][y+1] = colorVal; 
    turned++;
    
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
