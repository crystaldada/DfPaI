/*Create 100 balls with an array*/
int numBalls = 50;
float spring = 0.03;
Ball[] balls = new Ball[numBalls];

/*assign each ball a random radius and position*/
void setup() {
  //size(500, 500);  
  size(960, 540); 
  for (int i = 0; i < balls.length; i++) {
    float radius = random(10, 20);
    float x = random(radius, width - radius);
    float y = random(radius, height - radius);
    balls[i] = new Ball(x, y, random(14, 26), i, balls); 
  }
  noStroke();
}

/*call functions on the Ball to make it bounce off each other and bounce off the edge*/
void draw() {
  background(0);
  //frameRate(30);
  for (Ball ball : balls) {
    ball.collide();
    ball.followMouse();
    ball.update();
    ball.display();
  }
}
