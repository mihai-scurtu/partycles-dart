library point_test;

import 'package:unittest/unittest.dart';
import 'package:partycles/point.dart';

void main() {
  test('Identical points', (){
    Point p1, p2;
    
    p1 = new Point(0, 0);
    p2 = new Point(0, 0);
    
    expect(p1.distanceTo(p2), 0);
  });
  
  test('Distance', () {
    Point p1 = new Point(1, 1);
    Point p2 = new Point(0, 0);
    
    expect(p1.distanceTo(p2), closeTo(1.41, 0.01));
  });
  
  test('Equality', () {
    Point p1 = new Point(5, 4);
    Point p2 = new Point(5, 4);
    
    expect(p1 == p2, true);
  });
}