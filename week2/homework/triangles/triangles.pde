class Triangle {
  PVector pos;
  float rotation;

//constructor
  Triangle(float x, float y) {
    pos = new PVector(x, y);
    rotation = 0.0;
  }

  void triangledraw() {
    stroke(255, 0, 120); //pink 
    fill(255);
    strokeWeight(1);

    pushMatrix();
    translate(pos.x, pos.y); //translate the origin to the current location (for the grid)
    rotate(rotation+ PI/2); //offset the rotation by 90 degrees 
    scale(2, 2);
    triangle(-5, 2, 5, 2, 0, -10);
    popMatrix();
  }

  void turn(float x, float y) {
    float a = atan2(y-pos.y, x-pos.x); //get the radian of how much the triangle would towards the mouse
    rotation = a;
  }
}

/*use arraylist to store all the triangles so that we can easily add triangles and call for them*/
ArrayList<Triangle> triangles = new ArrayList<Triangle>();

void setup() {
  //size(500, 500);
  size(960, 540); 
  int N = 20;
  int spacing = width / (N + 1); //to keep it within the window

//add triangle according to the the grid system
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      triangles.add(new Triangle( 50+ i * (spacing + 1), j * (spacing + 1)));
    }
  }
}

/*call functions upon each triangle*/
void draw() {
  background(0);
  for (Triangle t : triangles) {
    t.turn(mouseX, mouseY);
    t.triangledraw();
  }
}
