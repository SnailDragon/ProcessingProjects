

class Snake {
  int len, segs, radius;
  int[] x;
  int[] y;
  float lastDirectionAngle = 0;
  
  
  Snake(int lenin, int segsin, int radiusin){
    len = lenin;
    segs = segsin;
    radius = radiusin;
    x = new int[segs];
    y = new int[segs];
    
    for(int i=0; i<x.length; i++){
     x[i] = width/2;
     y[i] = height/2;
    }
  }
  
  Snake(int lenin, int segsin, int radiusin, int startx, int starty){
    len = lenin;
    segs = segsin;
    radius = radiusin;
    x = new int[segs];
    y = new int[segs];
    
    for(int i=0; i<x.length; i++){
     x[i] = startx;
     y[i] = starty;
    }
  }
  
  int[] getX(){
    return x;
  }
  
  int[] getY(){
    return y;
  }
  
  void move(){
    for(int i=x.length-1; i>0; i--){
      x[i] = x[i-1];
      y[i] = y[i-1];
    }
    
    float directionAngle = random(lastDirectionAngle-PI/6,lastDirectionAngle+PI/6);
    lastDirectionAngle = directionAngle;
    
    x[0] += len * cos(directionAngle);
    y[0] += len * sin(directionAngle);
    
    
    if(x[0] > width) x[0] = width-2;
    else if(x[0] < 0) x[0] = 2;
    if(y[0] > height) y[0] = height-2;
    else if(y[0] < 0) y[0] = 2;
    
    //print("\t\t" + x[0] + ", " + y[0]);
  }
  
  void display(){
    fill(255);
    stroke(150);
    for(int i=x.length-1; i>0; i--){
      //print(i + "\t");
      //println(x[i] + "\t" + y[i]);
      circle(x[i],y[i],radius);
    }
  }
  
  void display(int fillin, int strokein){
    fill(fillin);
    stroke(strokein);
    for(int i=x.length-1; i>=0; i--){
      circle(x[i],y[i],radius);
    }
  }
  
  void display(int col){
    fill(col);
    stroke(col);
    for(int i=x.length-1; i>=0; i--){
      circle(x[i],y[i],radius);
    }
  }
  
    
}
