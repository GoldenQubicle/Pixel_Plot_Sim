class UI {

  String [] text;  

  color white;
 
  UI() {

    text = new String[6];   
    text[0] = "Simulator"; // runs in green; paused in yellow
    text[1] = "Week";
    text[2] = "Year";
    text[3] = "Season";
    text[4] = "Temperature";
    text[5] = "Precipitation";
    white = color(255, 255, 255);
     
  }
  
  void properUI(){
  elements();
  weather();
  }
  
  
  void weather(){
     fill(white); 
       //static text fields
    textAlign(RIGHT);  
    textSize (15);
    text("y", 500, 20);
    text("a", 500, 40);
        // dynamic text fields
    textAlign(LEFT);  
    textSize (15);
    text(y, 505, 20);
    text(a, 505, 40);
    
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