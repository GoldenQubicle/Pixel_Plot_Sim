Zones Zones;
Simulator Simulator;
UI UI;
Calender Calender;
Climate Climate;

void setup() {
  size(640, 640);
  background (127);
  UI = new UI();
  Zones = new Zones();
  Simulator = new Simulator();
  Climate = new Climate();
  Calender = new Calender();
}

void draw() {
  background (127);
  Simulator.Runs(); 
  Zones.Plots();  
  UI.properUI(); 

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