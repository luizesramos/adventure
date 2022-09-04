public class Dude {
  private int x = 200, y = 200, size;
  private int vx = 0, vy = 0, speed = 5;
  private Directional directional;
  private int[] rgb = { 255, 255, 255 };

  Dude(int size, Directional directional) {
    this.size = size;
    this.directional = directional;
  }

  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  int getSize() {
    return size;
  }

  void setColor(int[] rgb) {
    this.rgb = rgb;
  }

  void draw() {
    fill(rgb[0], rgb[1], rgb[2]);
    stroke(rgb[0], rgb[1], rgb[2]);

    rect(x, y, size, size);
    
    if (directional.isUp()) {
      vy = -speed;
    } else if (directional.isDown()) {
      vy = speed;
    } else {
      if (vy > 0) {
        vy -= 1;
      } else {
        vy = 0;
      }
    }
    if (directional.isLeft()) {
      vx = -speed;
    } else if (directional.isRight()) {
      vx = speed;
    } else {
      if (vx > 0) {
        vx -= 1;
      } else {
        vx = 0;
      }
    }
    
    int ghostAffordance = 20;
    x = (x + vx + width + ghostAffordance) % (width + ghostAffordance);
    y = (y + vy + height + ghostAffordance) % (height + ghostAffordance);
  }
}
