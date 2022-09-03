public class Directional {
  private int x, y, size;
  private boolean up = false, down = false;
  private boolean left = false, right = false;
  private boolean action = false;
  
  Directional(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  public boolean getAction() { return action; }
  public boolean isUp() { return up; }
  public boolean isDown() { return down; }
  public boolean isLeft() { return left; }
  public boolean isRight() { return right; }
  
  void keyPressed(int keyCode, char key) {
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

  void keyReleased(int keyCode, char key) {
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
  
  void draw() {
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
  
  private void activeFill(boolean isActive) {
    fill(isActive ? 0x000000 : 0xffffff);
  }
}
