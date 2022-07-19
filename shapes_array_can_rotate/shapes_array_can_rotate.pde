
int blockSize = 20;

int[][] blocks;

ArrayList<Shape> shapeList = new ArrayList<>();
int currentShapeIdx;
//Shape shape1;

void setup() {
  size (400, 600);

  blocks = new int[width/blockSize][height/blockSize];
  
  frameRate(5);
  
  //shape1 = new Shape((int)random(0, 7));
  shapeList.add(new Shape(0));
  currentShapeIdx = 0;
 

}


void draw() {
  
  if(shapeList.get(currentShapeIdx).canMove()){
  println(currentShapeIdx);
  for (int x=0; x<width/blockSize; x++) {
    for (int y=0; y<height/blockSize; y++) {
      for (int i=0; i<shapeList.get(currentShapeIdx).getArr().length; i++) {
        if (x==shapeList.get(currentShapeIdx).getArr()[i][0] && y==shapeList.get(currentShapeIdx).getArr()[i][1]) {
        blocks[x][y] = 0;
        }
      }
    }
  }
  }
  
  shapeList.get(currentShapeIdx).update();
  
  for (int x=0; x<width/blockSize; x++) {
    for (int y=0; y<height/blockSize; y++) {
      for (int i=0; i<shapeList.get(currentShapeIdx).getArr().length; i++) {
        if (x==shapeList.get(currentShapeIdx).getArr()[i][0] && y==shapeList.get(currentShapeIdx).getArr()[i][1]) {
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
