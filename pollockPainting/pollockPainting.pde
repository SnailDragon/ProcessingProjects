//import java.util.LinkedHashSet;
//import java.util.Collections;
//import java.util.Iterator;

//color [][] grid;
////boolean [][] settled;
//LinkedHashSet<Integer> unsettled;
//ArrayList<Integer> coordinates;

//ArrayList<Integer> staged;

//int x, y;
//color col;

//int SPEEDFACTOR = 100;

//void setup(){
//  background(0);
//  noStroke();
//  size(960,540);
//  grid = new color[width][height];
//  //settled = new boolean[grid.length][grid[0].length];
//  unsettled = new LinkedHashSet<Integer>();
//  coordinates = new ArrayList<Integer>();
//  staged = new ArrayList<Integer>();
  
//  for(int i = 0; i < grid.length; i++){
//    for(int j = 0; j < grid[0].length; j++){
//      grid[i][j] = 0;//random(255);
//      //settled[i][j] = false;
//      coordinates.add(coorToInt(i,j));
//    }
//  }
  
//  for(int i = 0; i < coordinates.size(); i++){
//    Collections.swap(coordinates, i, (int)random(coordinates.size()));
//  }
  
//  for(int i : coordinates){
//    unsettled.add(i);
//  }

//  x = (int)random(grid.length);
//  y = (int)random(grid[0].length);
//  col = newColor(); //random(255);//grid[x][y];
//  //settled[x][y] = true;
//  unsettled.remove(coorToInt(x,y));
//  staged.add(coorToInt(x,y));
//  newt = false;
//}

//boolean newt = true;
//void draw(){ if(unsettled.size() > 0){
//  if(mousePressed) setup();
  
//  loadPixels();
//  for(Integer i : staged){
//    pixels[i] = col;
//  }
//  staged.clear();
//  updatePixels();
  
//  //displayGrid(grid);
//  for(int repetition = 0; repetition < SPEEDFACTOR; repetition++){
//    if(newt){
//      //do {
//      //  x = (int)random(grid.length);
//      //  y = (int)random(grid[0].length);
//      //} while(settled[x][y]); // or spread from an already spread spot with settled[x][y] == false
//      Iterator<Integer> iter = unsettled.iterator();
//      int n = iter.next();
//      int[] c = intToCoor(n);
//      x = c[0];
//      y = c[1];
//      unsettled.remove(n);
//      col = newColor(); //random(255);//grid[x][y];
//      staged.add(n);
//      //settled[x][y] = true;
//      newt = false;
//      //println("Now Spreading " + col + " from " + x + ", " + y + "|" + grid[x][y]);
//    }
    
//    ArrayList<Integer[]> options = getOptions(x,y);
    
//    if(options.size() == 0 || (int)random(1000) == 1){
//      newt = true;
//    }
//    else {
//      Integer[] choice = options.get((int)random(options.size()));
//      x = choice[0];
//      y = choice[1];
//      staged.add(coorToInt(x,y));
//      //grid[x][y] = col;
//      //settled[x][y] = true;
//      unsettled.remove(coorToInt(x,y));
//    }
//  }
//  println(frameRate);
//  saveFrame("zreds-########.png");
//}}

//void displayGrid(color[][] grid){
//  float h = height / grid[0].length;
//  float w = width / grid.length;
  
//  for(int i = 0; i < grid.length; i++){
//    for(int j = 0; j < grid[i].length; j++){
//      fill(grid[i][j]);
//      rect(i * w, j * h, w, h);
//    }
//  }
  
//}

//ArrayList<Integer[]> getOptions(int xx, int yy){
//  ArrayList<Integer[]> options = new ArrayList<Integer[]>();
  
//  for(int i = xx-1; i <= xx+1; i++){
//    for(int j = yy-1; j <= yy+1; j++){
//      //if(inBounds(i,j, settled) && settled[i][j] == false){
//      if(inBounds(i,j,grid) && unsettled.contains(coorToInt(i,j))){
//        Integer[] n = {i,j};
//        options.add(n);
//      }
//    }
//  }
  
//  return options;
//}

//boolean inBounds(int x, int y, color[][] arr){
//  return x >= 0 && x < arr.length && y >= 0 && y < arr[0].length;
//}

//color newColor(){
//  //color[] cols = {#FF0000, #0000FF, #000000};
//  //return cols[(int)random(cols.length)];
//  //return (int)random(255);
//  return color((int)random(255), 0, 0);
//}

//Integer coorToInt(int x, int y){
//  return x + y * grid.length;
//}

//int[] intToCoor(Integer i){
//  int[] c = {i % grid.length, (int)(i/grid.length)};
//  return c;
//}
