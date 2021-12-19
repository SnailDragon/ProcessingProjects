
abstract class CelestialBody {
  
  float theta, r;
  
  CelestialBody (float thetaIn, float rIn){
    theta = thetaIn;
    r = rIn;
  }
  
  abstract void display(float orientation);
  
}
