//queasy stuff
import queasycam.*;
QueasyCam cam;
//end queasy stuff

import processing.sound.*;
SoundFile music;

//classes
conveyorBelt belt;
conveyorBelt belt2;
Meshes mesh;
Meshes mesh2;
HUD hud;
Environment room;
//end classes

// p shapes
PShape rectMesh;
PShape turtle;
PShape duck;
PShape carl;
PShape voidThing;
PShape hand;
PShape alpaca;
PShape bow;
PShape table;
PShape chair;
PShape tableandChair;
PShape theRoom;
// end p shapes

// UV images
PImage duckUV;
PImage roomUV;
PImage beltUV;
PImage alpacaUV;
PImage carlUV;
PImage myBowUV;
PImage turtleUV;
PImage handUV;
PImage tchairUV;
PImage tableUV;
// end UVs

//booleans
boolean isPaused = false;
boolean isConveying = true;
boolean turtleShown = false;
boolean turtleDisplay = false;
boolean duckShown = false;
boolean duckDisplay = false;
boolean carlShown = false;
boolean carlDisplay = false;
boolean alpacaShown = false;
boolean alpacaDisplay = false;
boolean bowShown = false;
boolean bowDisplay = false;
boolean handShown = false;
boolean handDisplay = false;
boolean musicPlaying = true;
//end booleans

float x;

void setup() {
  //noStroke();
  size(1024,576,P3D);
  music = new SoundFile(this, "music.mp3");
  music.loop();
  
  // class object initializations
  belt = new conveyorBelt();
  belt2 = new conveyorBelt();
  mesh = new Meshes();
  mesh2 = new Meshes();
  hud = new HUD();
  room = new Environment();
  
  // end class object inits
  
  //textures
  duckUV = loadImage("duckUV.jpg");
  roomUV = loadImage("roomUV.jpg");
  beltUV = loadImage("beltUV.jpg");
  alpacaUV = loadImage("alpacaUV.jpg");
  carlUV = loadImage("carlUV.jpg");
  myBowUV = loadImage("myBowUV.jpg");
  turtleUV = loadImage("turtleUV.jpg");
  handUV = loadImage("handUV.jpg");
  tchairUV = loadImage("tchairUV.jpg");
  tableUV = loadImage("tableUV.jpg");
  // end textures
  
  // .obj initializations
  turtle = loadShape("object1.obj");
  turtle.scale(15);
  turtle.setTexture(turtleUV);
  rectMesh = loadShape("rectobj.obj");
  rectMesh.scale(15);
  rectMesh.setTexture(beltUV);
  duck = loadShape("duckZB.obj");
  duck.setTexture(duckUV);
  duck.scale(5);
  carl = loadShape("carl.obj");
  carl.scale(2);
  carl.setTexture(carlUV);
  voidThing = loadShape("voidThing.obj");
  voidThing.scale(10);
  hand = loadShape("hand.obj");
  hand.scale(0.4);
  hand.setTexture(handUV);
  alpaca = loadShape("alpaca.obj");
  alpaca.scale(10);
  alpaca.setTexture(alpacaUV);
  bow = loadShape("myBow.obj");
  bow.scale(18);
  bow.setTexture(myBowUV);
  table = loadShape("table.obj");
  table.scale(10);
  table.setTexture(tableUV);
  chair = loadShape("chair.obj");
  chair.scale(10);
  chair.setTexture(beltUV);
  tableandChair = loadShape("tableandChair.obj");
  tableandChair.scale(8);
  tableandChair.setTexture(tchairUV);
  theRoom = loadShape("theRoom.obj");
  theRoom.setTexture(roomUV);
  
  // end obj inits
  

  
  //queasy cam stuff
  cam = new QueasyCam(this);
  cam.speed = 5;
  cam.sensitivity = 0.5;
  cam.position = new PVector(-250,180,140);
  cam.friction = 0;
  //end queasycam
  
  
}

void draw() {
  background(0);
  ambientLight(255,255,255);
  directionalLight(255,255,255,.2,1,.4);
  //lights();
  //belt.display();
  spawnModels();
  belt.convey();
  //spawnModels();
  mesh.convey();
  belt.Reset();
  room.walls();
  room.voidThing();
  room.table();
  
  hud.displayHUD();
  hud.meshInfo();
  println(frameRate);
}


