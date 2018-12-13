void setup() {
  size(500, 500);
  //size(960, 540); 
}

void draw() {
  frameRate(4);
  loadPixels();
  //make the unit of color range
  int i = width/255; 
  int j = height/255;
  float r = random(0, 255);

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      // go over each pixel to make my own gradient
      pixels[x+y*width] = color(x*i, y*j, i+j+r);
    }
  }
  updatePixels();
}
