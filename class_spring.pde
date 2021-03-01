class Spring {
  float k;
  float restLength;
  float force;
  Particle a;
  Particle b;

  Spring(float _k, float _restLength, Particle _a, Particle _b) {
    k = _k;
    restLength = _restLength;
    a = _a;
    b = _b;
  }

  void display() {
    if (PVector.dist(a.position, b.position) > restLength) {
      stroke(255);
    } else {
      stroke(255, 0, 0);
    }
    line(a.position.x, a.position.y, b.position.x, b.position.y);
  }

  void update() {

    force = (PVector.dist(a.position, b.position) - restLength) * k;

    a.totalForce.add(PVector.sub(b.position, a.position).normalize().mult(force));   
    b.totalForce.add(PVector.sub(a.position, b.position).normalize().mult(force));   
    display();
  }
}
