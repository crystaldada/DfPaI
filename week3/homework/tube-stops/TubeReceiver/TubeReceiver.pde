import oscP5.*;
import netP5.*;

OscP5 oscP5;

float centerLat=51.5074; 
float centerLon=0.1278;

/*use floatLists to store the data so that we can use some features of ArrayLists, but to maintain the simplicity and efficiency of working with arrays*/
FloatList lats=new FloatList(); 
FloatList lons=new FloatList();


void setup() {
  size(800, 800);
  frameRate(1);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
}


void draw() {
  background(0);
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {

  /* get the float value from the osc argument*/
  float lat = theOscMessage.get(0).floatValue(); 
  float lon = theOscMessage.get(1).floatValue();

  /*center the value that get from the osc argument to the center of the window*/
  float x=width/2+(lat-centerLat)*1000;
  float y=height/2+(centerLon+lon)*1000;

  /*add the data to the lats and lons floatlist*/
  lats.append(x);
  lons.append(y);

  println("   "+lat+"   " + lon); //test if it works and get the value so that we can set the location off the window's center
}


void keyPressed() {
  /*use the data as x,y location to draw circles and make them swiggle*/
  for (int i=0; i<lats.size(); i++) {
    float a = lons.get(i);
    a += random(-2, 2)*2; // '*2' to make it move faster
    float b=lats.get(i);
    b += random(-2, 2)*2;
    fill(255, 50);
    ellipse(a, b, 10, 10);
  }
}
