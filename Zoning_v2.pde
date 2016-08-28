class Zones {

  float bx1, by1, bx2, by2, bx3, by3, bx4, by4, bx, by; // 

  FloatList B1, B2, B3, B4, Bezier, bt; 

  Table plots;

  int purpose, vertext;

  int[] points = {1, 2, 3, 4};
  ;

  Zones() {
    // zones data table
    plots = new Table();
    plots.addColumn("bx1");
    plots.addColumn("by1");
    plots.addColumn("bx2");
    plots.addColumn("by2");
    plots.addColumn("bx3");
    plots.addColumn("by3");
    plots.addColumn("bx4");
    plots.addColumn("by4");
    plots.addColumn("area");
    plots.addColumn("purpose"); 
    plots.addColumn("tick"); // Tick at which it was drawn
    plots.addColumn("span"); // age in Ticks since it was drawn
    plots.addRow();

    vertext = 0;
    bt = new FloatList(bx1, by1, bx2, by2, bx3, by3, bx4, by4);
  }

  void Draw() {
    beginShape();
    vertex(bt.get(0), bt.get(1));
    bezierVertex(bt.get(2), bt.get(3),bt.get(4), bt.get(5),bt.get(6), bt.get(7));
    endShape();
  }

  void Drawn() {
  }


  void P1() {
    if (mouseButton == LEFT) {
    vertext();
    XY();
    println(vertext, XY());
    }
  }


  int vertext() {
    if (vertext < 4) {
      return vertext = vertext + 1;
    } else {
      return vertext = 1;
            //bt = new FloatList();
    }
  }


  FloatList XY () {


    if (vertext == 1) {

      bt.set(0, mouseX);  
      bt.set(1, mouseY);
      //println(bt, vertext);
    }

    if (vertext == 2) {
      bt.set(2, mouseX);  
      bt.set(3, mouseY);
      //println(bt, vertext);
    }

    if (vertext == 3) {
      bt.set(4, mouseX);  
      bt.set(5, mouseY);
      //println(bt, vertext);
    }

    if (vertext == 4) {
      bt.set(6, mouseX);  
      bt.set(7, mouseY);
      //println(bt, vertext);
    }

    return bt;
  }


  void P2() {
    //if (mouseButton == LEFT) {
    //  // grab 2nd mouse coordinates to calculate plot width, height & surface area
    //  P2 = new FloatList();
    //  P2.append(x2 = mouseX);
    //  P2.append(y2 = mouseY);
    //  // println(P2);  
    //  rec = new FloatList();
    //  rec.append(x1);
    //  rec.append(y1);
    //  rec.append(x2);
    //  rec.append(y2);
    //  // println(rec);
    //  rec.sub(2, rec.get(0));
    //  rec.sub(3, rec.get(1));
    //  rw.set(0, rec.get(2));
    //  rh.set(0, rec.get(3));      
    //  area.set(0, rw.get(0));
    //  area.mult(0, rh.get(0));
    //  if ((area.get(0) < 0)) {
    //    area.mult(0, -1);
    //  }
    //  if (area.get(0) > 0) {
    //    // println(rw);       
    //    // add plot coordinates, width, height & surface area to table, write table and increase plot ID
    //    plots.addRow();
    //    plots.setFloat(id, 0, x1);
    //    plots.setFloat(id, 1, y1);
    //    plots.setFloat(id, 2, rw.get(0));
    //    plots.setFloat(id, 3, rh.get(0));
    //    plots.setFloat(id, 4, area.get(0));
    //    plots.setFloat(id, 5, purpose);
    //    plots.setInt(id, 6, Simulator.GT);
    //    saveTable(plots, "data/zones.csv");
    //    id = id + 1;
    //  }
    //}
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