
class Snowflake {
  
  float x, y, variation, size, speed, variationspeed;
  float[] mutations;
  float layer = 0;
  
  Snowflake(float xIn, float yIn, float sizeIn, float speedIn){
    x = xIn;
    y = yIn;
    size = sizeIn;
    speed = speedIn;
    variation = 0;
    variationspeed = random(-variation, variation);
    mutations = new float[4];
    for(int i = 0; i < mutations.length; i++){
      mutations[i] = random(-2,2);
    }
  }
  
  Snowflake(float xIn, float yIn, float sizeIn, float speedIn, float variationIn){
    x = xIn;
    y = yIn;
    size = sizeIn;
    speed = speedIn;
    variation = variationIn;
    variationspeed = random(-variation, variation);
    mutations = new float[4];
    for(int i = 0; i < mutations.length; i++){
      mutations[i] = random(-2,2);
    }
  }
  
  void update(ArrayList<Snowflake> flakes){
    y += speed;
    x += variationspeed;
  
    layer = (flakes.size() / 500) + 5;
    if(y > height-layer){ // unfinished - make it so that it builds up on the bottom of the screen
      speed = 0;
      variationspeed = 0;
    }
    
    
    
    if(((int)y) % 10 < random(2)){
      variationspeed = random(-variation, variation);
    }
  }
  
  float getLayer(){
    return layer;
  }
  
  void display(){
    noStroke();
    fill(255);
    circle(x, y, size);
    circle(x+mutations[0], y+mutations[1], size);
    circle(x+mutations[2], y+mutations[3], size);
    
  }
  
  
  
  
}
