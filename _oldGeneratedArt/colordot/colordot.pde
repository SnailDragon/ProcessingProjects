ColorDot[] mainColorDotList = new ColorDot[100];
float r = 12;
float speed = 1;
int[] colors = {#FF0000, #FFFF00, #008000, #0000FF, #FFFFFF, #f5deb3, #00cdcd};
//int[] colors = {#FFFFFF, #519872, #D30C7B, #3A2D32, #FAA613, #72A1E5, #256EFF};
int colorCount = colors.length;
int hitCount = 0;

void setup(){
  size(960,540);
  background(0);
  fill(255);
  noStroke();
  
  println();
  for(int i=0; i<mainColorDotList.length;i++){
      mainColorDotList[i] = new ColorDot(random(width),random(height), i, mainColorDotList);
      print(mainColorDotList[i].colorNum);
  }
  println();
  
  for(ColorDot dot : mainColorDotList){
    dot.begin();
  }
  
  //mainColorDotList[0].colorNum = 4;
  //println(mainColorDotList[0].colorNum);
  
}

int it = 0;
float opacity = 0.1;

void draw(){
  if(allSame(mainColorDotList)){
    fill(0,opacity);
    rect(0,0,width,height);
    
    if(opacity > 5) {
      fill(255);
      String changes = "Color Changes: " + hitCount;
      textAlign(CENTER);
      text(changes, width/2, height/2);
      fill(0);
    }
    else{
      opacity = opacity * 1.1;
      println(opacity);
    }
  }
  else{
    background(0);
    print(it + ": \t");
    for(ColorDot dot : mainColorDotList){
      dot.collide();
      dot.move();
      dot.display();
      //print(dot.colorNum);
    }
    it++;
    print("\t" + hitCount);
    println();
  }
  
}

boolean allSame(ColorDot[] dotList){
  boolean same = true;
  for(int i=0; i<dotList.length; i++){
    if(dotList[i].colorNum != dotList[0].colorNum){
      same = false;
    }
    
  }
  return same;
}

class ColorDot {
  float x,y;
  float vy = 0;
  float vx = 0;
  int colorNum;
  
  int id;
  ColorDot[] others;
  
  ColorDot(float conx, float cony, int idin, ColorDot[] othersin ){
    x = conx;
    y = cony;
    id = idin;
    others = othersin;
    colorNum = (int)random(colorCount);
    //println(colorNum);
    circle(x,y,r);
  }
  
  void begin(){
    if(random(10)>5) vy = speed;
    else vy = -speed;
    if(random(10)>5) vx = speed;
    else vx = -speed;
  }
  
  float[] getPos(){
    float[] pos = {x,y};
    return pos;
  }
  
  void collide() {
    for(int i = id + 1; i < mainColorDotList.length; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      if(distance < r){
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * r;
        float targetY = y + sin(angle) * r;
        float ax = (targetX - others[i].x);
        float ay = (targetY - others[i].y);
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
        //if(colorNum == 4 || others[i].colorNum == 4){
        //  others[i].colorNum = 4;//(int)random(7);
        //  colorNum = 4;
        //}
        float chance = random(1);
        if(others[i].colorNum != colorNum) hitCount++;
        if(chance > .5) others[i].colorNum = colorNum;
        else colorNum = others[i].colorNum; 
        
        
      }
    }
  }
  
  void move(){
     if(vx > speed*2) vx = speed*2;
     if(vy > speed*2) vy = speed*2;
     x += vx;
     y += vy;
     if(x + r/2 > width){
       x = width - r/2;
       vx *= -1;
     }
     if(x -r/2 < 0){
       x = r/2;
       vx *= -1;
     }
     if(y + r/2 > height){
       y = height - r/2;
       vy *= -1;
     }
     if(y - r/2 < 0){
       y = r/2;
       vy *= -1;
     }
     
     
  }
  
  void display(){
    fill(colors[colorNum]);
    circle(x,y,r);
    fill(255);
  }
}
