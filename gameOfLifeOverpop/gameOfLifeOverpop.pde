int[][] board = new int[100][(int)(100.0*(520.0/960.0))];

int NUM_SEED = 200;

void setup(){
  size(960,520);
  background(100);
  noStroke(); 
  
  for(int i = 0; i < board.length; i++){
    for(int j = 0; j < board[0].length; j++){
      board[i][j] = #000000;
    }
  }
  
  for(int i = 0; i < NUM_SEED; i++){
    board[(int)random(board.length/4,3*board.length / 4)][(int)random(board[0].length/4, 3 * board[0].length / 4)] = #FFFFFF;
  }
  
}

void draw(){
  
  background(0);
  DrawGrid(board);
  
  int[][] oldBoard = board;  
  
  for(int i = 0; i < board.length; i++){
    for(int j = 0; j < board[0].length; j++){
      int count = GetSurrounding(oldBoard, i, j);
      if(count < 2) {
        board[i][j] = #000000;
      }
      else if(count < 3){
        board[i][j] = oldBoard[i][j];
      }
      else if(count == 3){
        board[i][j] = #FFFFFF;
      }
      else if(count > 3) {
        board[i][j] = #000000;
      }
      
    }
  }  
  
  if(mousePressed){
    setup();
  }
  
  //frameRate(1);
  println(frameRate);
}

boolean AllFull(int[] s){
  for(int i = 0; i < s.length; i++){
    if(s[i] == #000000) return false;
  }
  return true;
}

int GetSurrounding(int[][] b, int x, int y){
  int count = 0; 
  
  if(b[x][y] == #FFFFFF) count++;
  
  if(y-1 >= 0 && b[x][y-1] == #FFFFFF) count++;
  
  if(y+1 < b[0].length && b[x][y+1] == #FFFFFF) count++;
  
  if(x-1 >= 0 && b[x-1][y] == #FFFFFF) count++;
  
  if(x+1 < b.length && b[x+1][y] == #FFFFFF) count++;
  
  if(y-1 >= 0 && x-1 >= 0 && b[x-1][y-1] == #FFFFFF) count++;
  
  if(y-1 >= 0 && x+1 < b.length && b[x+1][y-1] == #FFFFFF) count++;
  
  if(y+1 < b[0].length && x-1 >= 0 && b[x-1][y+1] == #FFFFFF) count++;
  
  if(y+1 < b[0].length && x+1 < b.length && b[x+1][y+1] == #FFFFFF) count++;
  
  
  //if(y+1 >= b[0].length) count++;
  //if(y-1 < 0) count++;
  //if(x+1 >= b.length) count++;
  //if(x+1 < 0) count++;

  return count;
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
