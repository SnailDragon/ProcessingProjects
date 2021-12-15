ArrayList<Snowflake> flakes = new ArrayList<Snowflake>(1);
float SIZE = 5;
float SPEED = 3;
float VARIATION = 2;
int MAX_FLAKES = 10000;
int INTENSITY = 4;

float[] bumps = new float[width*2];

void setup(){
  size(960,580);
  background(0);
  
  for(int i = 0; i < flakes.size(); i++){ // size, speed, variation
    flakes.set(i, new Snowflake(random(width), -10, SIZE, SPEED, VARIATION));
  }
  
  for(int i = 0; i < bumps.length; i++){
    bumps[i] = i * (width/bumps.length);
  }
  
}

int flakeCount = 0;
void draw(){
  background(0);
  
  for(Snowflake f : flakes){
    f.update(flakes);
    f.display();
    fill(255);
    rect(0,height-(f.getLayer()-7), width, height);
  }
  
  for(int i = 0; i < bumps.length && flakes.size() > 1; i++){
      circle(bumps[i], height-((flakes.get(0).getLayer())-8), SIZE);
  }
  
  
  for(int i = 0; i < INTENSITY; i++){
    if(random(100) < 4 && flakeCount < MAX_FLAKES){
      flakes.add(new Snowflake(random(width), -10, SIZE, SPEED, VARIATION));
      flakeCount++;
    }
  }
  

  
  if(INTENSITY < 40 && random(100) < 4) INTENSITY++;
  
  println(frameRate);

}
