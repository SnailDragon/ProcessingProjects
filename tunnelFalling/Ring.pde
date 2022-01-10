
class Ring {

    float x,y,r,w;

    Ring(float xIn, float yIn, float rIn){
        x = xIn;
        x = yIn;
        r = rIn;
        w = 10;
    }

    void Update(float xIn, float yIn){
        x = xIn;
        y = yIn;
        if(x+r > width && x-r < 0){
            r = 0.0;
            w = 10;
        }
        else{
            r += 1000.0/r + 1;
            w = pow(r/20,1.03);
        }
    }

    void Display(){
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

}