import processing.video.*;

Capture video;

ArrayList<Particle> particles;
color c;

float brightnessThreshold = 150;
float b, red, green, blue;

void setup() {
  //size(800,600);
  fullScreen();
  frameRate(30);
  rectMode(CENTER);

  video = new Capture(this, width, height);
  video.start();
  
  particles = new ArrayList<Particle>(); 
}

void captureEvent(Capture video) {
  video.read(); 
}

void draw() {
  clear();
  background(0);
  
  float dots = 50;
  float dotSize = 1800 / dots;
  
  // iterate through every pixel in the 'video'
  for (int y = 0; y < video.height; y += dotSize) {
    for (int x = 0; x < video.width; x += dotSize) {
      
      // get the color of each pixel
      c = video.get(x, y);
 
      // get the brightness of each pixel
      b = brightness(c);

      // if brightness is above threshold => make a particle on that coordinate
      if (b > brightnessThreshold) {
          particles.add(new Particle(new PVector(x, y), c));
         }
 
    }
  }
  
    
  for(int i=0; i<particles.size(); i++) {
      Particle p = particles.get(i);
      p.run();
      
      // remove each particle when lifespan is 0
      if(p.isDead()){
        particles.remove(i);
      } 
  }
}
