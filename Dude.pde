public class Dude {
  private int x = 200, y = 200, size;
  private int vx = 0, vy = 0, speed = 5;
  private Directional directional;
  private int[] rgb = { 255, 255, 255 };
  private Room room;

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

  void enterRoom(Room room) {
    this.rgb = room.rgb;
    this.room = room;
  }

  void draw() {
    fill(rgb[0], rgb[1], rgb[2]);
    stroke(rgb[0], rgb[1], rgb[2]);

    rect(x, y, size, size);

    updateVelocity();
    move();
  }

  private void updateVelocity() {
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
  }

  private void move() {
    final int ghostAffordance = 20;
    int projectedX = (x + vx + width + ghostAffordance) % (width + ghostAffordance);
    int projectedY = (y + vy + height + ghostAffordance) % (height + ghostAffordance);

    if (room == null) {
      x = projectedX;
      y = projectedY;
    }
    
    Point p = room.collisionAdjusted(projectedX, projectedY, size);
    x = p.getX();
    y = p.getY();
 }
}
