library point;

import 'dart:math';

class Point {
  num x = 0;
  num y = 0;
  
  Point(this.x, this.y);
  
  num distanceTo(Point p) {
    return sqrt(pow(this.x - p.x, 2) + pow(this.y - p.y, 2));
  }
  
  bool operator==(Point p) => this.x == p.x && this.y == p.y;
}