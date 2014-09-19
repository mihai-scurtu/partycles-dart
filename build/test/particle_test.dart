library particle_test;

import 'package:partycles/particle.dart';
import 'package:partycles/force.dart';
import 'package:unittest/unittest.dart';

void main() {
  test('Default stationary force', (){
    Particle p = new Particle(0, 0);
    
    expect(p.force, new Force(0, 0));
  });
  
  test('Accelerate', () {
    Particle p = new Particle(0, 0, force: new Force(1, 1));
    p.accelerate(5);
    expect(p.force == new Force(5, 5), true);
  });
}