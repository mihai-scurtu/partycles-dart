library force;

import 'dart:math';

class Force {
  num x = 0;
  num y = 0;
  
  Force(this.x, this.y);
  
  num abs() => sqrt(this.x * this.x + this.y * this.y);
  
  Force operator+(Force f) => new Force(f.x + this.x, f.y + this.y);
  Force operator*(num k) => new Force(this.x * k, this.y * k);
  bool operator==(Force f) => this.x == f.x && this.y == f.y;
}