Zones Zones;
Simulator Simulator;

void setup() {
  size(640, 640);
  background (127);
  Zones = new Zones();
  Simulator = new Simulator();
}

void draw() {
  background (127);
  Zones.Plots();
  Simulator.Runs();
}

void mousePressed() {
  Zones.P1();
}

void mouseReleased() {   
  Zones.P2();
}

void keyPressed() {
  Simulator.Pause();
}   