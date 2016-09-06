class Calender {

  int Week, Year;
  String [] season; 
  String Season;

  Calender() {
    Week = Simulator.GT;
    Year = 0;
    season = new String[4];
    season[0]="Winter";
    season[1]="Spring"; 
    season[2]="Summer"; 
    season[3]="Autumn"; 
    Season = season[0];
  }

  void UI() {
    if (Simulator.tock == true) {
      Week = Week + 1;
      if (Week > 13) {
        Season = season[1];
      }
      if (Week > 26) {
        Season = season[2];
      }
      if (Week > 39) {
        Season = season[3];
      }     
      if (Week > 52) {
        Season = season[0];
        Week = 0;
        Year = Year + 1;
      }
    }
  }
}