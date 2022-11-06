public class Room {
  final int[] rgb = { (int)random(100, 255), (int)random(100, 255), (int)random(100, 255)};
  private Walls  walls;

  Room(int blockSize) {
    int dimension = 32;
    int doorLen = 6;
    int centerDoor = dimension/2 - doorLen/2;
    walls = new Walls(dimension, blockSize);
    walls.addDoor(WallPosition.NORTH.withOffset(centerDoor).withLength(doorLen));
    walls.addDoor(WallPosition.SOUTH.withOffset(centerDoor).withLength(doorLen));
    walls.addDoor(WallPosition.EAST.withOffset(centerDoor).withLength(doorLen));
    walls.addDoor(WallPosition.WEST.withOffset(centerDoor).withLength(doorLen));
  }
  
  Point collisionAdjusted(int x, int y, int size) {
    // add doors
    // when we walk through a door, the coordinates always wrap around
    return walls.collisionAdjusted(x, y, size);
  }

  void draw() {
    background(33);
    fill(rgb[0], rgb[1], rgb[2]);
    stroke(rgb[0], rgb[1], rgb[2]);
    walls.draw();
  }
}

public class Walls {
  private static final int WALL = 1;
  private static final int DOOR = 2;  
  
  private int dimension;
  private int blockSize;
  private int[][] blocks;

  Walls(int dimension, int blockSize) {
      this.dimension = dimension;
      this.blockSize = blockSize;
      blocks = new int[dimension][dimension];
      
      for (int i=0; i<dimension; i++) {
        blocks[0][i] = 1;
        blocks[dimension-1][i] = WALL;
        blocks[i][0] = 1;
        blocks[i][dimension-1] = WALL;
      }
  }
  
  Walls addDoor(WallPosition position) {
    switch (position) {
      case NORTH:
        for (int i=position.offset; i<position.offset + position.length; i++) {
          blocks[i][0] = DOOR;
        }
        break;
      case WEST:
        for (int i=position.offset; i<position.offset + position.length; i++) {
          blocks[0][i] = DOOR;
        }
        break;
      case SOUTH:
        for (int i=position.offset; i<position.offset + position.length; i++) {
          blocks[i][dimension-1] = DOOR;
        }
        break;
      case EAST:
        for (int i=position.offset; i<position.offset + position.length; i++) {
          blocks[dimension-1][i] = DOOR;
        }
        break;
    }    
    return this;
  }
  
  Point collisionAdjusted(int x, int y, int size) {
    return new Point(x, y);
  }
  
  void draw() {
    for (int r = 0; r < dimension; r++) {
      for (int c = 0; c < dimension; c++) {
        if (blocks[r][c] == 1) {
          rect(r * blockSize, c * blockSize, blockSize, blockSize);
        }
      }
    }
  }
}

public enum WallPosition {
  NORTH, SOUTH, EAST, WEST;
  
  int offset = 0;
  int length = 0;
  
  WallPosition withOffset(int offset) {
    this.offset = offset;
    return this;
  }
  
  WallPosition withLength(int length) {
    this.length = length;
    return this;
  }
}
