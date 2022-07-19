
int blockSize = 20;

int[][] blocks;

Shape shape1;

void setup() {
  size (400, 600);

  blocks = new int[width/blockSize][height/blockSize];
  
  frameRate(1);
  
  shape1 = new Shape(0);
 

}


void draw() {
  
  //for (int x=0; x<width/blockSize; x++) {
  //  for (int y=0; y<height/blockSize; y++) {
  //    for (int i=0; i<shape1.getArr().length; i++) {
  //      for (int j=0; j<shape1.getArr()[0].length; j++) {
  //        if (x==shape1.getArr()[i][j] && y==shape1.getArr()[i][j]) {
  //        blocks[x][y] = 0;
  //        }
  //      }
        
  //    }
  //  }
  //}
  
  shape1.update();
  
  for (int x=0; x<width/blockSize; x++) {
    for (int y=0; y<height/blockSize; y++) {
      for (int i=0; i<shape1.getArr().length; i++) {
        if (x==shape1.getArr()[i][0] && y==shape1.getArr()[i][1]) {
          println(shape1.getArr()[0][1]);
          blocks[x][y] = 1;
        }
      }
    }
  }
 
 //blocks[3][3] = 1;
   

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
