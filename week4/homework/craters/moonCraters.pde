class MoonCraters {

  float lat, lon, diameters;  
  float radius;
  float x, y, z; 

//constructor
  MoonCraters(float _lat, float _lon, float _diameters, float _radius) {
    lat=radians(_lat);
    lon=radians(_lon);
    diameters = _diameters;
    radius=_radius;
    
    //make the lat and con shown in x, y location relative to the window's center being the origin
    x=radius*cos(lat)*sin(lon);
    y=radius*cos(lat)*cos(lon);
    z=radius*sin(lat);
  }

  void draw() {
    
    pushMatrix();
    translate(x,y,z);
    
    /*rotate the sphere*/
    rotateZ(HALF_PI-lon); //make it zoom along the z-axis
    rotateY(HALF_PI-lat);
    
    //box(20);
    ellipse(0,0,diameters,diameters);
    popMatrix();
    
  }
}
