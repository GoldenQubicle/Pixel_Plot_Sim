class Zones {

  Table verts;

  FloatList pv;
  float x, y;
  int purpose, vertext, row, id;
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
    beginShape();
    for (int i = 0; i < verts.getRowCount(); i++) {
      float x = verts.getFloat(i, 0);
      float y = verts.getFloat(i, 1);
    
      vertex(x, y); 
      endShape(CLOSE);
    } 
  }

  void Drawn() {
      


    for (int i = 0; i < verts.getRowCount(); i++) {
      float x = verts.getFloat(i, 0);
      float y = verts.getFloat(i, 1);

      float w = (x+20)-(x-20);
      float h = (y+20)-(y-20);
      if ((mouseX > x-20) && (mouseX < x+20) && (mouseY > y-20) && (mouseY < y+20)) {
        hover = true;
        if (!lock) {
          ellipse(x, y, w, h);
          fill(0);
          id = i;
        }
        if (mouseButton == RIGHT) {
          lock = true; 
          println(i);
        }
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
    if (mouseButton == LEFT) {
      x = mouseX;
      y = mouseY;
      verts.addRow();
      verts.setFloat(row, 0, x);
      verts.setFloat(row, 1, y);
      saveTable(verts, "data/zones.csv");
      row++;
      //println(row);
    }
  }



  //  void P2() {
  //}

  // draw vert_handle while being dragged
  void P3() {
    if (mouseButton == RIGHT && lock == true) {
      x = mouseX; 
      y = mouseY;
      ellipse(x, y, 10, 10);
      //println(id);
    }
  }

  // store new xy coordinates into verts
  void P4() {
    if (mouseButton == RIGHT && lock == true) {
      x = mouseX;
      y = mouseY;
      verts.setFloat(id, 0, x);
      verts.setFloat(id, 1, y);
      lock = false;
      //println(id);
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