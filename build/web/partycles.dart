library partycles;

import 'dart:html';

import 'package:partycles/particle_engine.dart';
import 'package:partycles/particle.dart';
import 'package:partycles/force.dart';

void main() {
  ParticleEngine engine = new ParticleEngine(document.querySelector('canvas#main'));
  
  engine.drawCallback = (engine) {
    Particle p = engine.randomParticle();
    p.force = new Force.random(0.2);
    engine.particles.add(p);
    
    engine.bufferText('Particles: ${engine.particles.length}\n');
  };
  
  engine.loop();
}