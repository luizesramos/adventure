Directional directional;
Dude dude;
Spear spear;
Room room;

void setup() {
  size(400, 400);
  directional = new Directional(width-25, height-25, 30);
    
  room = new Room(20);
  
  dude = new Dude(15, directional);
  dude.enterRoom(room);
  
  spear = new Spear(25);
  colorMode(RGB);
}

void draw() {
  room.draw();
  directional.draw();
  spear.draw();
  dude.draw();
  spear.move(dude);
}

void keyPressed() {
  directional.keyPressed(keyCode, key);
}

void keyReleased() {
  directional.keyReleased(keyCode, key);
}
