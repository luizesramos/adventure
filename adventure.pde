Directional directional;
Dude dude;
Spear spear;

void setup(){
  size(400, 400);
  directional = new Directional(width-25, height-25, 50);
  dude = new Dude(directional);
  spear = new Spear();
  colorMode(RGB, 0xffffff);
}

void draw() {
  background(33);
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
