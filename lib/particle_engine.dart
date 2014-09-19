library particle_engine;

import 'dart:html';
import 'dart:math' as math;

import 'package:partycles/particle.dart';
import 'package:partycles/point.dart';

class ParticleEngine {
  List<Particle> particles = new List();
  
  CanvasElement canvas;  
  math.Random rng = new math.Random();
  
  Function physicsCallback = (ParticleEngine) {};
  Function drawCallback = (ParticleEngine) {};
  bool exit = false;
  
  // pixel count per grid
  num scale = 2;
  
  // in "tiles"
  num width;
  num height;
  
  String textBuffer = '';
  
  Stopwatch stopwatch = new Stopwatch();
  num averageFPS = null;
  num targetFPS = 60;
  num delta = 0;
  num frameTime = 0;
  
  ParticleEngine(this.canvas) {
    this.width = (this.canvas.width / this.scale).floor();
    this.height = (this.canvas.height / this.scale).floor();
  }
  
  void loop([num time]) {
    // Hack to animate when function was called from outside
    if(time == null) {
      window.animationFrame.then(this.loop);
      return;
    }
    
    // Update timing.
    this.delta = (this.frameTime - time).abs();
    this.frameTime = time;
    
    this.cleanUp(); 
    
    if(this.delta > 0) { 
      // Update fps.
      num fps = (1000 / this.delta).round();
      if(this.averageFPS == null) {
        this.averageFPS = fps; 
      } else {
        this.averageFPS = 0.95 * this.averageFPS + 0.05 * fps;
      }
      
      // Show fps.
      this.bufferText('FPS: ${this.averageFPS.round()}\n');
    }
    
    this.updatePhysics();
    this.draw();
    
    if(!this.exit) { 
      window.animationFrame.then(this.loop);
    }
  }
  
  void updatePhysics() {
    this.physicsCallback(this);
    
    for(Particle p in this.particles) {
      p.x += p.force.x * delta;
      p.y += p.force.y * delta;
    }
  }
  
  void draw() {
    this.drawCallback(this);
    
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
    num x = 10;
    num y = lineHeight;
    
    for(String line in this.textBuffer.split('\n')) {
      this.canvas.context2D
        ..font = '22px Courier'
        ..fillStyle = '#000000'
        ..fillText(line, 10, y);
      
      y += lineHeight;
    }
  }
  
  
  void bufferText(String s) {
    this.textBuffer += '$s ';
  }
  
  void cleanUp() {
    this.textBuffer = '';
    this.canvas.context2D.clearRect(0, 0, this.canvas.width, this.canvas.height);
  }
  
  bool contains(Point p) => p.x >= 0 && p.y >= 0 && p.x <= this.width && p.y <= this.height;
  
  Particle randomParticle() => 
    new Particle(this.rng.nextInt(this.width), this.rng.nextInt(this.height));
 }