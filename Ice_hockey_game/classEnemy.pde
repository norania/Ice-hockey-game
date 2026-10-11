abstract class Enemy { //superclass

  //same variables tha both enemies class have
  float x, y, speed;
  int delay;
  boolean visible = true;
  
  //same constructors
  Enemy (float x, float y, float speed, int delay) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.delay = delay;
  }
  
  //the two important methods in both subclasses
  abstract void move(float goalX, float goalY);
  abstract void display();
}
