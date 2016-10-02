/*
CURRENT CONCERNS 
temperate graph is not permanent, i.e. flickers when Tick is set to e.g. 100ms ~ minor tho since it pertains to ui only

*/

Zones zones;
Simulator simulator;
UI ui;
Climate climate;

void setup() {
  size(640, 640);
  background (127);
  ui = new UI();
  zones = new Zones();
  simulator = new Simulator();
  climate = new Climate();
}

void draw() {
  background (127);
  simulator.Runs(); 
  zones.Plots();  
  ui.properUI(); 
}

void mousePressed() {
  zones.P1();
}

void mouseReleased() {   
  zones.P2();
}

void keyPressed() {
  simulator.Pause();
}   