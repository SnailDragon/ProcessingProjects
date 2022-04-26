// IDEA - cityscape on a circle - 
//loops around and draws a new one again and again

RadCircle circ; 

void setup(){
  size(960,540);
  background(0);
  
  circ = new RadCircle(1, 100);
}

float it = 0;
void draw(){
  //wiper
  background(0);
  circ.display();
  
  circ.shiftFront((25 * mod1(it) + abs(150*mod2(it))+100) / 1.4);
  it += PI / 10;
  //println(frameRate);
}

float mod1(float num){
  return cos(num) + sin(num / pow(1.001, num));
}

float mod2(float num){
  return cos(num / 100);
}

class RadCircle {
  
  ArrayList<Float> lens;
  ArrayList<Integer> cols;
  float cx, cy;
  
  RadCircle(float resFactor, float starter){
    lens = new ArrayList<Float>();
    for(int i = 0; i < 360*resFactor; i++){
      lens.add(starter);
    }
    cx = width/2;
    cy = height/2;
    cols = new ArrayList<Integer>();
    float col = 0;
    for(int i = 0; i < lens.size(); i++){
      if(i <= (lens.size() / 2.0)) col += (255.0) / (lens.size()/2.0);
      else col -= (255.0) / (lens.size()/2.0);
      
      if(col < 0) cols.add(0);
      else if(col > 255) cols.add(255);
      else cols.add((int)col);
    }
  }
  
  int getRes(){
    return lens.size();
  }
  
  void shiftFront(float len){
    lens.add(0, len);
    lens.remove(lens.size()-1);
  }
  
  void display(){
    for(float i : cols){
      print(i + " ");
    }
    println();
    fill(255);
    translate(cx, cy);
    for(int i = 0; i < lens.size()-1; i++){
      float theta = 2*PI / lens.size() * i;
      float theta2 = 2*PI / lens.size() * (i+1);
      //noStroke();
      //circle(lens.get(i) * cos(theta), lens.get(i) * sin(theta), 10);
      stroke(cols.get(i));
      strokeWeight(10);
      line(lens.get(i) * cos(theta), lens.get(i) * sin(theta), lens.get(i+1) * cos(theta2), lens.get(i+1) * sin(theta2)); 
      //theta += 2*PI / lens.size();
    }
  }
  
}
