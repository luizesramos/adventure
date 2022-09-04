public class Spear {
  private final int DROPPED = 0, HELD = 1, DROPPING = 2;
  private int x = 50, y = 50, size = 30, state = DROPPED;
  private int holdX = 0, holdY = 0;

  int getSize() {
    return size;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }

  void draw() {
    stroke(255, 255, 0);
    float sideSize = this.size * 0.3;
    line(x, y, x + sideSize, y + sideSize);
    line(x, y, x + sideSize, y - sideSize);
    line(x, y, x + size, y);
  }

  void move(Dude dude) {
    if (directional.getAction()) {
      state = DROPPING;
    }

    if (state == DROPPING) {
      if (!isNear(dude)) {
        state = DROPPED;
      }
      return;
    }

    if (state == HELD) {
      x = dude.getX() + holdX;
      y = dude.getY() + holdY;
    } else {
      if (isNear(dude)) {
        state = HELD;
        holdX = x - dude.getX();
        holdY = y - dude.getY();
      }
    }
  }

  private boolean isNear(Dude dude) {
    final float threshold = (spear.getSize() * 0.5) + (dude.getSize() * 0.5);
    return abs(dude.getX() - spear.getX()) < threshold && abs(dude.getY() - spear.getY()) < threshold;
  }
}
