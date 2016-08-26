class Simulator {

  boolean pause, tick;
  int start, delta, pdelta, GT;
  int T = 250; // value of Tick in milliseconds 

  Simulator() {
    pause = true;
    tick = false;
    pdelta = 0;
  }

  void Runs() {
    GameTime();
  }

  void GameTime() {

    // runs continuously
    if ((tick == false) && (pause == false) && (pdelta == 0)) {
      delta = millis() - start;
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
      println(GT);
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
      println("Runs");
    } else if ((keyPressed == true) && (key == ' ') && (pause == false)) {
      pause = true;
      println("Paused");
    }
  }
}