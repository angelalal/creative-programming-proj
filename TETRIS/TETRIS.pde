int blockSize = 30;

int[][] blocks;

ArrayList<Shape> shapeList = new ArrayList<>();
int currentShapeIdx;

int counter;
int score;

boolean gameOverBoo = false;

import ddf.minim.*;
import processing.sound.*;

//AudioPlayer player;
//Minim minim;
SoundFile gameOver, blockPlaced, rowCleared;

void setup() {
  size (390, 600);
  colorMode(HSB);

  blocks = new int[width/blockSize][height/blockSize];
  
  //frameRate(1);
  
  shapeList.add(new Shape((int)random(0, 7)));
  currentShapeIdx = 0;
  
  gameOver =  new SoundFile(this, "gameOver2.wav");
  
  
  
  

}

void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      if(shapeList.get(currentShapeIdx).canMoveDown() 
      && shapeList.get(currentShapeIdx).canMoveRight() 
      && shapeList.get(currentShapeIdx).canMoveLeft()){
        shapeList.get(currentShapeIdx).rotater();
      }
    }
    else if(keyCode == DOWN && shapeList.get(currentShapeIdx).canMoveDown()){
     for (int x=0; x<shapeList.get(currentShapeIdx).arr.length; x++) {
          int value = shapeList.get(currentShapeIdx).arr[x][1];
          shapeList.get(currentShapeIdx).arr[x][1] = value + 1;
      } 
    }
    else if (keyCode == RIGHT){
      shapeList.get(currentShapeIdx).moveRight();
      //println("yay");
    }
    else if (keyCode == LEFT){
      shapeList.get(currentShapeIdx).moveLeft();
      //println("woo");
     }
    
  }
}

void draw() {

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
  
  if(frameCount%20 == 0){
    shapeList.get(currentShapeIdx).update();
  }
  
//  if (keyPressed == true && frameCount%5==0){
//    if (key == CODED){
//      if (keyCode == RIGHT){
//        shapeList.get(currentShapeIdx).moveRight();
//        //println("yay");
//      }
//    }
     
//  if (key == CODED){
//    if (keyCode == LEFT){
//      shapeList.get(currentShapeIdx).moveLeft();
//      //println("woo");
//     }
//  }
//}
  
  
 
 //blocks[3][3] = 1;
   
  clearFilledRow();

  for (int x=0; x<width/blockSize; x++) {
    for (int y=0; y<height/blockSize; y++) {
      fill(255);
      stroke(200);
      rect (x*blockSize, y*blockSize, blockSize, blockSize);
      
    }
  }
  
  for (int x=0; x<width/blockSize; x++) {
    for (int y=0; y<height/blockSize; y++) {
      if (blocks[x][y]==1) {
        fill(0);
      } else{
        fill(x*17, 35, 225);
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
  

  
  
  } else{
   background(0); 
   textSize(100);
   fill(255);
   text("GAME", 75, 200);
   text("OVER", 80, 300);
   gameOverBoo = true;
   //playSound();
   
   
   if(!gameOver.isPlaying())gameOver.play(1);
   
   //minim = new Minim(this);
   //player = minim.loadFile("gameOver2.wav", 2048);
   //player.play();
   
  }
  textSize(20);
  fill(0);
  text("SCORE : " + score, 280, 40);
}

void clearFilledRow(){
  //println("start");
  int r = -1;
  for(int y=0; y<height/blockSize; y++){
    r = y;
    for(int x=0; x<width/blockSize; x++) {
      //println(x, y, blocks[x][y]);
      if(blocks[x][y] == 0){
       r = -1;
      }
    //  else{
    //    break;
        
    //}
  }
  //println("end", r);
 if(r>0){
    //println("weeeeeeeeeeeeeeee", r);
    score = counter++ + 1;
    println("Score: " + (counter++ + 1));
    for (int x=0; x<width/blockSize; x++) {
      blocks[x][r] = 0; 
    }
    
    for(int i=(width/blockSize-1); i>=0; i--){
      for(int j=(height/blockSize-2); j>=0; j--) {
        if(blocks[i][j] == 1 && j<r){
         blocks[i][j] = 0;
         //println("Score: " + counter++);
         
         //while(j<height/blockSize-1 || blocks[i][j+1] == 0){
         blocks[i][j+1] = 1;
         //println("Score: " + counter++);
         //println("Score: " + counter++);
         //}
        }
      }
    }
  }
  
 }
 
 

 
}

//void playSound(){
// if(gameOverBoo){
//   if(frameCount%480==0){
//   gameOver =  new SoundFile(this, "gameOver2.wav");
//   gameOver.play(1);
//   }
// }
//}
