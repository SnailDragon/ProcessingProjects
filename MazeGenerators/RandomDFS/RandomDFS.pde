import java.util.Arrays;
import java.util.Stack;

int RES = 10;

void setup(){
  size(1000, 500);
  noStroke();
  
  background(0);
  
  Maze maze = new Maze(RES, (int)(RES * width / height));
  
  
  Stack<int[]> stack = new Stack<int[]>();
  
  int[][] hist = new int[RES][(int)(RES * width / height)];
  int[] start = {0,0};
  
  stack.push(start);
  hist[start[0]][start[1]] = 1;

  while(stack.size() > 0){
    // get valid moves
    ArrayList<int[]> validMoves = new ArrayList<>();
    int[] curr = stack.peek();
    if(curr[0]-1 >= 0 && hist[curr[0]-1][curr[1]] != 1){
      int[] move = {curr[0]-1, curr[1]};
      validMoves.add(move);
    }
    if(curr[0]+1 < hist.length && hist[curr[0]+1][curr[1]] != 1){
      int[] move = {curr[0]+1, curr[1]};
      validMoves.add(move);
    }
    if(curr[1]-1 >= 0 && hist[curr[0]][curr[1]-1] != 1){
      int[] move = {curr[0], curr[1]-1};
      validMoves.add(move);
    }
    if(curr[1]+1 < hist[0].length && hist[curr[0]][curr[1]+1] != 1){
      int[] move = {curr[0], curr[1]+1};
      validMoves.add(move);
    }
    
    // random move
    if(validMoves.size() == 0){
      stack.pop();
    }
    else {
      int[] move = validMoves.get((int)random(0, validMoves.size()));
      maze.connect(curr, move);
      hist[move[0]][move[1]] = 1;
      stack.push(move);
    }
  }
  
  int randomGap = RES;
  for(int i = 0; i < randomGap; i++){
    int row = (int)random(1, maze.getRowCount()-1);
    int col = (int)random(1, maze.getColumnCount()-1);

    if(maze.getCellAt(row-1, col) + maze.getCellAt(row+1, col) == 2 && maze.getCellAt(row, col-1) + maze.getCellAt(row, col+1) == 0 
        && (row-2 >= 0 && row+2 < maze.getRowCount() && maze.getCellAt(row-2, col) + maze.getCellAt(row+2, col) == 1) 
        ||  
        maze.getCellAt(row-1, col) + maze.getCellAt(row+1, col) == 0 && maze.getCellAt(row, col-1) + maze.getCellAt(row, col+1) == 2 
        && (col-2 >= 0 && col+2 < maze.getColumnCount() && maze.getCellAt(row, col-2) + maze.getCellAt(row, col+2) == 1)){
      maze.setCellAt(row, col, 0);
    }
  }
  
  
  //maze.printMaze();
  
  for(int r = 0; r < maze.getRowCount(); r++){
    for(int c = 0; c < maze.getColumnCount(); c++){
      fill(maze.getCellAt(r,c) * 255);
      rect( c * (float)width / maze.getColumnCount(), r * (float)height / maze.getRowCount(), (float)height / maze.getRowCount(), (float)width / maze.getColumnCount());
    }
  }
}

void draw(){
  if(mousePressed) setup();
}
