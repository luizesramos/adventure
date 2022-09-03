boolean up = false, down = false;
boolean left = false, right = false;
boolean action = false;

int dudeX = 200, dudeY = 200, dudeSize = 15;
int vx = 0, vy = 0, speed = 5;

final int DROPPED = 0, HELD = 1, DROPPING = 2; 
int spearX = 50, spearY = 50, spearSize = 30, spearState = DROPPED;
int holdX = 0, holdY = 0;

void setup(){
  size(400, 400);
  colorMode(RGB, 0xffffff);
}

void draw() {
  background(33);
  drawDirectional(width-50, height-50, 75);
  drawSpear();
  drawDude();
  moveSpear();
}

void moveSpear() {
  if(action) {
    spearState = DROPPING;
  }
  
  if(spearState == DROPPING) {
    if(!isDudeNearSpear()) {
      spearState = DROPPED;
    }
    return;
  }

  if(spearState == HELD) {
    spearX = dudeX + holdX;
    spearY = dudeY + holdY;
  } else {
    if(isDudeNearSpear()) {
      spearState = HELD;
      holdX = spearX - dudeX;
      holdY = spearY - dudeY;
    }
  }  
}

boolean isDudeNearSpear() {
  final float threshold = (spearSize * 0.5) + (dudeSize * 0.5);
  return abs(dudeX - spearX) < threshold && abs(dudeY - spearY) < threshold;
}

void drawSpear() {
  stroke(0xffffff);
  float size = spearSize * 0.3;
  line(spearX, spearY, spearX + size, spearY + size);
  line(spearX, spearY, spearX + size, spearY - size);
  line(spearX, spearY, spearX + spearSize, spearY);
}

void drawDude() {
  fill(0xffffff);
  rect(dudeX, dudeY, dudeSize, dudeSize);
  if(up) {
    vy = -speed;
  } else if(down) {
    vy = speed;
  } else {
    if(vy > 0) {
      vy -= 1;
    } else {
      vy = 0;
    }
  }
  if(left) {
    vx = -speed;
  } else if(right) {
    vx = speed;
  } else {
    if(vx > 0) {
      vx -= 1;
    } else {
      vx = 0;
    }
  }
  dudeX = (dudeX + vx + width) % width;
  dudeY = (dudeY + vy + height) % height;
}

void drawDirectional(int x, int y, int size) {
  fill(0xffffff);
  stroke(0x000000);
  circle(x, y, size);
  float ts = 0.2 * size; // triangle side size
  float offset = 0.25 * size; // y offset for up/down; x offset for letf/right
  // up
  activeFill(up);
  triangle(x, y-ts-offset, x+ts, y-offset, x-ts, y-offset);
  // down
  activeFill(down);
  triangle(x, y+ts+offset, x+ts, y+offset, x-ts, y+offset);
  //left
  activeFill(left);
  triangle(x-ts-offset, y, x-offset, y+ts, x-offset, y-ts);
  // right
  activeFill(right);
  triangle(x+ts+offset, y, x+offset, y+ts, x+offset, y-ts);
  
  if(action) {
    fill(0x000000);
    circle(x, y, size * 0.2);
  }
}

void activeFill(boolean isActive) {
  fill(isActive ? 0x000000 : 0xffffff);
}

void keyPressed() {
  if (keyCode == 38) {
    up = true;
  } else if (keyCode == 40) {
    down = true;
  } else if (keyCode == 37) {
    left = true;
  } else if (keyCode == 39) {
    right = true;
  } else if (key == ' ') {
    action = true;
  }
}

void keyReleased() {
  if (keyCode == 38) {
    up = false;
  } else if (keyCode == 40) {
    down = false;
  } else if (keyCode == 37) {
    left = false;
  } else if (keyCode == 39) {
    right = false;
  } else if (key == ' ') {
    action = false;
  }
}
