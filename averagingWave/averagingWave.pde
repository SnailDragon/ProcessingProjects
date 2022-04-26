//300 #000000 #FFFFFF constants
//500 #000000 #FFFFFF constants
//300 #000000 #FFFFFF constants (it < 500)
//300 
RadCircle circ;

int[][] pix = new int[500][(int)(500.0*(540.0/960.0))];
int[][] constants = new int[5][2];
int START_COL = #000000;
int CONST_COL = #FFFFFF;

void setup(){
  size(960, 540);
  background(0);
  noStroke(); 
  

  for(int i = 0; i < pix.length; i++){
    for(int j = 0; j < pix[0].length; j++){
      pix[i][j] = START_COL;
    }
  }
  
  for(int i = 0; i < constants.length; i++){
    constants[i][0] = (int)random(pix.length);
    constants[i][1] = (int)random(pix[0].length);
  }
  
  circ = new RadCircle(1, 100);
}
int it = 0;
float snakeit = 0;
void draw(){
  
  //DrawGrid(pix);
  
  //for(int i = 0; i < 1; i++){
  //  pix = averagePixels(); //averageGrid(pix);
  //  if(it < 500){
  //    pix = addConstants(pix, constants);
  //  }
  //  it++;
  //}  
  for(int i = 0; i < 1; i++){
    averagePixels();
  }
  
  circ.display();
  circ.shiftFront((25 * mod1(snakeit) + abs(150*mod2(snakeit))+100) / 1.4);
  snakeit += PI / 10;
  println(frameRate);
}

float mod1(float num){
  return cos(num) + sin(num / pow(1.001, num));
}

float mod2(float num){
  return cos(num / 100);
}

int[][] addConstants(int[][] grid, int[][] consts){
  for(int i = 0; i < consts.length; i++){
    grid[consts[i][0]][consts[i][1]] = CONST_COL;
  }
  return grid;
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

int[][] averageGrid(int[][] grid){
  int[][] newGrid = new int[grid.length][grid[0].length];
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      int sum = 0;
      int num = 0;
      if(i-1 > 0){
        sum += grid[i-1][j];
        num++;
      }
      if(i+1 < grid.length){
        sum += grid[i+1][j];
        num++;
      }
      if(j-1 > 0){
        sum += grid[i][j-1];
        num++;
      }
      if(j+1 < grid[0].length){
        sum += grid[i][j+1];
        num++;
      }
      
      //diagonals
      if(i-1 > 0 && j-1 > 0){
        sum += grid[i-1][j-1];
        num++;
      }
      if(i+1 < grid.length && j+1 < grid[0].length){
        sum += grid[i+1][j+1];
        num++;
      }
      if(j-1 > 0 && i+1 < grid.length){
        sum += grid[i+1][j-1];
        num++;
      }
      if(j+1 < grid[0].length && i-1 > 0){
        sum += grid[i-1][j+1];
        num++;
      }
      
      newGrid[i][j] = sum / num;
      
    }
  }
  
  return newGrid;
}

void averagePixels(){
  int[][] newGrid = new int[pixelWidth][pixelHeight];
  for(int i = 0; i < pixelWidth; i++){
    for(int j = 0; j < pixelHeight; j++){
      color sum = 0;
      int num = 0;
      if(i-1 > 0){
        sum += get(i-1,j);
        num++;
      }
      if(i+1 < pixelWidth){
        sum += get(i+1,j);
        num++;
      }
      if(j-1 > 0){
        sum += get(i,j-1);
        num++;
      }
      if(j+1 < pixelHeight){
        sum += get(i,j+1);
        num++;
      }
      
      //diagonals
      //if(i-1 > 0 && j-1 > 0){
      //  sum += get(i-1,j-1);
      //  num++;
      //}
      //if(i+1 < pixelWidth && j+1 < pixelHeight){
      //  sum += get(i+1,j+1);
      //  num++;
      //}
      //if(j-1 > 0 && i+1 < pixelWidth){
      //  sum += get(i+1,j-1);
      //  num++;
      //}
      //if(j+1 < pixelHeight && i-1 > 0){
      //  sum += get(i-1,j+1);
      //  num++;
      //}
      //print(color(get(i,j)) + " ");
      newGrid[i][j] = sum / num;
      
    }
  }
  for(int i = 0; i < newGrid.length; i++){
    for(int j = 0; j < newGrid[0].length; j++){
      //print(newGrid[i][j] + " "); 
      newGrid[i][j]
      set(i,j, newGrid[i][j]);
    }
  }
}
