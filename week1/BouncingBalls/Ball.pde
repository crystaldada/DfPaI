class Ball {
  float x, y;
  PVector pos, vel;
  PVector mouse;
  PVector theVel;
  float radius;
  int id=0;
  color c;
  Ball[] others;

  /*constructor*/
  Ball(float _x, float _y, float _radius, int _id, Ball[] _others) {
    radius = _radius;
    id = _id;
    x = _x;
    y = _y;
    others = _others;
    pos = new PVector(x, y);
    vel = new PVector((random(-3, 3)), (random(-3, 3))); // gives ball random direction to move
    c = color(random(255), random(255), random(255), random(255));
  }

  /*bounce off each other*/
  void collide() {

    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy); //get the distance between the two ball's center
      float minDist = others[i].radius + radius; // calculate how far the centers are when one ball touches another 

      //compare the two numbers to see if two balls meet
      if (distance < minDist) {
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        //change the direction of the balls
        vel.x -= ax;
        vel.y -= ay;
        others[i].vel.x += ax;
        others[i].vel.y += ay;
      }
    }
  }


  //bounce off the edge
  void update() {
    pos.add(vel);
    x += vel.x;
    y += vel.y;

    if (pos.x < radius || pos.x > width - radius) {
      vel.x *= -1;
    }
    if (pos.y < radius || pos.y > height - radius) {
      vel.y *= -1;
    }
  }

  //follow mouse when you press the cursor 
  void followMouse() {
    
    mouse = new PVector(mouseX, mouseY);
    theVel = new PVector ((mouse.x - pos.x), (mouse.y - pos.y));
    theVel.normalize(); // make it a unit vector 

    if (mousePressed) {
      pos.add(theVel);
      println(theVel);
    }
  }


  //draw the each ball with a different color
  void display() {
    fill(c);
    ellipse(pos.x, pos.y, radius, radius);
  }
}
