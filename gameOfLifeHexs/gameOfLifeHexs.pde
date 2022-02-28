int[][] hexes;
int HEXCOUNT = height/10;


void setup(){
	size(960,540);
	background(100);
	fill(0);
	stroke(0);
	println(HEXCOUNT);
	println(HEXCOUNT * ((float)width/height));
	println(width/height);
	hexes = new int[ceil(HEXCOUNT * ((float)width/height))][HEXCOUNT];
	println(hexes.length);
	println(hexes[0].length);
	for(int i = 0; i < hexes.length; i++){
		for (int j = 0; j < hexes[0].length; j++){
			hexes[i][j] = #0000FF;
		}
	}
	

}


void draw(){
	background(100);
	DisplayHexes(hexes);
	

}

void DisplayHexes(int[][] hexes){
	float yit = height / hexes[0].length;
	float xit = width / hexes.length;

	for(int i = 0; i < hexes.length; i++){
		for (int j = 0; j < hexes[0].length; j++){
			fill(hexes[i][j]);
			if (i % 2 == 0) hexagon((i+0.5) * xit,(j+0.5) * yit,yit);
			else hexagon((i+0.5) * xit, (j+1) * yit, yit);
		}
	}
}

void hexagon(float x, float y, float h){
	beginShape();

	h = h/2 / cos(PI/6); 	
	for(float i = PI/6+PI/2; i < 2*PI+PI/6+PI/2; i += (2*PI)/6){
		vertex(x + h * cos(i), y + h * sin(i));
	}
	endShape(); 

}
	
