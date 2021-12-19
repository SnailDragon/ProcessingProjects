//CelestialBody[] bodies = new CelestialBody[500];

//void setup(){
//  size(960,520);
//  background(0);
//  noStroke();
  
//  for(int i = 0; i < bodies.length; i++){
//    bodies[i] = new Star(random(2*PI), random(10, width), random(1,7), (int)random(0,255));
//  }
  
//  for(int i = 0; i < 3; i++){
//    bodies[i] = new Cloud(random(2*PI), random(100,width), random(PI/2), random(100), random(0,50));
//  }
  
//}

//float orient = 0;
//void draw(){
//  background(0);
//  translate(width/2, height);
//  for(CelestialBody body : bodies){
//    body.display(orient);
//  }
//  orient += 0.01;
  
//  Twinkle();
  
//  println(frameRate);
//}



//void Twinkle(){
//  loadPixels();
//  for(int i = 0; i < pixels.length-10-width; i += 10){
//    int temp = pixels[i];
//    for(int j = 1; j < 10; j++){
//      pixels[i+j] = pixels[i+j+1];
//    }
//    pixels[i+11] = temp;
    
//    for(int j = 1; j < 2; j++){
//      pixels[i+j*width] = pixels[i+j*width+1];
//    }
//    pixels[i+11] = temp;
//  }
//  updatePixels();
  
//}
