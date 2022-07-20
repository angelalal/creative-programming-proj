//add to Shape tab
  
  boolean stopAtTop(){
     boolean start = true;
    //for(int i=0; i<arr.length; i++){
    //  int a = arr[i][0];
    //  int b = arr[i][1];
  
    // if(blocks[a-1][b] == 1){
    //  start = false;
    // }
    //}
    
    for(int i=0;i<blocks.length;++i){
     if(blocks[i][0] == 1){
      start = false;
     }
    }
    return start;
  }
  
  
