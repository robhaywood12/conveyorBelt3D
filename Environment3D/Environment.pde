class Environment {
  void walls() {
    pushMatrix();
    translate(-250,0,0);
    //box(1000, 800, 1000);
    rotateZ(PI);
    shape(theRoom);
    popMatrix();
  }
  
  void table() {
    pushMatrix();
    rotateZ(PI);
    rotateY(PI);
    translate(175,-400,300);
    shape(table, 0, 0);
    popMatrix();
    
    pushMatrix();
    rotateZ(PI);
    rotateY(PI);
    translate(100, -400, 375);
    shape(chair, 0, 0);
    translate(0, 0, -150);
    shape(chair, 0, 0);
    popMatrix();
    
    pushMatrix();
    rotateZ(PI);
    rotateY(PI);
    translate(-500, -400, 275);
    shape(tableandChair);
    popMatrix();
  }
  
  void voidThing() {
    pushMatrix();
    translate(-750, 285, 0);
    rotateZ(PI);
    rotateY((3*PI)/2);
    shape(voidThing);
    popMatrix();
    
    pushMatrix();
    translate(250, 285, 0);
    rotateY(-PI/2);
    rotateZ(PI);
    shape(voidThing);
    popMatrix();
  }
}