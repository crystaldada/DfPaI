
import peasy.*;

Table table;
PeasyCam cam;
float moonRadius = 1737.1; // moon's radius in km

ArrayList<MoonCraters> moonCraters=new ArrayList<MoonCraters>(); //store all the data in arraylist

float lat, lon, diameters; 

void setup() {
  size(960, 540, P3D);
  stroke(255);
  noFill();

  cam = new PeasyCam(this, 2000); //set the port 2000
  table = loadTable("moon_crater_coords.csv", "header"); // tell processing the csv file has a header

/*get lat, lon and diameters from the csv file*/
  for (int i = 0; i < table.getRowCount(); i++) {
    lat = table.getFloat(i, "lat");
    lon = table.getFloat(i, "lon");
    diameters = table.getFloat(i, "diameters");
    moonCraters.add(new MoonCraters(lat, lon, diameters, moonRadius)); //add data to the list 
  }
  //println(moonCraters.size());
}

void draw() {
  background(0);
  
  for (MoonCraters c : moonCraters) {
    c.draw();
  }
}
