class Zones {

  FloatList pv, Zone;
  float x, y;
  int purpose, vertext;
  
  boolean hover;

  Zones() {
    vertext = 0;
    pv = new FloatList(x, y);
    Zone = new FloatList();
  }

  void Draw() {
  }

  void Drawn() {


    // basic structure for ONE zone!!!
    beginShape();
    noStroke();
    for (int i = 0; i < Zone.size(); i = i +2) {
      vertex(Zone.get(i), Zone.get(i+1));
      endShape(CLOSE);
    }
    
    // need to make elipses handlers which pass new coordinates unto Zone
    for (int i = 0; i < Zone.size(); i = i +2) {
      ellipse(Zone.get(i), Zone.get(i+1), 10, 10);

      if ((mouseX > Zone.get(i)-10) && (mouseX < Zone.get(i)+10) &&
          (mouseY > Zone.get(i+1)-10) && (mouseY < Zone.get(i+1)+10)){
           
           fill(153);
           hover = true; 
           println();
          } else {
           fill(255); 
    }
  }
  }


  void P1() {
    vertext();
    pv();
    Zone.append(pv.get(0));
    Zone.append(pv.get(1));
    println(vertext, Zone);
  }

 void P2() {
   
   
  }



  int vertext() {
    return vertext = vertext + 1;
  }

  FloatList pv () {
    pv = new FloatList();
    x = mouseX;
    y = mouseY;
    pv.append(x);
    pv.append(y);
    return pv;
  }


 

  void diff() {
    // pass colors to Plot.draw
    if (key == 'f') {
      fill(228, 224, 161); 
      purpose = 8;
    }

    if (key == 'r') {
      fill(163, 224, 161);  
      purpose = 1;
    }
  }
}