int numParticles = 40;

Particle[] particles = new Particle[numParticles];
Spring[] springs = new Spring[numParticles - 1];

float separation = 0.1;
float particleSize = 4;
float particleMass = 0.4;
float springK = 0.9;

PVector gravity = new PVector(0, 0.5);

void setup() {
  size(800, 600);

  particles[0] = new Particle(200, 15, particleMass, particleSize, color(255, 0, 0), true);

  for ( int i = 1; i < particles.length; i++) {
    particles[i] = new Particle(200, 15+separation*i, 1, particleSize, color(255), false);
    springs[i-1] = new Spring(springK, separation, particles[i-1], particles[i]);
  }
}

void draw() {
  if (mousePressed) {
    particles[particles.length - 1].position.set(mouseX, mouseY);
    particles[particles.length - 1].velocity.set(0, 0);
  }

  background(100);

  for (int i = 0; i < springs.length; i++) {
    springs[i].update();
  }

  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
  }

}
