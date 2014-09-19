library partycles;

import 'dart:html';

import 'package:partycles/particle_engine.dart';

void main() {
  ParticleEngine engine = new ParticleEngine(document.querySelector('canvas#main'));
  
  engine.drawCallback = () {
    engine.particles.add(engine.randomParticle());
    engine.bufferText('Particles: ${engine.particles.length}\n');
  };
  
  engine.loop();
}