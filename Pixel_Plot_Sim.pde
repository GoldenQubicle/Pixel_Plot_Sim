Zones Zones;
Simulator Simulator;

// lets asume 1 pixel = 1 meter
// than 1 acre = 64 * 64 pixels
// sketch = 10 * 10 acre = 100 square acre
 

void setup() {
   size(640, 640);
   background (127);

   Zones = new Zones();
   Simulator = new Simulator();
  }

void draw() {
background (127);
Zones.Drawn();
Zones.Draw();

  }

void mousePressed() {
  Zones.P1();  
  }

void mouseReleased() {   
  Zones.P2();
  }
  
void keyPressed() {
  Simulator.pause();
  }   