Icosahedron ico1;

int count = 0;
float cubeSideLength = 300;

void setup() {
  size(960, 540, P3D); 
  //size(640, 360, P3D);
  ico1 = new Icosahedron(cubeSideLength); // use 
  noStroke();
  fill(250, 50);
  blendMode(ADD);
}

void draw() {
  background(30);
  translate(width/2, height/2, 0); // make the center of the windows as the origin
  scale(sin(count*0.01)); //to make the icosaherdron contract from the center 
  count++; //make it an infinite loop
  pushMatrix();
  /*make the icosahedron rotate*/
  rotateX(frameCount*PI/185); 
  rotateY(frameCount*PI/-200); 
  ico1.draw(); // create the icosahedron
  //be1.create();
  popMatrix();
}
