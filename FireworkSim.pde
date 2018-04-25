class FireworkSim {

  ArrayList<Firework> allFireworks;
  PVector gravity;

  boolean autoShoot;
  int autoShootFireworkLimit;
  boolean displayHUD;

  FireworkSim() {
    this.allFireworks = new ArrayList<Firework>();
    this.autoShoot = false;
    this.autoShootFireworkLimit = 5;
    this.gravity = new PVector(0, 0.3);
    this.displayHUD = true;
  }

  void run() {
    for (int i = 0; i < allFireworks.size(); i ++) {
      allFireworks.get(i).run(gravity);
      if (!allFireworks.get(i).isAlive()) {
        allFireworks.remove(allFireworks.get(i));
      }
    }
    if (autoShoot && (allFireworks.size() < autoShootFireworkLimit)) {
      addRandomFireworkAtLocation(new PVector(random(100, width-100), random (100, height -300)));
    }
    if (displayHUD) {
      displayHUD();
    }
  }

  void addRandomFireworkAtLocation(PVector location) {
    allFireworks.add(new Firework(
      location, //location
      color(int(random(100, 255)), int(random(100, 255)), int(random(100, 25))), //color
      random(10, 15), //rocket size
      random(8, 30), //particle velocity range
      random (0.95, 0.99), //particle deceleration
      int (random(100, 175)), //particle amount
      random (2, 5), //particle size
      random(2, 8))); //particle fade speed
  }

  void displayHUD() {
    fill(255);
    textAlign(LEFT);
    textSize(18);
    text("auto shoot: " + sim.autoShoot, 50, 50);
    text("auto shoot firework limit: " + sim.autoShootFireworkLimit, 50, 100);
    text("# of fireworks being rendered: " + allFireworks.size(), 50, 150);
    text("# of particles being rendered: " + numParticlesBeingRendered(), 50, 200);
    text("x gravity: "+ nf(sim.gravity.x, 1, 1) + " // y gravity: "+ nf(sim.gravity.y, 1, 1), 50, 250);

    text("toggle auto shoot: SPACE", 50, height-50);
    text("clear simulation: C", 50, height-100);
    text("change auto shoot firework limit: UP and DOWN arrows", 50, height -150);
    text("toggle HUD: H", 50, height -200);
    text("shoot a firework: click anywhere", 50, height - 250);
    text("adjust gravity: WASD", 50, height -300);

    textAlign(RIGHT);
    text("FPS: " + nf(frameRate, 2, 2), width-50, 50);
  }

  int numParticlesBeingRendered() {
    int amount = 0;
    for (Firework givenFirework : allFireworks) {
      amount += givenFirework.allParticles.size();
    }
    return amount;
  }
}