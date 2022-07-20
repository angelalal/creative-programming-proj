
void draw() {

//INCLUDE ALL DRAW FUNCTION CONTENTS INSIDE THIS IF STATEMENT
if(shapeList.get(currentShapeIdx).stopAtTop() == true){
  
  


if(shapeList.get(currentShapeIdx).canMoveDown()){
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
  
    for (int x=0; x<width/blockSize; x++) {
    for (int y=0; y<height/blockSize; y++) {
      fill(255);
      stroke(200);
      rect (x*blockSize, y*blockSize, blockSize, blockSize);
      
    }
  }
  
    if(frameCount%5 == 0){
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
      if (blocks[x][y]==1) {
        fill(0);
      } else{
        fill(255);
      }
      for(int i=0; i<shapeList.get(currentShapeIdx).getArr().length; i++){
      int a = shapeList.get(currentShapeIdx).getArr()[i][0];
      int b = shapeList.get(currentShapeIdx).getArr()[i][1];
      if(x == a && y == b){
        fill(0);
      }
      }
      rect (x*blockSize, y*blockSize, blockSize, blockSize);
      
    }
  }
  
}
  

  

  
}
