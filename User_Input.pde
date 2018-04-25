void keyPressed() {
  if (key == ' ') {
    sim.autoShoot = !sim.autoShoot;
  }
  if (key == 'c') {
    sim.allFireworks.clear();
  }
  if (key == 'w') {
    sim.gravity.y -= 0.1;
  }
  if (key=='a') {
    sim.gravity.x -= 0.1;
  } 
  if (key== 's') {
    sim.gravity.y+= 0.1;
  }
  if (key== 'd') {
    sim.gravity.x += 0.1;
  }
  if (keyCode == UP) {
    sim.autoShootFireworkLimit++;
  } 
  if (keyCode == DOWN && sim.autoShootFireworkLimit > 1) {
    sim.autoShootFireworkLimit--;
  }
  if (key == 'h') {
    sim.displayHUD = !sim.displayHUD;
  }
}

void mousePressed() {
  sim.addRandomFireworkAtLocation(new PVector (mouseX, mouseY));
}