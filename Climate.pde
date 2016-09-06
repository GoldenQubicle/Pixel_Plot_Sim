class Climate{
  
    float temperature,precipitation;
  
  
 Climate(){

 }
 
void Weather(){
  Temperature();
  Precipitation();
}
  
void   Temperature(){
 if (Simulator.tock == true) {
      temperature++;
  }
     
}
void   Precipitation(){
 if (Simulator.tock == true) {
      precipitation++;
  }
}
  
  
  
  
}