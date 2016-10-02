class Climate {

  float temperature, sineterm, precipitation, watertable;
  float min, max, Min, Max;
  float constant = TAU/52;

  Climate() {
    // these are min & max boundaries between which temperature fluctuates yearly (-/+)
    // would also be kinda neat to be able to skew phase per year
    min = 20;
    max = 20 ;
    Min = 0;
    Max = 10;
  }

  void Weather() {
    Temperature();
    Precipitation();
    WaterTable();
  }

  void WaterTable() {
    if (simulator.tock == true && simulator.pause == false) {
      watertable++;
    }
  }

  void Precipitation() {
    if (simulator.tock == true && simulator.pause == false) {
      precipitation++;
    }
  }

  void Temperature() {
    if (simulator.tock == true && simulator.pause == false) {
      temperature = random(Min, Max)+ -sin(sineterm) * random(min, max);
      sineterm = sineterm + constant;
      if (simulator.Week >= 52) {
        sineterm = 0;
      }
    }
  }
}