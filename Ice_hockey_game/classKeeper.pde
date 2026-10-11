class keeper { 
  
  // variables
  float x, y;
  PImage imagekeeper;
  
  //constructor
  keeper(float x, float y) {
    this.x=x;
    this.y=y;
    
    //using image for the keeper
    imagekeeper = loadImage("Player image.png");
    imagekeeper.resize(100, 100);
  }
  
  //method to draw object in sub class instead of main class
  void display() {
    image(imagekeeper, x, y);
  }
}
