library particle;

import 'dart:math';

//import 'point.dart';
import 'force.dart';

class Particle extends Point {
  String color;
  num radius;
  Force force;
  
  Particle(num x, num y, {this.radius: 2.5, this.force, this.color: '#000000'}): super(x, y){
    if(this.force == null) {
      this.force = new Force(0, 0);
    }
  }
  
  void accelerate(num rate) {
    this.force *= rate;
  }
}