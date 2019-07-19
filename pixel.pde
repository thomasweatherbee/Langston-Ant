class pixel{
  int status = 0;
  int xCoord, yCoord;
  pixel(int x, int y){
    xCoord = x;
    yCoord = y;
  }
  
  void changeStatus(int x){
    status = x;
  }
  
  void show(){
    fill(255 - ((250/instructions.length)*status));
    noStroke();
    rect(xCoord*pixelSize, yCoord*pixelSize, pixelSize, pixelSize);
  }
}
