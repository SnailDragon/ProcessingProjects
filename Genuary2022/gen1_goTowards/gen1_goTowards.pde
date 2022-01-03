
float x;
float y;

float destX;
float destY;

float SPEED = 5;

void setup(){
	size(920,540);
	background(0);

	x = random(width);
	y = random(height);

	destX = random(width);
	destY = random(height);
 
}

void draw(){
	background(0);
	
	float xDist = destX - x;
	float yDist = destY - y;

	float newX;
	float newY;	
	do {
		float theta = random(2 * PI);	
		newX = x + SPEED * cos(theta);
		newY = y + SPEED * sin(theta);
	} while (dist(x, y, destX, destY) > dist(newX, newY, destX, destY)); 


	fill(150);
	circle(destX, destY, 10);
	fill(255);
	circle(x, y, 10);  

	frameRate(15);

	if(mousePressed) setup();
}
