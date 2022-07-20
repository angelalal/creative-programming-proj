//change int[] values to these

  Shape(int type){
    this.type = type;
    if(type == 0){ //stick
      arr = new int[][]{
        new int[]{5, 0}
        , new int[]{5, 1}
        , new int[]{5, 2}
        , new int[]{5, 3}
      };
    } else if(type == 1){ //J
      arr = new int[][]{
        new int[]{5, 1}
        , new int[]{5, 2}
        , new int[]{5, 3}
        , new int[]{4, 3}
      };
    } else if(type == 2){ // L
      arr = new int[][]{
        new int[]{4, 1}
        , new int[]{4, 2}
        , new int[]{4, 3}
        , new int[]{5, 3}
      };
    } else if(type == 3){ //square
      arr = new int[][]{
        new int[]{4, 0}
        , new int[]{4, 1}
        , new int[]{5, 0}
        , new int[]{5, 1}
      };
    } else if(type == 4){ //Z
      arr = new int[][]{
        new int[]{4, 0}
        , new int[]{5, 0}
        , new int[]{5, 1}
        , new int[]{6, 1}
      };
    } else if(type == 5){ //S
      arr = new int[][]{
        new int[]{6, 0}
        , new int[]{5, 0}
        , new int[]{5, 1}
        , new int[]{4, 1}
      };
    } else if(type == 6){ //mid
      arr = new int[][]{
        new int[]{4, 1}
        , new int[]{5, 0}
        , new int[]{5, 1}
        , new int[]{6, 1}
      };
    }
  }
