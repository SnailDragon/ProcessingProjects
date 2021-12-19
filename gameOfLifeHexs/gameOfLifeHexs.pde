int[][] board = new int[10][(int)(10.0*(520.0/960.0))];

int NUM_SEED = 5;

void setup(){
  size(960,520);
  background(0);
  stroke(255);
  
  for(int i = 0; i < board.length; i++){
    for(int j = 0; j < board[0].length; j++){
      board[i][j] = #000000;
    }
  }
  
  for(int i = 0; i < NUM_SEED; i++){
    board[(int)random(board.length)][(int)random(board[0].length)] = #FFFFFF;
  }
}

void draw(){
  
  DrawTriangles(board);
}

void DrawTriangles(int[][] triangles){
  float wdim = width / (float)triangles.length;
  float hdim = height / (float)triangles[0].length;
  for(int i = 0; i < triangles.length; i++){
    for(int j = 0; j < triangles[0].length; j++){
      fill(triangles[i][j]);
      
      if(j % 2 == 0) triangle((i)*wdim, (j)*hdim, (i+1)*wdim, (j)*hdim, (i+.5)*wdim, (j+1)*hdim);
      else triangle((i+1)*wdim, (j-1)*hdim, (i+0.5)*wdim, (j)*hdim, (i+1.5)*wdim, (j)*hdim);
    }
  }
}
