class Simulator {

  boolean pause, tick, tock;
  int start, delta, pdelta, GT;
  int T = 1; // value of Tick in milliseconds, Tick = 1 week, make this controllable
  int Week, Year; // yearly stuff
  String State; // runs or paused, passed to UI         

  Simulator() {
    State = "Paused";
    pause = true;
    tick = false;
    pdelta = 0;
  }

  // all the stuff to simulate goes here!
  void Runs() {
    GameTime();
    climate.Weather();
  }

  void GameTime() {
    // runs continuously
    if ((tick == false) && (pause == false) && (pdelta == 0)) {
      delta = millis() - start;
      tock = false;
    }
    // what makes it tick
    if (delta > T) {
      tick = true;
    }
    // update GT and set start to current millisecond
    if ((tick == true) && (pause == false)) { 
      start = millis();
      tick = false;
      GT = GT + 1; 
      tock = true;
    }
    // when paused, calculate milliseconds left in Tick
    if ((tick == false) && (pause == true)) {
      pdelta = T-delta;
    }
    // when resumed from pause, continue 
    if ((tick == false) && (pause == false) && (pdelta > 0)) {
      delta = millis() - start;
      if (delta > pdelta) {
        tick = true;
        pdelta=0;
      }
    }
  }

  void yearly() {
    if (tock == true && pause == false) {
      Week = Week + 1;
      if (Week > 13) {
        ui.Season = ui.season[1];
      }
      if (Week > 26) {
        ui.Season = ui.season[2];
      }
      if (Week > 39) {
        ui.Season = ui.season[3];
      }     
      if (Week > 52) {
        ui.Season = ui.season[0];
        Week = 0;
        Year = Year + 1;
      }
    }
  }

  // pause and resume Game Time with spacebar
  void Pause() {
    if ((keyPressed == true) && (key == ' ') && (pause == true)) {
      pause = false;
      State = "Runs";
    } else if ((keyPressed == true) && (key == ' ') && (pause == false)) {
      pause = true;
      State = "Paused";
    }
  }
}