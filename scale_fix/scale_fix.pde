int blockSize = 30;

int[][] blocks;

ArrayList<Shape> shapeList = new ArrayList<>();
int currentShapeIdx;

int x,y;

void setup() {
  
  size (300, 600);
  

  blocks = new int[width/blockSize][height/blockSize];
  
  //frameRate(1);
  
  shapeList.add(new Shape((int)random(0,7)));
  currentShapeIdx = 0;

}

void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      if(shapeList.get(currentShapeIdx).canMove()){
        shapeList.get(currentShapeIdx).rotater();
      }
    }
  }
}

void draw() {
  
  //translate(-10,10);
  scale(1);
  
  if(shapeList.get(currentShapeIdx).canMove()){
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
  
  if(frameCount%30 == 0){
    shapeList.get(currentShapeIdx).update();
  }
  
  if (keyPressed == true && frameCount%5==0){
        
        if (key == CODED){
    if (keyCode == RIGHT){
      shapeList.get(currentShapeIdx).moveRight();
      //println("yay");
    }
  }
     
  if (key == CODED){
    if (keyCode == LEFT){
      shapeList.get(currentShapeIdx).moveLeft();
      //println("woo");
     }
  }
}
  
  for (int x=0; x<width/blockSize; x++) {
    for (int y=0; y<height/blockSize; y++) {
      for (int i=0; i<shapeList.get(currentShapeIdx).getArr().length; i++) {
        if (x==shapeList.get(currentShapeIdx).getArr()[i][0] && y==shapeList.get(currentShapeIdx).getArr()[i][1]) {
          //println(shape1.getArr()[0][1]);
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
