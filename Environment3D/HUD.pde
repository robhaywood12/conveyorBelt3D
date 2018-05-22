class HUD {
  
  //boolean turtleShown = false;
  
  
  void displayHUD() {
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    textMode(MODEL);
    //  textMode(SHAPE);
    textSize(20);
    text("D - Open/Close Details", 10, 20);
    text("S - Pause Conveyor Belt", 400, 20);
    text("Spacebar - Help", 850, 20);
    
    if (x > 500 && x < 600) {
      text("Duck", width/2, 450);
      duckShown = true;
    } else {
      duckShown = false;
    }
    if (x > 650 && x < 800) {
      text("Alpaca", width/2, 450);
      alpacaShown = true;
    } else {
      alpacaShown = false;
    }
    if (x > 850 && x < 1000) {
      text("Carl", width/2, 450);
      carlShown = true;
    } else {
      carlShown = false;
    }
    if (x > 1050 && x < 1200) {
      text("???", width/2, 450);
      bowShown = true;
    } else {
      bowShown = false;
    }
    if (x > 1250 && x < 1400) {
      text("Turtle", width/2, 450);
      turtleShown = true;
    } else {
      turtleShown = false;
    }
    if (x > 1450 && x < 1600) {
      text("Hand", width/2, 450);
      handShown = true;
    } else {
      handShown = false;
    }
    hint(ENABLE_DEPTH_TEST);
  }
  
  void meshInfo () {
    if (turtleDisplay) {
      twodcamFix();
      text("this guy is turtley awesome.", width/3, 185);
      hint(ENABLE_DEPTH_TEST);
      }
      
    if (duckDisplay) {
      twodcamFix();
      text("I'm not sure waddle happen at the end of this conveyor belt.", width/5, 185);
      hint(ENABLE_DEPTH_TEST);
    }
    if (carlDisplay) {
      twodcamFix();
      text("this is Carl.", width/3, 185);
      hint(ENABLE_DEPTH_TEST);
    }
    if (handDisplay) {
      twodcamFix();
      text("A severed hand!? Just tea for me, thanks.", width/4, 185);
      hint(ENABLE_DEPTH_TEST);
    }
    if (alpacaDisplay) {
      twodcamFix();
      text("You don't want to fight me. Alpaca punch.", width/4, 185);
      hint(ENABLE_DEPTH_TEST);
    }
    if (bowDisplay) {
      twodcamFix();
      text("...I don't know", width/3, 185);
      hint(ENABLE_DEPTH_TEST);
    }
  }
  
  void twodcamFix() {
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    textMode(MODEL);
    textSize(20);
    fill(0,0,0);
    stroke(255);
    rect(0, height/4, width + 100, 70);
    fill(255,255,255);
  }
    
    
}