library particle_engine;

import 'dart:html';
import 'dart:math';

import 'package:partycles/particle.dart';
//import 'package:partycles/force.dart';
import 'package:partycles/point.dart';

class ParticleEngine {
  List<Particle> particles = new List();
  
  CanvasElement canvas;  
  Random rng = new Random();
  
  Function physicsCallback = (num delta) {};
  Function drawCallback = () {};
  
  // pixel count per grid
  num scale = 2;
  
  // in "tiles"
  num width;
  num height;

  ParticleEngine(this.canvas) {
    this.width = (this.canvas.width / this.scale).floor();
    this.height = (this.canvas.height / this.scale).floor();
  }
  
  void loop(Function callback) {
    
  }
  
  void updatePhysics(num delta) {
    this.physicsCallback(delta);
    
    for(Particle p in this.particles) {
      
    }
  }
  
  void draw() {
    this.drawCallback();
    
    for(Particle p in this.particles) {
      this.drawParticle(p);
    }
  }
  
  void drawParticle(Particle p) {
    if(!this.contains(p)) return;
    
    this.canvas.context2D
      ..fillStyle = p.color
      ..beginPath()
      ..arc(p.x * this.scale, p.y * this.scale, p.radius.toDouble(), 0, 2.0 * PI)
      ..closePath()
      ..fill();
  }
  
  bool contains(Point p) => p.x >= 0 && p.y >= 0 && p.x <= this.width && p.y <= this.height;
  
  Particle randomParticle() => 
    new Particle(this.rng.nextInt(this.width), this.rng.nextInt(this.height));
}