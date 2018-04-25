//TODO:
//Make all sizes based on the width and height of the screen
//Implement the rocket of Firework as merely being a particle?

FireworkSim sim;

void setup() {
  fullScreen(P3D);
  frameRate(60);
  sim = new FireworkSim();
}

void draw() {
  background(0);
  sim.run();
}