library force;

import 'dart:math';

class Force {
  num x = 0;
  num y = 0;

  num get abs => sqrt(this.x * this.x + this.y * this.y);
  
  Force(this.x, this.y);
  Force.random(num degree, {Random rng}) {
    if(rng == null) {
      rng = new Random();
    }
    
    num r = rng.nextDouble() * degree;
    num theta = rng.nextDouble() * 2 * PI;
    
    this.x = r * cos(theta);
    this.y = r * sin(theta);
  }

  
  Force operator+(Force f) => new Force(f.x + this.x, f.y + this.y);
  Force operator*(num k) => new Force(this.x * k, this.y * k);
  bool operator==(Force f) => this.x == f.x && this.y == f.y;
}