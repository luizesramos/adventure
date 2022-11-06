public class Room {
  final int[] rgb = { (int)random(100, 255), (int)random(100, 255), (int)random(100, 255)};
  private Walls  walls;

  Room(int blockSize) {
    walls = new Walls(blockSize);
    
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
  private static final int dimension = 32;
  
  private int[][] blocks;
  private int blockSize;

  Walls(int blockSize) {
      this.blockSize = blockSize;
      blocks = new int[dimension][dimension];
      
      for (int i=0; i<dimension; i++) {
        blocks[0][i] = 1;
        blocks[dimension-1][i] = 1;
        blocks[i][0] = 1;
        blocks[i][dimension-1] = 1;
      }
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
