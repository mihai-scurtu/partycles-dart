library partycles;

import 'dart:html';

import 'package:partycles/particle_engine.dart';

void main() {
  ParticleEngine engine = new ParticleEngine(document.querySelector('canvas#main'));
  
  engine.particles.add(engine.randomParticle());
  engine.particles.add(engine.randomParticle());
  engine.particles.add(engine.randomParticle());
  engine.particles.add(engine.randomParticle());
  engine.draw();
}