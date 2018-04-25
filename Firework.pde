class Firework {

  ArrayList<Particle> allParticles;

  int particleAmount;

  PVector location;
  final PVector targetLocation;

  float rocketSize;
  PVector rocketVelocity;
  float rocketDeceleration;

  float particleVelocityRange;
  float particleDeceleration;

  color colour;
  float particleSize;
  float particleFadeSpeed;

  int state;
  final int SHOOTING = 0, EXPLODING = 1;

  Firework (PVector targetLocation, color colour, float rocketSize, float particleVelocityRange, 
    float particleDeceleration, int particleAmount, float particleSize, float particleFadeSpeed) {

    allParticles = new ArrayList<Particle>();

    this.location = new PVector (targetLocation.x, height + rocketSize/2);
    this.targetLocation = targetLocation.copy();

    this.colour = colour;

    this.rocketSize = rocketSize;
    this.rocketVelocity = new PVector(0, -40);
    this.rocketDeceleration = 0.97;

    this.particleVelocityRange = particleVelocityRange;
    this.particleDeceleration = particleDeceleration;
    this.particleSize = particleSize;
    this.particleFadeSpeed = particleFadeSpeed;
    this.particleAmount = particleAmount;

    state = SHOOTING;
  }

  void run (PVector gravity) {
    switch(state) {
    case SHOOTING:
      rocketVelocity.mult(rocketDeceleration);
      rocketVelocity.add(gravity);
      location.add(rocketVelocity);
      displayRocket();
      if (location.y <= targetLocation.y || rocketVelocity.y >= 0) {
        explode();
        state = EXPLODING;
      }
      break;
    case EXPLODING:
      for (int i = 0; i < allParticles.size(); i++) {
        allParticles.get(i).update(gravity);
        allParticles.get(i).display();
        if (!allParticles.get(i).isAlive()) {
          allParticles.remove(allParticles.get(i));
        }
      }
      break;
    }
  }

  void explode() {
    for (int i = 0; i < particleAmount; i ++) {

      allParticles.add(new Particle(
        location, 
        new PVector(random (-particleVelocityRange, particleVelocityRange), random (-particleVelocityRange, particleVelocityRange)), 
        random (particleDeceleration - particleDeceleration/20, particleDeceleration + particleDeceleration/20), 
        color(colour, 255), 
        random(particleSize - particleSize*10, particleSize + particleSize*10), 
        random(particleFadeSpeed - particleFadeSpeed/3, particleFadeSpeed + particleFadeSpeed/3)));
    }
  }

  void displayRocket() {
    noStroke();
    fill(colour);
    ellipse(location.x, location.y, rocketSize, rocketSize);
  }


  public boolean isAlive() {
    if (state == SHOOTING) {
      return true;
    }
    for (Particle anyParticle : allParticles) {
      if (anyParticle.isAlive()) {
        return true;
      }
    }
    return false;
  }
}