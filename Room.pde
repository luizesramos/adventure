public class Room {
  private int blockHeight, blockWidth;  
  final int[] rgb = { (int)random(100, 255),  (int)random(100, 255), (int)random(100, 255)};


// walls have coordinates, collision, door, entered door


  Room(int wallThick) {
    this.blockWidth = width / wallThick;
    this.blockHeight = height / wallThick;
  }
  
  //boolean isCollision(int x, int y, int size) {
  //}

  void draw() {
    background(33);
    fill(rgb[0], rgb[1], rgb[2]);
    stroke(rgb[0], rgb[1], rgb[2]);
    
    rect(0, 0, width, blockHeight);
    rect(0, height - blockHeight, width, blockHeight);
    
    rect(0, 0, blockWidth, height);
    rect(width - blockWidth, 0, width - blockWidth, height);
  }
}
