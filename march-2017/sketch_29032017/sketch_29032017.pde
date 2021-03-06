float a;
Box b;

ArrayList<Box> sponge;
void setup(){
  size(500,500,P3D);
  sponge = new ArrayList<Box>();
  smooth();
  b = new Box(0,0,0,200);
  sponge.add(b);
}

void draw(){
  background(6,7,175);
  stroke(255);
  noFill();
  
  translate(width/2, height/2);
  rotateX(a);
  rotateZ(a);
  for(Box b : sponge) {
  b.show();
  }
  a+=0.01;
}

void mousePressed(){
  ArrayList<Box> next = new ArrayList<Box>(); 
  for(Box b : sponge){
  ArrayList<Box> newBoxes = b.generate();
  next.addAll(newBoxes); 
  }
  sponge = next;
}