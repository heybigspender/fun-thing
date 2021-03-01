
Particle[] nodes = new Particle[4];
Spring[] springs = new Spring[6];

float particleSize = 70;
float particleMass = 20;
float springK = 5;

PVector gravity = new PVector(0, 3);

void setup() {
  size(800, 600);

  nodes[0] = new Particle(200, 400, particleMass, particleSize, color(255, 0, 0), false);
  nodes[1] = new Particle(500, 400, particleMass, particleSize, color(255, 0, 0), false);
  nodes[2] = new Particle(600, 100, particleMass, particleSize, color(255, 0, 0), false);
  nodes[3] = new Particle(200, 200, particleMass, particleSize, color(255, 0, 0), false);

  springs[0] = new Spring(springK, 300, nodes[0], nodes[1]);
  springs[1] = new Spring(springK, 200, nodes[1], nodes[2]);
  springs[2] = new Spring(springK, 300, nodes[2], nodes[3]);
  springs[3] = new Spring(springK, 200, nodes[3], nodes[0]);
  springs[4] = new Spring(springK, 400, nodes[0], nodes[2]);
  springs[5] = new Spring(springK, 400, nodes[3], nodes[1]);
}

void draw() {

  background(100);

  for (int i = 0; i < springs.length; i++) {
    springs[i].update();
  }

  for (int i = 0; i < nodes.length; i++) {
    nodes[i].update();
  }
}