void keyPressed() {
  if (key == 'm' && !musicPlaying) {
    music.loop();
    musicPlaying = true;
  } else if (key == 'm' && musicPlaying) {
    music.stop();
    musicPlaying = false;
  }
  if (key == ' ' && !isPaused) {
    isPaused = true;
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    textMode(MODEL);
    textSize(20);
    fill(0,0,0);
    stroke(255);
    rect(0, height/8, width, height/2);
    fill(255,255,255);
    text("Paused. Press Spacebar to Unpause", width/16, height/4);
    text("-Use the mouse to move the camera", width/16, height/4 + 40);
    text("-Press S to Stop/Start the Conveyor Belt", width/16, height/4 + 80);
    text("-Once Stopped, press D to Open/Close Details Window", width/16, height/4 + 120);
    text("-Press M to Start/Stop playing the Music", width/16, height/4 + 160);
    
    hint(ENABLE_DEPTH_TEST);
    noLoop();
  } else if (key == ' ' && isPaused) {
    isPaused = false;
    loop();
  }
    
  if (key == 's' && isConveying) {
    belt.stopConvey();
    mesh.stopConvey();
    isConveying = false;
    } else if (key == 's' && !isConveying && !(turtleDisplay || duckDisplay 
    || carlDisplay || handDisplay || alpacaDisplay || bowDisplay)) {
    belt.startConvey();
    mesh.startConvey();
    isConveying = true;
  }
  if (key == 'd' && turtleShown && !isConveying) {
    if (turtleDisplay) {
      turtleDisplay = false;
    } else if (!turtleDisplay) {
      turtleDisplay = true;
    }
    
  }
  
  if (key == 'd' && duckShown && !isConveying) {
    if (duckDisplay) {
      duckDisplay = false;
    } else if (!duckDisplay) {
      duckDisplay = true;
    }
  }
  if (key == 'd' && carlShown && !isConveying) {
    if (carlDisplay) {
      carlDisplay = false;
    } else if (!carlDisplay) {
      carlDisplay = true;
    }
  }
  if (key == 'd' && handShown && !isConveying) {
    if (handDisplay) {
      handDisplay = false;
    } else if (!handDisplay) {
      handDisplay = true;
    }
  }
  if (key == 'd' && alpacaShown && !isConveying) {
    if (alpacaDisplay) {
      alpacaDisplay = false;
    } else if (!alpacaDisplay) {
      alpacaDisplay = true;
    }
  }
  if (key == 'd' && bowShown && !isConveying) {
    if (bowDisplay) {
      bowDisplay = false;
    } else if (!bowDisplay) {
      bowDisplay = true;
    }
  }
}


void spawnModels() {
  mesh.drawMesh(turtle, (x - 400), height/2 - 50);
  mesh.drawMesh(hand, (x - 600), height/2 - 10);
  mesh.drawMesh(duck, (x - 800), height/2 - 10);
  mesh.drawMesh(alpaca, (x - 1000), height/2 - 10);
  mesh.drawMesh(carl, (x - 1200), height/2 - 10);
  mesh.drawMesh(bow, (x - 1400), height/2 - 40);
  shape(rectMesh,x,height/2);
  shape(rectMesh,x-500,height/2);
  shape(rectMesh,x-1000,height/2);
}

void spawnModels2() {
  mesh2.drawMesh(turtle, (x - 1600), height/2 - 50);
  mesh2.drawMesh(hand, (x - 1800), height/2 - 10);
  mesh2.drawMesh(duck, (x - 2000), height/2 - 10);
  mesh2.drawMesh(alpaca, (x - 2200), height/2 - 10);
  mesh2.drawMesh(carl, (x - 2400), height/2 - 10);
  mesh2.drawMesh(bow, (x - 2600), height/2 - 40);
  //belt2.display();
  shape(rectMesh,x - 1500,height/2);
  shape(rectMesh,x-2000,height/2);
  shape(rectMesh,x-2500,height/2);
  
}