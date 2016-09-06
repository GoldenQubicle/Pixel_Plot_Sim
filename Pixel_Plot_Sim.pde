Zones Zones;
Simulator Simulator;
UI UI;
Calender Calender;
Climate Climate;

// temp vars for temperature graph
float x = 200;
float y = 185;
float a = 0;
float inc = TAU/52;

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


  // make temperature graph work first here, then move graph to UI and fucntional calculations to Climate
  // graph box
  line(200, 150, 564, 150);
  for (int i = 200; i <= 564; i = i + (364/4)) {
    line(i, 220, i, 150);
  }
  line(200, 220, 564, 220);

  // graph functionality
  if (Simulator.tock == true) {
    if (Calender.Week < 52) { 
      x = x + (364/52); // horizontal movement, i.e. time
      
      y = y + sin(a);//*2;
      a = a + inc;
   
      ellipse(x, y, 10, 10);
    } else { 
      x = 200;
      y = 185;
      a = 0;
      ellipse(x, y, 10, 10);
    }
  }
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