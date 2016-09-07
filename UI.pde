class UI {

  // text elements 
  String [] text;
  color white;

  // temperature graph
  float x, y;
  FloatList X, Y;
  int row;

  UI() {
    // text elements 
    text = new String[6];   
    text[0] = "Simulator"; // runs in green; paused in yellow
    text[1] = "Week";
    text[2] = "Year";
    text[3] = "Season";
    text[4] = "Temperature";
    text[5] = "Precipitation";
    white = color(255, 255, 255);

    // temperature graph
    x = 200;
    y = 185;
    X = new FloatList();
    X.set(0, x);
    Y = new FloatList();
    Y.set(0, y);
  }

  void properUI() {
    elements();
    weather();
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
    // dynamic text fields
    textAlign(LEFT);  
    textSize (15);
    text(Climate.temperature, 505, 20);
    text("", 505, 40);
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
    if (Simulator.tock == true && Simulator.pause == false) {
      if (Calender.Week < 52) { 
        x = x + (364/52); // horizontal movement, i.e. time
        X.append(x);
        //y = y + norm(-Climate.temperature, 0, 1); // normalise for graphing
        y = y + Climate.temperature;
        Y.append(y);
        for (int r = 0; r < X.size(); r++) {
          ellipse(X.get(r), Y.get(r), 2, 2);
        }
      }
      if (Calender.Week >= 52)
        x = 200;
        y = 185;
    }
    
    if (Simulator.pause == true) {
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

    translate(5, 0); // seperate static from dynamic fields

    // dynamic text fields
    textAlign(LEFT);   
    text(Simulator.state, 585, 20);  
    text(Calender.Year, 585, 40);
    text(Calender.Week, 585, 60);    
    text(Calender.Season, 585, 80);

    popMatrix();
  }
}