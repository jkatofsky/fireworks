class Particle {

  PVector location;
  PVector velocity;
  float deceleration;

  float size;
  float transparency;
  float fadeSpeed;
  color colour;

  Particle(PVector location, PVector velocity, float deceleration, color colour, float size, float fadeSpeed) {
    this.location = location.copy();
    this.velocity = velocity.copy();
    this.deceleration = deceleration;

    transparency = 255;
    this.colour = colour;

    this.size = size;

    this.fadeSpeed = fadeSpeed;
  }

  void update(PVector gravity) {
    velocity.mult(deceleration);
    velocity.add(gravity);
    location.add(velocity);
    transparency -= fadeSpeed;
  }

  void display() {
    noStroke();
    fill(colour, transparency);
    ellipse(location.x, location.y, size, size);
  }

  boolean isAlive() {
    return transparency > 0;
  }
}