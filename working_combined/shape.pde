class Shape{
  int type;
  int[][] arr;
  
  Shape(int type){
    this.type = type;
    if(type == 0){ //stick
      arr = new int[][]{
        new int[]{9, 0}
        , new int[]{9, 1}
        , new int[]{9, 2}
        , new int[]{9, 3}
      };
    } else if(type == 1){ //J
      arr = new int[][]{
        new int[]{10, 1}
        , new int[]{10, 2}
        , new int[]{10, 3}
        , new int[]{9, 3}
      };
    } else if(type == 2){ // L
      arr = new int[][]{
        new int[]{9, 1}
        , new int[]{9, 2}
        , new int[]{9, 3}
        , new int[]{10, 3}
      };
    } else if(type == 3){ //square
      arr = new int[][]{
        new int[]{9, 0}
        , new int[]{9, 1}
        , new int[]{10, 0}
        , new int[]{10, 1}
      };
    } else if(type == 4){ //Z
      arr = new int[][]{
        new int[]{8, 0}
        , new int[]{9, 0}
        , new int[]{9, 1}
        , new int[]{10, 1}
      };
    } else if(type == 5){ //S
      arr = new int[][]{
        new int[]{10, 0}
        , new int[]{9, 0}
        , new int[]{9, 1}
        , new int[]{8, 1}
      };
    } else if(type == 6){ //mid
      arr = new int[][]{
        new int[]{8, 1}
        , new int[]{9, 0}
        , new int[]{9, 1}
        , new int[]{10, 1}
      };
    }
  }
  
  int[][] getArr(){
    return arr;
  }
  
  boolean canMove(){
    boolean boo=true;
    for(int i=0; i<arr.length; i++){
      int a = arr[i][0];
      int b = arr[i][1];
      //println(a, b, blocks[a+1][b]);
     if(b>=height/blockSize-1 || blocks[a][b+1] == 1){
      boo = false ;
     }
    }
    return boo;
  }
  
  void draw(){
    for(int i=0; i<arr.length; i++){
      int x = arr[i][0];
      int y = arr[i][1];
      fill(0);
     rect(x*blockSize, y*blockSize, blockSize, blockSize); 
     print(x, "i" , y, "j");
    }
  }
  
  void update(){
    boolean boo = canMove();
    if(boo){
      for (int x=0; x<arr.length; x++) {
        
          int value = arr[x][1];
          arr[x][1] = value + 1;
            
      }
    } else {
      for (int x=0; x<arr.length; x++) {
        //println(arr[x][0], arr[x][1]);
        int a = arr[x][0];
        int b = arr[x][1];
        blocks[a][b] = 1;
        println("settle");
        //println(blocks[a][b]);
      }
      shapeList.add(new Shape((int)random(0, 7)));
      currentShapeIdx++;
    }
  }
  
  void rotater(){
    //int [] mid = new int[2];
    //mid = arr[2];
    int midA = arr[2][0];
    int midB = arr[2][1];
    for(int x=0; x<arr.length; x++){
      int a = arr[x][0];
      int b = arr[x][1];
      blocks[a][b] = 0;
      arr[x][0] = -b;
      arr[x][1] = a;
      //println(a, b, arr[x][0], arr[x][1]);
    }
    int aDiff = midA - arr[2][0];
    int bDiff = midB - arr[2][1];
    for(int x=0; x<arr.length; x++){
     arr[x][0] += aDiff;
     arr[x][1] += bDiff;
     //println(midA, midB, arr[x][0], arr[x][1], aDiff, bDiff);
    }
    
  }
  
  void moveRight(){
    boolean canMoveRight = true;
      for(int i=0; i<arr.length; i++){
        if(arr[i][0]>=width/blockSize - 1){
          canMoveRight = false ;
        }
      }
    if(canMoveRight){
      for (int y=0; y<arr.length; y++) {
        int value = arr[y][0];
        arr[y][0] = value + 1;
      }
    }
  }
  
   void moveLeft(){
     boolean canMoveLeft = true;
     for(int i=0; i<arr.length; i++){
       if(arr[i][0]<=0){
        canMoveLeft = false ;
       }
     }
     if(canMoveLeft){
       for (int y=0; y<arr.length; y++) {
         int value = arr[y][0];
         arr[y][0] = value - 1;
       }
     }
  }
}
