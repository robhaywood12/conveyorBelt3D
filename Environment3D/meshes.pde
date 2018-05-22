class Meshes extends conveyorBelt {
  //int rotation;
  float inc = 0.0;
  
  void drawMesh(PShape a, float x, float y) {
    inc += 0.01;
    pushMatrix();
    // moves the model to the right. x is changed from convey function
    translate(x, y);
    rotateY(inc);
    rotateZ(PI);
    shape(a);
    popMatrix();
  }
  


}