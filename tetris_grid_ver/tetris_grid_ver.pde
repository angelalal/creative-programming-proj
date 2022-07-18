int blockSize = 20;

int[][] blocks;

void setup() {
  size (400, 600);

  blocks = new int[width/blockSize][height/blockSize];

}


void draw() {
  
  blocks[3][1] = 1;
  blocks[3][2] = 1;
  blocks[3][3] = 1;
  blocks[3][4] = 1;

  for (int x=0; x<width/blockSize; x++) {
    for (int y=0; y<height/blockSize; y++) {
      if (blocks[x][y]==1) {
        fill(0);
      } else {
        fill(255);
      }
      rect (x*blockSize, y*blockSize, blockSize, blockSize);
      
    }
  }
  
  
  
}
