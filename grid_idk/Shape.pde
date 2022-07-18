class Shape{
  int type;
  int[][] arr;
  
  Shape(int type){
    this.type = type;
    if(type == 0){
      arr = new int[][]{
        new int[]{3, 3}
        , new int[]{3, 4}
        , new int[]{3, 5}
        , new int[]{3, 6}
      };
    }
  }
  
  int[][] getArr(){
    return arr;
  }
  
}
