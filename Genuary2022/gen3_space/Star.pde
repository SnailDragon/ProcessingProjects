
class Star extends CelestialBody {
  
  float size;
  int brightness;
  
  Star(float thetaIn, float rIn, float sizeIn, int brightnessIn){
    super(thetaIn,rIn);
    size = sizeIn;
    brightness = brightnessIn;
  }
  
  void display(float orientation){
    float x = r * cos(theta+orientation);
    float y = r * sin(theta+orientation);
    fill(brightness);
    circle(x, y, size);
  }
  
}
