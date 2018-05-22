class conveyorBelt {
  //PShape s;
  //float x;
  float y;
  //float inc = 0.0;
  boolean willMove = true;
  
  conveyorBelt()  {
    x = width/2;
    y = height/2;
  }
  
  void convey() {
    if (willMove) {
      x += 1;
    }
  }
  
  void Reset() {
    if (x >= 10) {
      spawnModels2();
    }
    //resets the first instance
    if (x >= 1600) {
      x = 400;
    }
  }
    
  
  void stopConvey() {
    if (willMove) {
      willMove = false;
    }
  }
  
  void startConvey() {
    if (!willMove) {
      willMove = true;
    }
  }
    
}