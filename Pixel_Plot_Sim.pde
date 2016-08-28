Zones Zones;
Simulator Simulator;

void setup() {
  size(640, 640, P2D);
  background (127);
  Zones = new Zones();
  Simulator = new Simulator();
}

void draw() {
  background (127);
  Zones.Drawn();
  Zones.Draw();
  Simulator.Runs();
}

void mouseReleased(){
  Zones.P4();
}

void mouseDragged() {
  Zones.P3();
}

void mousePressed() {
  Zones.P2();
}

void mouseClicked() {
  Zones.P1();
}


//void mouseReleased() {   
//  Zones.P2();
//}

void keyPressed() {
  Simulator.Pause();
}   