import java.util.HashSet;
import java.util.Arrays;
import java.util.Iterator;

int RES = 10;

void setup(){
  size(1000,500);
  noStroke();
  background(0);
  
  Maze maze = new Maze(RES);
  
  ArrayList<HashSet<int[]>> groups = new ArrayList<>();
  
  for(int r = 0; r < maze.getResR(); r++){
    for(int c = 0; c < maze.getResC(); c++){
      HashSet<int[]> set = new HashSet();
      int[] coor = {r, c};
      set.add(coor);
      groups.add(set);
    }
  }
    
  while(groups.size() != 1){
    
    for(int i = 0; i < groups.size(); i++){
      // choose valid
      ArrayList<int[]> validMoves = new ArrayList<>();
      Iterator iterator = groups.get(i).iterator();
      int place = (int)random(-1, groups.get(i).size()-1);
      for(int ii = 0; ii < place; ii++){
        iterator.next();
      }
      int[] curr = (int[])iterator.next();
      if(curr[0]-1 >= 0){
        int[] move = {curr[0]-1, curr[1]};
        validMoves.add(move);
      }
      if(curr[0]+1 < maze.getResR()){
        int[] move = {curr[0]+1, curr[1]};
        validMoves.add(move);
      }
      if(curr[1]-1 >= 0){
        int[] move = {curr[0], curr[1]-1};
        validMoves.add(move);
      }
      if(curr[1]+1 < maze.getResC()){
        int[] move = {curr[0], curr[1]+1};
        validMoves.add(move);
      }
      
      for(int j = 0; j < validMoves.size(); j++){
        boolean found = false;
        for(int[] g : groups.get(i)){
          if(g[0] == validMoves.get(j)[0] && g[1] == validMoves.get(j)[1]){
            found = true;
            break;
          }
        }
        if(found){
          validMoves.remove(j);
          j--;
        }
      }
      
      // connect
      if(validMoves.size() > 0){
        int[] choiceMove = validMoves.get((int)(random(0, validMoves.size())));
        maze.connect(curr, choiceMove);
      
        // merge choiceMove and curr
        for(int j = 0; j < groups.size(); j++){
          boolean found = false;
          for(int[] g : groups.get(j)){
            if(g[0] == choiceMove[0] && g[1] == choiceMove[1]){
              found = true;
              break;
            }
          }
          if(found){
            //groups.get(i).addAll(groups.get(j));
            for(int[] g : groups.get(j)){
              groups.get(i).add(g);
            }
            groups.remove(j);
            break;
          }
        }
      }
      
    }
    
  }
  
  maze.printMaze();
  maze.drawMaze();
}

void draw(){
  if(mousePressed) setup();
}
