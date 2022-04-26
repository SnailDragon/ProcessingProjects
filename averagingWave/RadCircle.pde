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
    //for(float i : lens){
    //  print(i + " ");
    //}
    //println();
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
