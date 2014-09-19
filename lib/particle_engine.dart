library particle_engine;

import 'dart:html';
import 'dart:math' as math;

import 'package:partycles/particle.dart';
//import 'package:partycles/force.dart';

class ParticleEngine {
  List<Particle> particles = new List();
  
  CanvasElement canvas;  
  math.Random rng = new math.Random();
  
  Function physicsCallback = (num delta) {};
  Function drawCallback = () {};
  
  // pixel count per grid
  num scale = 2;
  
  // in "tiles"
  num width;
  num height;
  
  String textBuffer = '';

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
    
    this.drawText();
  }
  
  void drawParticle(Particle p) {
    if(!this.contains(p)) return;
    
    this.canvas.context2D
      ..fillStyle = p.color
      ..beginPath()
      ..arc(p.x * this.scale, p.y * this.scale, p.radius.toDouble(), 0, 2.0 * math.PI)
      ..closePath()
      ..fill();
  }
  
  void drawText() {
    if(this.textBuffer.isEmpty) {
      return;
    }
    
    num lineHeight = 25;
    this.canvas.context2D
      ..font = 'Courier 22px'
      ..fillStyle = '#000000'
      ..fillText(this.textBuffer, 10, 10);
    
    this.textBuffer = '';
  }
  
  
  void bufferText(String s) {
    this.textBuffer += '$s ';
  }
  
  bool contains(Point p) => p.x >= 0 && p.y >= 0 && p.x <= this.width && p.y <= this.height;
  
  Particle randomParticle() => 
    new Particle(this.rng.nextInt(this.width), this.rng.nextInt(this.height));
}