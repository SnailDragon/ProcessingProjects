float[][] grid;
int DENSITY = 50;

void setup(){
	size(960,540);
	background(0);
	stroke(255);
	grid = new float[width/DENSITY][height/DENSITY];
	for(int i = 1; i < grid.length; i++){
		for(int j = 1; j < grid[0].length; j++){
			grid[i][j] = 0;
		}
	}
}

void draw(){
	background(0);
	DisplayField(grid);

	for(int i = 0; i < grid.length; i++){
		for(int j = 0; j < grid[0].length; j++){
			grid[i][j] += (1.0/100.0) * ((i - grid.length/2) + (j - grid[0].length/2)) + 0.001;
		}
	}
	
	println(frameRate);
}

void DisplayField(float[][] grid){
	for(int i = 1; i < grid.length; i++){
		for(int j = 1; j < grid[0].length; j++){
			float x = i * width/grid.length;
			float y = j * height/grid[0].length;
			float startX = x - (width/grid.length)/2.0 * cos(grid[i][j]);
			float startY = y - (height/grid[0].length)/2.0 * sin(grid[i][j]);
			float endX = x + (width/grid.length)/2.0 * cos(grid[i][j]);
			float endY = y + (height/grid[0].length)/2.0 * sin(grid[i][j]);	
			line(startX, startY, endX, endY);
		}
	}
}

