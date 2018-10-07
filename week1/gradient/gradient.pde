void setup() {

  size(500, 500);
}

void draw() {
  loadPixels();
  int i = width/255; 
  int j = height / 255;
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      pixels[x+y*width] = color(x*i, y*j, x+y/2);
    }
  }


  updatePixels();
}
