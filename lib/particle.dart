class PVector {
  late double x, y;
  PVector(x, y) {
    this.x = x;
    this.y = y;
  }
}

class Particle {
  PVector position = PVector(0.0, 0.0);
  PVector velocity = PVector(0.0, 0.0);
  double mass = 10.0; //kg
  double radius = 10 / 100;
  double area = 0.0314;
  double jumpFactor = -0.7;
}
