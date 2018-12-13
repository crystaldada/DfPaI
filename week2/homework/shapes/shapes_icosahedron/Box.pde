class Box {
  float boxSize = 3.0;
  float amt, vel;
  PVector pos;

  Box() {
    vel = random(0.001); //give it a vel so that it can make the box move along the line
    amt = random(1);  // box's position should be between start and end point
  }

//move the box along the x,y,z axis
  void update(PVector start, PVector end) {
    float x = lerp(start.x, end.x, amt);
    float y = lerp(start.y, end.y, amt);
    float z = lerp(start.z, end.z, amt);

    pos = new PVector(x, y, z);
    amt += vel;
    //make it move back and forth
    if (amt > 1) {
      amt = 0;
    }
  }


  void draw() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(boxSize);
    popMatrix();
  }
}
