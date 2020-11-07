Particle[] particle = new Particle[1000];
float speed;
void setup() {
size(800,800);
for (int i = 0; i < particle.length; i++){
  particle[i] = new Particle();
  particle[0] = new OddballParticle();
  }
}
void draw(){
  speed = map(mouseX, 0, width, 0, 20); 
  background(90);
  translate(width/2, height/2);
  for (int i = 0; i <particle.length; i++){
    particle[i].move();
    particle[i].show();
  }  
}
class Particle{
  float x;
  float y;
  float z;
  Particle(){
    x = random(-width, width);
    y = random(-height,height);
    z = random(width);
  } 
  void move() {
    z = z - speed;
    if(z < 1) {
      z = width;
      x = random(-width, width);
      y = random(-height,height);
    }
}
  void show() { 
  fill(140);
  noStroke();
  float speedX = map(x / z, 0, 1, 0, width);
  float speedY = map(y / z, 0, 1, 0, width);
  
  float size = map(z, 0, width, 16, 0);
  ellipse(speedX, speedY, size, size);  }
}
class OddballParticle extends Particle //inherits from Particle
{
  float x,y;
  OddballParticle() {
  }
  void move() {
  
      x = x + (int)(Math.random()*5)-1; //right
      x = x + (int)(Math.random()*5)-3; //left
      y = y + (int)(Math.random()*5)-1; //right
      y = y + (int)(Math.random()*5)-3; //left
    }
  void show() {
  fill(450,5,0);
  noStroke();
  ellipse(x,y,100,100);
  }
}
