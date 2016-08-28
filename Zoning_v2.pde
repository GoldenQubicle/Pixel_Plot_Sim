class Zones {

  Table verts;
  
  FloatList pv, vertices;
  float x, y;
  int purpose, vertext;

  boolean hover;

  Zones() {
    vertext = 0;
    pv = new FloatList(x, y);
    vertices = new FloatList();
    verts = new Table();
  }

  void Draw() {
  }

  void Drawn() {


    // basic structure for ONE zone!!!
    beginShape();
    noStroke();
    for (int i = 0; i < vertices.size(); i = i +2) {
      vertex(vertices.get(i), vertices.get(i+1));
      endShape(CLOSE);
    }

    // need to make elipses handlers which pass new coordinates unto Zone
    for (int i = 0; i < vertices.size(); i = i +2) {
      ellipse(vertices.get(i), vertices.get(i+1), 10, 10);

      if ((mouseX > vertices.get(i)-10) && (mouseX < vertices.get(i)+10) &&
        (mouseY > vertices.get(i+1)-10) && (mouseY < vertices.get(i+1)+10)) {

        fill(153);
        ellipse(vertices.get(i), vertices.get(i+1), 10, 10);
        hover = true;
      } else {
        fill(255);
      }
    }
  }

  // P1 below here works!
  // grabs x & y coordinates on every mouseclick, stores temp in pv & writes to expanding floatlist vertices 
  void P1() {
    //check();
    vertext();
    vertices.append(pv.get(0));
    vertices.append(pv.get(1));
    //println(vertext, vertices);
  }

  int check() {
    return vertext = vertext + 1;
  }

  FloatList vertext () {
    pv = new FloatList();
    x = mouseX;
    y = mouseY;
    pv.append(x);
    pv.append(y);
    return pv;
  }

  void P2() {
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