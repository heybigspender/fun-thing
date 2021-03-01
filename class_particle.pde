class Particle {

  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector totalForce;
  float mass;
  float size;
  color col;
  boolean fixed;

  Particle(float _xpos, float _ypos, float _mass, float _size, color _col, boolean _fixed) {

    position = new PVector(_xpos, _ypos);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    totalForce = new PVector(0, 0);
    mass = _mass;
    size = _size;
    col = _col;
    fixed = _fixed;
  }

  void display() {
    fill(col);
    stroke(0);
    ellipse(position.x, position.y, size, size);
  }

  void update() {
    totalForce.add(PVector.mult(gravity, mass));


    if (!fixed) {
      acceleration = PVector.div(totalForce, mass);
      velocity.add(acceleration);
      position.add(velocity);
    }

    display();  
    totalForce.mult(0);
    acceleration.mult(0);
    velocity.mult(0.99);
  }
}
