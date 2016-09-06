class Simulator {

  boolean pause, tick, tock;
  int start, delta, pdelta, GT;
  int T = 100; // value of Tick in milliseconds, Tick = 1 week

  String state; // runs or paused, passed to UI         

  Simulator() {
    state = "Paused";
    pause = true;
    tick = false;
    pdelta = 0;    

  }

  // all the stuff to simulate goes here!
  void Runs() {
    GameTime();
    Calender.UI();
    Climate.Weather();
    
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
      //println(GT);
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

  // pause and resume Game Time with spacebar
  void Pause() {
    if ((keyPressed == true) && (key == ' ') && (pause == true)) {
      pause = false;
      //println("Runs");
      state = "Runs";
    } else if ((keyPressed == true) && (key == ' ') && (pause == false)) {
      pause = true;
      //println("Paused");
      state = "Paused";
    }
  }
}