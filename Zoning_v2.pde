class Zones {

  Table verts;

  FloatList pv;
  float x, y;
  int purpose, vertext, row;
  float xOffset; 
  float yOffset;
  boolean hover, lock;

  Zones() {
    vertext = 0;
    pv = new FloatList(x, y);
    verts = new Table();
    verts.addColumn("x");
    verts.addColumn("y");
  }

  void Draw() {
    //for (int i = 0; i < verts.getRowCount(); i++) {
  }

  void Drawn() {
    for (int i = 0; i < verts.getRowCount(); i++) {
      float x = verts.getFloat(i, 0);
      float y = verts.getFloat(i, 1);

      if ((mouseX > x-20) && (mouseX < x+20) && (mouseY > y-20) && (mouseY < y+20)) {
        hover = true;
        fill(0);
      } else {
        hover = false;
        fill(255);
      }
      ellipse(x, y, 10, 10);
    }
  }

  // P1 below here works!
  // grabs x & y coordinates on every mouseclick, stores temp in pv & writes to expanding floatlist vertices 
  void P1() {
    vertext();
    verts.addRow();
    verts.setFloat(row, 0, pv.get(0));
    verts.setFloat(row, 1, pv.get(1));
    saveTable(verts, "data/zones.csv");
    row++;
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
    if (mouseButton == RIGHT && hover) {
      lock = true;
         for (int i = 0; i < verts.getRowCount(); i++) {
      float x = verts.getFloat(i, 0);
      float y = verts.getFloat(i, 1);
         }
      ellipse(x, y, 100, 100);
    } else {
      lock = false;
    }
      for (int i = 0; i < verts.getRowCount(); i++) {
    xOffset = mouseX-x; 
    yOffset = mouseY-y;
    }
      ellipse(x, y, 100, 100);
  }

void P3() {
  if(mouseButton == RIGHT && lock) {
       for (int i = 0; i < verts.getRowCount(); i++) {
       x = mouseX-xOffset; 
       y = mouseY-yOffset;}
       ellipse(x, y, 100, 100);
    println(x,y);
  }
}

void P4() {
 if (mouseButton == RIGHT){
   for (int i = 0; i < verts.getRowCount(); i++) {
    verts.setFloat(i,0,x);
    verts.setFloat(i,1,y);
    println(verts.getRowCount());
   }
   
   lock = false;
 }
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