class Icosahedron {
  ArrayList<Line> sides=new ArrayList<Line>(); // make an arraylist to store all the lines
  float halfLen;
  float halfInterLen;

  Icosahedron(float len) {
    /*to all the points with the length of a side of a icosahedron*/
    halfLen=len/2;
    halfInterLen=len*(1+sqrt(5))/4;

    /*find each point's location on a icosahedron*/
    PVector vertex1=new PVector (-halfLen, halfInterLen, 0);
    PVector vertex2=new PVector (halfLen, halfInterLen, 0);
    PVector vertex3=new PVector (halfLen, -halfInterLen, 0);
    PVector vertex4=new PVector (-halfLen, -halfInterLen, 0);
    PVector vertex5=new PVector (halfInterLen, 0, halfLen);
    PVector vertex6=new PVector (halfInterLen, 0, -halfLen);
    PVector vertex7=new PVector (-halfInterLen, 0, -halfLen);
    PVector vertex8=new PVector (-halfInterLen, 0, halfLen);
    PVector vertex9=new PVector (0, halfLen, halfInterLen);
    PVector vertex10=new PVector (0, -halfLen, halfInterLen);
    PVector vertex11=new PVector (0, -halfLen, -halfInterLen);
    PVector vertex12=new PVector (0, halfLen, -halfInterLen);

    /*connect each two points with a line*/
    sides.add(new Line(vertex1, vertex2));
    sides.add(new Line(vertex1, vertex7));
    sides.add(new Line(vertex1, vertex8));
    sides.add(new Line(vertex1, vertex9));
    sides.add(new Line(vertex1, vertex12));
    sides.add(new Line(vertex2, vertex5));
    sides.add(new Line(vertex2, vertex6));
    sides.add(new Line(vertex2, vertex9));
    sides.add(new Line(vertex2, vertex12));
    sides.add(new Line(vertex3, vertex4));
    sides.add(new Line(vertex3, vertex5));
    sides.add(new Line(vertex3, vertex6));
    sides.add(new Line(vertex3, vertex10));
    sides.add(new Line(vertex3, vertex11));
    sides.add(new Line(vertex4, vertex7));
    sides.add(new Line(vertex4, vertex8));
    sides.add(new Line(vertex4, vertex10));
    sides.add(new Line(vertex4, vertex11));
    sides.add(new Line(vertex5, vertex6));
    sides.add(new Line(vertex5, vertex9));
    sides.add(new Line(vertex5, vertex10));
    sides.add(new Line(vertex6, vertex11));
    sides.add(new Line(vertex6, vertex12));
    sides.add(new Line(vertex7, vertex8));
    sides.add(new Line(vertex7, vertex11));
    sides.add(new Line(vertex7, vertex12));
    sides.add(new Line(vertex8, vertex9));
    sides.add(new Line(vertex8, vertex10));
    sides.add(new Line(vertex9, vertex10));
    sides.add(new Line(vertex11, vertex12));
  }

  /*draw the line using calling class Line's function*/
  void draw() {
    for (Line s : sides) {
      s.draw();
    }
  }
}
