library force_test;

import 'dart:math';

import 'package:partycles/force.dart';
import 'package:unittest/unittest.dart';

void main() {
  test('Addition', (){
    Force f = new Force(4, 5);
    Force g = new Force(4, 5);
    
    expect(f == g, true);
    expect(f + g, new Force(8, 10));
  });
  
  test('Random', (){
    Force f = new Force.random(5);
    
    expect(f.x > -5 && f.x < 5, true);
    expect(f.y > -5 && f.y < 5, true);
    expect(f.abs < 5, true);
  });
  
  test('Absolute value', (){
    Force f;
    
    f = new Force(0, 1);
    expect(f.abs, 1);
    
    f = new Force(1, 1);
    expect(f.abs, closeTo(1.41, 0.01));
    
    f = new Force(-1, -1);
    expect(f.abs, closeTo(1.41, 0.01));
  });
}