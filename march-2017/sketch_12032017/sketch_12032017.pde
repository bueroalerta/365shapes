int cols, rows;
int scl = 10;
int w = 250;
int h = 450;
float[][] terrain;
float flying = 0;
void setup(){
  size(500,500, P3D);
  smooth();
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
}

void draw(){
  flying -= 0.005;
  float yoff = flying;
  for(int y = 0; y<rows; y++){
    float xoff = flying;
    for(int x = 0; x<cols; x++){
       terrain[x][y] = map(noise(xoff,yoff), 0,1,-20,20);
       xoff += 0.2;
    }
    yoff += 0.2; 
  }
  
  background(6,7,175);
  stroke(255);
  noFill();
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for(int y = 0; y<rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x<cols; x++){
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}