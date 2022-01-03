PImage img;

void setup(){ 
	size(920,540);
	background(0);
	
	img = loadImage("thewavesmall.jpg");
	
	img.loadPixels();
	for(int i = 0; i < img.width-1; i++){
		for(int j = 0; j < img.height-1; j++){
			int temp = img.pixels[i + j*img.width];
			img.pixels[i + j*img.width] = img.pixels[i+1 + j*img.width];
			img.pixels[i+1 + j*img.width] = img.pixels[i+1 + (j+1)*img.width];
			img.pixels[i+1 + (j+1)*img.width] = img.pixels[i + (j+1)*img.width];
			img.pixels[i + (j+1)*img.width] = temp;
		}
	}

}
 



void draw(){
	image(img, 0, 0, img.width, img.height);
}
