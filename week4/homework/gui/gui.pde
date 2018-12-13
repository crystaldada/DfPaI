import controlP5.*;


ControlP5 cp5;

int ballColor_r = 100;
int ballColor_g = 100;
int ballColor_b = 100;
int moveBall_x = 100;
int moveBall_y = 100;
int r, g, b;
int x, y;

void setup() {

  size(960, 540); 
  //size(500, 500);
  noStroke();

  cp5 = new ControlP5(this);

  /*add three horizontal sliders, the value of the sliders will be linked to variables that control the ball's color*/ 
  cp5.addSlider("ballColor_r")
    .setPosition(400, 100)
    .setSize(200, 20)
    .setRange(200, 0)
    ;

  cp5.addSlider("ballColor_g")
    .setPosition(400, 150)
    .setSize(200, 20)
    .setRange(0, 200)
    ;

  cp5.addSlider("ballColor_b")
    .setPosition(400, 200)
    .setSize(200, 20)
    .setRange(0, 200)
    ;
    
  /*add two vertical sliders, the value of the sliders will be linked to variables that control the ball's position*/ 
  cp5.addSlider("moveBall_x")
    .setPosition(280, 120)
    .setSize(20, 100)
    .setRange(0, width)
    .setNumberOfTickMarks(5)
    ;

  cp5.addSlider("moveBall_y")
    .setPosition(220, 120)
    .setSize(20, 100)
    .setRange(0, height)
    .setNumberOfTickMarks(5)
    ;
}

void draw() {
  background(0);
  fill(r, g, b); // make the ball's color linked to horizontal sliders
  ellipse(x, y, 20, 20); //make the ball's position linked to vertical sliders
  r = ballColor_r;
  g = ballColor_g;
  b = ballColor_b;
  x = moveBall_x;
  y = moveBall_y;
}
