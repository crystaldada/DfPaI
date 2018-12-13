class Line {
  PVector start, end;
  int boxesPerLine=20;
  Box[] boxes= new Box[boxesPerLine]; // make the boxes in an arrary to manage them in each line

  Line(PVector a, PVector b) {
    start = new PVector(a.x, a.y, a.z);
    end = new PVector(b.x, b.y, b.z);

    // setup boxes 
    for (int i=0; i<boxes.length; i++) {
      boxes[i] = new Box();
    }
  }

/* draw the line with boxes*/
  void draw() {
    for (Box b : boxes) {
      b.update(start, end);
      b.draw();
    }
  }
}
