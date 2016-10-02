class UI {
  // text elements 
  String [] text;
  color white;
  // temperature graph
  float x, y;
  FloatList X, Y;
  int row;
  // calender
  String [] season; 
  String Season;

  UI() {
    // text elements 
    text = new String[7];   
    text[0] = "Simulator"; 
    text[1] = "Week";
    text[2] = "Year";
    text[3] = "Season";
    text[4] = "Temperature";
    text[5] = "Precipitation";
    text[6] = "Water Table";
    white = color(255, 255, 255);
    // temperature graph 
    x = 200;
    y = 185;
    X = new FloatList();
    X.set(0, x);
    Y = new FloatList();
    Y.set(0, y);
    // calender
    season = new String[4];
    season[0]="Winter";
    season[1]="Spring"; 
    season[2]="Summer"; 
    season[3]="Autumn"; 
    Season = season[0];
  }

  void properUI() {
    elements();
    weather();
    simulator.yearly();
  }

  void weather() {
    // text elements
    pushMatrix();
    translate(0, 0);
    fill(white); 
    //static text fields
    textAlign(RIGHT);  
    textSize (15);
    text(text[4], 500, 20);
    text(text[5], 500, 40);
    text(text[6], 500, 60);
    // dynamic text fields
    textAlign(LEFT);  
    textSize (15);
    text(climate.temperature, 505, 20);
    text("NA", 505, 40); //Climate.precipitation
    text("NA", 505, 60); //Climate.watertable
    popMatrix();

    // temperature graph
    pushMatrix();
    translate(-40, -80);
    line(200, 150, 564, 150);
    for (int i = 200; i <= 564; i = i + (364/4)) {
      line(i, 220, i, 150);
    }
    line(200, 220, 564, 220);

    // graph functionality
    if (simulator.tock == true && simulator.pause == false) {
      if (simulator.Week < 52) { 
        x = x + (364/52); // horizontal movement, i.e. time
        X.append(x);
        y = y + climate.temperature;
        Y.append(y);
        for (int r = 0; r < X.size(); r++) {
          ellipse(X.get(r), Y.get(r), 2, 2);
        }
      }
      // seriously tho, I dunno why or how everything breaks when I change one tiny thing in these 3 line. . bit annoying
      if (simulator.Week == 52) // for that matter, why does this even work?!
        x = 200;
      y = 185; // wtf why is this so important for graph?!
    }
    if (simulator.pause == true) {
      for (int r = 0; r < X.size(); r++) {
        ellipse(X.get(r), Y.get(r), 2, 2);
      }
    }
    popMatrix();
  }

  void elements() {       
    pushMatrix();    
    fill(white);        
    translate(-500, 0); // move UI elements from right to the left on screen
    //static text fields
    textAlign(RIGHT);  
    textSize (15);
    text(text[0], 580, 20);
    text(text[1], 580, 60);
    text(text[2], 580, 40);
    text(text[3], 580, 80);
    translate(5, 0); // seperate static above from dynamic below
    // dynamic text fields
    textAlign(LEFT);   
    text(simulator.State, 585, 20);  
    text(simulator.Year, 585, 40);
    text(simulator.Week, 585, 60);    
    text(Season, 585, 80);
    popMatrix();
  }
}