Ring[] rings = new Ring[15];
float x,y;

void setup(){
	size(960, 540);
	background(0);
	fill(255);
	stroke(255);

	x = random(200, width-200);
	y = random(200, height-200);

	for(int i = 0; i < rings.length; i++){
		rings[i] = new Ring(x,y, i * ((width+100)/rings.length));
	}
	
}

float it = 0;
void draw(){
	//DrawTunnel(x, y, it);
	background(0);
	for(Ring r : rings){
		r.Update(x,y);
		r.Display();
	}
	
	MoveXY();

	it++;
	println(frameRate + "\t" + it);	
}

float SPEEDX = 1;
float SPEEDY = 1;
void MoveXY(){
	x += SPEEDX;
	y += SPEEDY;
	if(x > width-100 || x < 100) SPEEDX *= -1;
	if(y > height-100 || y < 100) SPEEDY *= -1;
}

void DrawTunnel(float x, float y, float it){
	float size = 10;
	while(size < width+100){
		fill(255);
		stroke(255);
		Ring(x,y,size, size/8);		
		size += 100;
	}
}

// (x,y) of center, r = to inner edge
void Ring(float x, float y, float r, float w){
	float res = PI / 30;
	beginShape();
	
	for(float i = 0; i < 2*PI; i += res){
		vertex(x + (r+w) * cos(i), y + (r+w) * sin(i));		
	}

	beginContour();
	for(float i = 2*PI; i >= 0; i -= res){
		vertex(x + r * cos(i), y + r * sin(i));
	}
	endContour();

	endShape();
}


