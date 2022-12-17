color [][] grid;
boolean [][] settled;

int x, y;
color col;

int SPEEDFACTOR = 100;

void setup(){
  background(0);
  noStroke();
  size(960,540);
  grid = new color[width][height];
  settled = new boolean[grid.length][grid[0].length];
  
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      grid[i][j] = 0;//random(255);
      settled[i][j] = false;
    }
  }

  x = grid.length/2;//(int)random(grid.length);
  y = grid[0].length/2;//(int)random(grid[0].length);
  col = newColor(); //random(255);//grid[x][y];
  settled[x][y] = true;
  grid[x][y] = col;
  newt = false;
}

boolean newt = true;
void draw(){
  if(mousePressed) setup();
  
  displayGrid(grid);
  
  for(int repetition = 0; repetition < SPEEDFACTOR; repetition++){
    if(newt){
      do {
        x = (int)random(grid.length);
        y = (int)random(grid[0].length);
      } while(settled[x][y] == false); // or spread from an already spread spot with settled[x][y] == false
      col = newColor(); //random(255);//grid[x][y];
      settled[x][y] = true;
      newt = false;
      //println("Now Spreading " + col + " from " + x + ", " + y + "|" + grid[x][y]);
    }
    
    ArrayList<Integer[]> options = getOptions(x,y);
    
    if(options.size() == 0 || (int)random(1000) == 1){
      newt = true;
    }
    else {
      Integer[] choice = options.get((int)random(options.size()));
      x = choice[0];
      y = choice[1];
      grid[x][y] = col;
      settled[x][y] = true;
    }
  }
  println(frameRate);
  saveFrame("zgrayscale-########.png");
}

void displayGrid(color[][] grid){
  float h = height / grid[0].length;
  float w = width / grid.length;
  
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[i].length; j++){
      fill(grid[i][j]);
      rect(i * w, j * h, w, h);
    }
  }
  
}

ArrayList<Integer[]> getOptions(int xx, int yy){
  ArrayList<Integer[]> options = new ArrayList<Integer[]>();
  
  for(int i = xx-1; i <= xx+1; i++){
    for(int j = yy-1; j <= yy+1; j++){
      if(inBounds(i,j, settled) && settled[i][j] == false){
        Integer[] n = {i,j};
        options.add(n);
      }
    }
  }
  
  return options;
}

boolean inBounds(int x, int y, boolean[][] arr){
  return x >= 0 && x < arr.length && y >= 0 && y < arr[0].length;
}

color newColor(){
  //color[] cols = {#FF0000, #0000FF, #000000};
  //return cols[(int)random(cols.length)];
  return (int)random(255);
  //return color((int)random(255), 0, 0);
}

Integer coorToInt(int x, int y){
  return x + y * grid.length;
}

int[] intToCoor(Integer i){
  int[] c = {i % grid.length, (int)(i/grid.length)};
  return c;
}
