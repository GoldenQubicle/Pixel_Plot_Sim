class Climate {

  float temperature, sineterm, precipitation;
  float min, max, Min,Max;
  float constant = TAU/52;
  FloatList Avarage; 

  Climate() {
    Avarage = new FloatList();

    // these are min & max boundaries between which temperature fluctuates yearly (-/+)
    // would also be kinda neat tobe able to skew phase per year
    min = 20;
    max = 20 ;
    Min = 0;
    Max = 10;
  }

  void Weather() {
    Temperature();
    Precipitation();
  }

  void Temperature() {
    if (Simulator.tock == true && Simulator.pause == false) {
      temperature = random(Min, Max)+ -sin(sineterm) * random(min, max);
      sineterm = sineterm + constant;
      Avarage.append(temperature);
      println(Avarage.min(), Avarage.max());
      if (Calender.Week >= 52){
        sineterm = 0;
      }
    }
  }
  
  void Precipitation() {
    if (Simulator.tock == true && Simulator.pause == false) {
      precipitation++;
    }
  }
}