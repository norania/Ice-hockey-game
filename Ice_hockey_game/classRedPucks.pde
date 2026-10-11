class RedPuck extends Enemy { //inherits from super class Enemy, variables, void methods, and constructor

  RedPuck(float x, float y, float speed, int delay) { //constructor
    super(x, y, speed, delay); //iherits from class Enemy
  }

  void display() { //creating the object
    if ( frameCount < delay) return;
    fill(255, 0, 0);
    ellipse(x, y, 20, 20);
    if (!visible) return;
  }

  void appears() { //to make it appear mid game
    visible = true;
  }

  void move(float goalX, float goalY) { //in what direction and how it should move
    if (frameCount < delay) return;
    if (!visible) return;
    x = x  + speed;
  }

  boolean collidedWithKeeper(keeper k) { //boolean collision with keeper so it ends game
    float d = dist(x, y, k.x, k.y);
    return d < 20;
  }
}
