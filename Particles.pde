class Particle{
  PVector location;
  color rgb;
  
  float lifespan = 20;
   
    Particle(PVector l, color c){
      location = l;
      rgb = c;
    } 
     
      void run(){
        update();
        display(lifespan, rgb); 
        }
       
      void update(){
        lifespan*=0.95;
      }
       
      void display(float lifespan, color rgb){
        pushMatrix();
        
        // invert, because video is mirrored
        translate(width, 0);
        scale(-1,1);
        
        // draw point with actual color
        stroke(rgb, lifespan * 10);
        strokeWeight(lifespan);
        point(location.x, location.y); 
        
        popMatrix();
      }
         
      boolean isDead(){
        // boolean for killing particle
        if(lifespan<10) return true;
        else return false; 
      }
}
