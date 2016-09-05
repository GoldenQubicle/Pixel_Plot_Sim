class UI {

  String [] text;  

  color white;

  UI() {

    text = new String[5];   
    text[0] = "Simulator"; // runs in green; paused in yellow
    text[1] = "Week";
    text[2] = "Year";
    text[3] = "Season";


    white = color(255, 255, 255);
  }



  void elements() {
    fill(white);
    textAlign(RIGHT);  

    textSize (15);
    text(text[0], 580, 30);
    textSize (25);
    text(text[1], 580, 90);
    text(text[2], 580, 60);
    text(text[3], 580, 120);

    textAlign(LEFT);  
    textSize (15);
    text(Simulator.state, 585, 30);
    textSize (25);
    text(Calender.Year, 585, 60);
    text(Calender.Week, 585, 90);    
    textSize (15);
    text(Calender.Season, 585, 120);

    //println(Calender.getWeek());
  }
}