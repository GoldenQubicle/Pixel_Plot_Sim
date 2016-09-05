Zones Zones;
Simulator Simulator;
UI UI;
Calender Calender;

void setup() {
  size(640, 640);
  background (127);
  UI = new UI();
  Zones = new Zones();
  Simulator = new Simulator();
  Calender = new Calender();
 
}

void draw() {
  background (127);
  UI.elements();
  Zones.Plots();
  Simulator.Runs();
  
  Calender.blah();

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