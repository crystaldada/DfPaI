void setup() {
  //size(960, 540); 
  size(500, 500);
  background(0);
}

/*nested loop to draw the grid*/
void draw() {
  for ( int x = 0; x < 10; x++) {
    for (int y = 0; y < 10; y++) {
      smilingFace(x*50+20, y*50+20); //make it each smiley face the same distance from each other
    }
  }
}

/*draw the smiley with a function*/
void smilingFace(int x, int y) {
  fill(255, 255, 0);
  ellipse( x, y, 20, 20);
  ellipse( x-5, y-5, 2, 2);
  ellipse( x+5, y-5, 2, 2);
  noFill();
  arc(x, y, 10, 10, 0, PI);
}
