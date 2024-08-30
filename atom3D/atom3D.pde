Sphere center; 
Sphere orbiter; 

void setup(){
  background(0); 
  size(400, 400, P3D);
  noStroke();
  //lights();
  
  center = new Sphere(50);
  center.col = color(255,0,0); 
  orbiter = new Sphere(100,0,0,20); 
  orbiter.col = color(0,255,0); 
}

float t = 0; 
float incl = 30 * (PI / 180.0); 
void draw(){
  background(0); 
  
  orbiter.x = 100 * sin(t) * cos(incl); 
  orbiter.y = 100 * sin(t) * sin(incl); 
  orbiter.z = 100 * cos(t);
  
  
  center.display(); 
  orbiter.display(); 
  t += 0.05; 
  incl = t*2 * (PI / 180.0); 
}
