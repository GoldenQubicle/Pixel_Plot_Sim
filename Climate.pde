class Climate {

  float temperature, sineterm, precipitation;
  float min, max;
  float constant = TAU/52;
  FloatList Avarage; 

  Climate() {
    Avarage = new FloatList();

    // these are min & max boundaries between which temperature fluctuates yearly (-/+)
    // no variance for debug
    min = 30;
    max = 30;
  }

  void Weather() {
    Temperature();
    Precipitation();
  }

  void Temperature() {
    if (Simulator.tock == true && Simulator.pause == false) {
      temperature = -sin(sineterm)*random(min, max);
      sineterm = sineterm + constant;
      Avarage.append(temperature);
    }
  }
  
  void Precipitation() {
    if (Simulator.tock == true && Simulator.pause == false) {
      precipitation++;
    }
  }
}