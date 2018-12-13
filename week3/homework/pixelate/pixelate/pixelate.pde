PImage img;
int pixelate = 20; //decide how much we want to pixelate the picture

void setup() {
  //size(960, 540); 
  size(500, 500);
  img = loadImage("hand.jpg");
  background(209,218,247);//pale purple
}

void draw() {

  /*go through every 5 pixels of all the iamge's pixels*/
  for (int x = 0; x < img.width; x += pixelate) {
    for (int y = 0; y < img.height; y += pixelate) {
      int loc = x + y*img.width;

      /*Look up the RGB color value at source image's location*/
      loadPixels();
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      updatePixels();

      /* Draw an square at that location with that color with the pixalate value as the length*/
      noStroke();
      fill(r, g, b);
      rect(x, y, pixelate, pixelate);
    }
  }
}
