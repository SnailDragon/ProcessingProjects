
class Cloud extends CelestialBody {
  
  float sweep, thickness, brightness;
  float[][] buildingCircles;
  
  Cloud (float thetaIn, float rIn, float sweepIn, float thicknessIn, float brightnessIn){
    super(thetaIn, rIn);
    sweep = sweepIn;
    thickness = thicknessIn;
    brightness = brightnessIn;
    buildingCircles = new float[(int)(sweep*thickness*20)][3];
    for(int i = 0; i < buildingCircles.length; i++){
	buildingCircles[i][0] = r + random(-thickness, thickness);
	buildingCircles[i][1] = theta + random(-sweep, sweep);
	buildingCircles[i][0] = buildingCircles[i][0] / (buildingCircles[i][1] - theta);
	buildingCircles[i][2] = brightness + random(-50,50);
	
    }
    
  }
  
  void display(float orientation){
    for(int i = 0; i < buildingCircles.length; i++){
      fill(buildingCircles[i][2]);
      float x = buildingCircles[i][0] * cos(buildingCircles[i][1] + orientation);
      float y = buildingCircles[i][0] * sin(buildingCircles[i][1] + orientation);
      circle(x, y, 5);
    }
    
  }
}
