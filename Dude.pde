public class Dude {
  private int x = 200, y = 200, size = 15;
  private int vx = 0, vy = 0, speed = 5;
  private Directional directional;
  
  Dude(Directional directional) {
    this.directional = directional;
  }

  int getX() { return x; }
  int getY() { return y; }
  int getSize() { return size; }

    void draw() {
    fill(0xffffff);
    rect(x, y, size, size);
    if(directional.isUp()) {
      vy = -speed;
    } else if(directional.isDown()) {
      vy = speed;
    } else {
      if(vy > 0) {
        vy -= 1;
      } else {
        vy = 0;
      }
    }
    if(directional.isLeft()) {
      vx = -speed;
    } else if(directional.isRight()) {
      vx = speed;
    } else {
      if(vx > 0) {
        vx -= 1;
      } else {
        vx = 0;
      }
    }
    x = (x + vx + width) % width;
    y = (y + vy + height) % height;
  }
}
