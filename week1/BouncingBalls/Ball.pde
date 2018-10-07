class Ball {
  PVector pos, vel;
  PVector mouse;
  //PVector theMouse, thePrevMouse;
  PVector theVel;
  //float thePrevVel, theVel;
  float radius;
  //float theEasing = 10;

  Ball(float x, float y, float _radius) {
    pos = new PVector(x, y);
    vel = new PVector((random(-3, 3)), (random(-3, 3)));
    radius = _radius;
    mouse = new PVector(mouseX, mouseY);
    //theMouse = new PVector(mouseX, mouseY);
    //thePrevMouse = new PVector(pmouseX, pmouseY);
    theVel = new PVector ((mouse.x-pos.x), (mouse.y - pos.y));
    theVel.normalize();
    //theVel = new PVector((theMouse.x - thePrevMouse.x) * theEasing, (theMouse.y - thePrevMouse.y) * theEasing);
    //thePrevVel = theEasing * theMouse.dist(thePrevMouse);
    //theVel -= (theVel - thePrevVel) / theEasing;
  }

  void draw() {
    ellipse(pos.x, pos.y, radius, radius);
  }

  void update() {
    pos.add(vel);

    if (pos.x < radius || pos.x > width - radius) {
      vel.x *= -1;
    }
    if (pos.y < radius || pos.y > height - radius) {
      vel.y *= -1;
    }
    if (mousePressed) {
      pos.add(theVel);
      //ellipse(pos.x - theVel, pos.y - theVel, radius, radius);
    }
  }
}
