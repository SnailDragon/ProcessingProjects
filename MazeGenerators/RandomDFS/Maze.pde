
class Maze {
  
  private int[][] maze;
  
  public Maze(int rows, int columns){
    maze = new int[2 * rows + 1][2 * columns + 1];
    for(int r = 0; r < maze.length; r += 2){
      for(int c = 0; c < maze[0].length; c++){
        maze[r][c] = 1;
      }
    }
    for(int c = 0; c < maze[0].length; c += 2){
      for(int r = 0; r < maze.length; r++){
        maze[r][c] = 1;
      }
    }
  }
  
  boolean connect(int[] coor1, int[] coor2){
    int[] copy1 = {coor1[0] * 2 + 1, coor1[1] * 2 + 1};
    int[] copy2 = {coor2[0] * 2 + 1, coor2[1] * 2 + 1};
    if(copy1[0]-2 == copy2[0] && copy1[1] == copy2[1]){
      setCellAt(copy1[0]-1, copy1[1], 0);
      return true;
    }
    if(copy1[0]+2 == copy2[0] && copy1[1] == copy2[1]){
      setCellAt(copy1[0]+1, copy1[1], 0);
      return true;
    }
    if(copy1[1]-2 == copy2[1] && copy1[0] == copy2[0]){
      setCellAt(copy1[0], copy1[1]-1, 0);
      return true;
    }
    if(copy1[1]+2 == copy2[1] && copy1[0] == copy2[0]){
      setCellAt(copy1[0], copy1[1]+1, 0);
      return true;
    }
    return false;
  }
  
  int getRowCount(){
    return maze.length;
  }
  
  int getColumnCount(){
    return maze[0].length;
  }
  
  int getCellAt(int r, int c){
    return maze[r][c];
  }
  
  void setCellAt(int r, int c, int val){
    maze[r][c] = val;
  }
  
  void printMaze(){
    for(int r = 0; r < maze.length; r++){
      for(int c = 0; c < maze[0].length; c++){
        print(maze[r][c] + " ");
      }
      println();
    }
    println();
  }
  
}
