import processing.video.*;

PImage background;
PImage img;
Capture capture;

float threshold = 220;

void setup() {
  size(960, 540); 
  //size(640, 480);

  capture = new Capture(this, width, height); //start video input

  capture.start(); // start capturing the images from the camera

  img = loadImage("pink.jpg"); // load foreground image from the file
  background = createImage(capture.width, capture.height, RGB); //load the camera image as the background image
}



void draw() {

  if (capture.available()) {
    capture.read(); // Read a new camera frame

    if (background != null) {

      loadPixels(); 

      capture.loadPixels(); // Make the pixels of camera available
      background.loadPixels();


      /*get each pixel's color in the video frame*/
      for (int x = 0; x < capture.width; x++ ) {
        for (int y = 0; y < capture.height; y++ ) {
          int loc = x + y*capture.width; 

          /* Fetch the current color in that location, 
           the color of the background in that spot,
           and also of the loaded image*/
          color foregroundColor = capture.pixels[loc];
          color backgroundColor = background.pixels[loc];
          color imgColor=img.pixels[loc];

          /* Extract the red, green, and blue components of the current pixel's color and that of the background*/
          float r1 = red(foregroundColor);
          float g1 = green(foregroundColor);
          float b1 = blue(foregroundColor);
          float r2 = red(backgroundColor);
          float g2 = green(backgroundColor);
          float b2 = blue(backgroundColor);

          /* Compute the difference of the red, green, and blue values*/
          float diff = dist(r1, g1, b1, r2, g2, b2);

          /* Compare the value with threshold and only leaves the figure outline*/
          if (diff > threshold) {
            pixels[loc] = foregroundColor;
          } else {
            pixels[loc] = imgColor;
          }
        }
      }
      updatePixels(); // Notify that the pixels[] array has changed
    } else {
      image(capture, 0, 0);
    }
  }
}

/* When a key is pressed, capture the image into the background*/
void keyPressed() {
  background = capture.copy();
}
