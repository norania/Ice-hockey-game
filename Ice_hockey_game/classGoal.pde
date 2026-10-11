class Goal {
  //variables
  PImage imageGoal;
  float x, y;

  Goal(float x, float y) //contructor
  {
    this.x=x;
    this.y=y;
    imageGoal = loadImage("Goal net.png");
    imageGoal.resize(150, 150);
  }
  
  void display() { //draw object
    image(imageGoal, x, y);
  }
  
  boolean collides(Pucks p) {
    float d = dist(x, y, p.x, p.y);
    return d <60;
  }
}
