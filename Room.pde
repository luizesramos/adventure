public abstract class Wall {
  final int x, y, w, h;

  Wall(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  abstract boolean isCollision(int pX, int pY, int size);
  abstract void draw();

  boolean isPointInRect(int pX, int pY, int rx1, int ry1, int rx2, int ry2) {
    return (pX >= rx1 && pX < rx2) && (pY >= ry1 && pY < ry2);
  }
}

public class WallWithDoor extends Wall {
  private final boolean isHorizontal;
  private final int doorWidth;

  WallWithDoor(int x, int y, int w, int h) {
    super(x, y, w, h);
    isHorizontal = (w > h);
    float factor = 0.27;
    doorWidth = (int)(isHorizontal ? factor * w : factor * h);
  }

  boolean isCollision(int pX, int pY, int size) {
    return isPointInRect(pX, pY, x, y, x + w, y + h) || isPointInRect(pX + size, pY + size, x, y, x + w, y + h);


    return false;
  }

  void draw() {
    if (isHorizontal) {
      rect(x, y, x + (w >> 1) - (doorWidth >> 1), y + h);
      rect(x + (w >> 1) + (doorWidth >> 1), y, x + w, y + h);
    } else {
      rect(x, y, x + w, y + (h >> 1) - (doorWidth >> 1));
      rect(x, y + (h >> 1) + (doorWidth >> 1), x + w, y + h);
    }
  }
}

public class ClosedWall extends Wall {
  ClosedWall(int x, int y, int w, int h) {
    super(x, y, w, h);
  }

  boolean isCollision(int pX, int pY, int size) {
    return isPointInRect(pX, pY, x, y, x + w, y + h) || isPointInRect(pX + size, pY + size, x, y, x + w, y + h);
  }

  void draw() {
    rect(x, y, x + w, y + h);
  }
}


// walls have coordinates, collision, door, entered door

public class Room {
  private int blockHeight, blockWidth;
  final int[] rgb = { (int)random(100, 255), (int)random(100, 255), (int)random(100, 255)};
  private Wall[]  walls;

  Room(int wallThick) {
    this.blockWidth = width / wallThick;
    this.blockHeight = height / wallThick;

    //walls = new Wall[] {
    //  new ClosedWall(0, 0, width, blockHeight),
    //  new ClosedWall(0, height - blockHeight, width, blockHeight),
    //  new ClosedWall(0, 0, blockWidth, height),
    //  new ClosedWall(width - blockWidth, 0, width - blockWidth, height)
    //};

    walls = new Wall[] {
      new WallWithDoor(0, 0, width, blockHeight),
      new WallWithDoor(0, height - blockHeight, width, blockHeight),
      new WallWithDoor(0, 0, blockWidth, height),
      new WallWithDoor(width - blockWidth, 0, width - blockWidth, height)
    };

    //walls = new Wall[] {
    //  new ClosedWall(0, 0, width, blockHeight),
    //  new WallWithDoor(0, height - blockHeight, width, blockHeight),
    //  new WallWithDoor(0, 0, blockWidth, height),
    //  new ClosedWall(width - blockWidth, 0, width - blockWidth, height)
    //};
  }

  boolean isCollision(int x, int y, int size) {
    for (Wall wall : walls) {
      if (wall.isCollision(x, y, size)) {
        return true;
      }
    }
    return false;
  }

  void draw() {
    background(33);
    fill(rgb[0], rgb[1], rgb[2]);
    stroke(rgb[0], rgb[1], rgb[2]);

    for (Wall wall : walls) {
      wall.draw();
    }
  }
}
