class Pucks extends Enemy { //inherit from superclass Enemy

  //variables
  PImage image1, image2, image3, image4; //store image files in the variables
  int imageCounter = 0;
  float aimY;
  boolean reachGoal = false;

  Pucks(float x, float y, float speed, int delay) { //contructor
    super(x, y, speed, delay); //inherits from Enemey
    image1 = loadImage("pucktopright.png");//adding images for animation
    image1.resize(50, 30);
    image2= loadImage("puckbottomright.png");
    image2.resize(50, 30);
    image3= loadImage("puckbottomleft.png");
    image3.resize(50, 30);
    image4= loadImage("pucktopleft.png");
    image4.resize(50, 30);

    imageMode(CENTER); //draw images from centre position

    aimY = random (200, 300);
  }

  void move(float goalX, float goalY) { //aim towards goal
    if (!visible) return;
    if (frameCount < delay) return; //for delaying each puck from each other so they come seperately and later on
    if (x < goalX) x=x+speed;
    if (x > goalX) x = x - speed;
    if (y < aimY) y = y+ speed;
    if (y > aimY) y = y - speed;
  }

  void display() {
    if (!visible) return;
    if ( frameCount < delay) return;

    if (imageCounter <10) {
      image(image1, x, y);
    } //displays image at variable x and y
    else if ( imageCounter < 20) {
      image(image2, x, y);
    } else if (imageCounter < 30) {
      image(image3, x, y);
    } else if ( imageCounter < 40) {
      image(image4, x, y);
    }

    imageCounter++;

    if (imageCounter >= 40) {
      imageCounter = 0; //reset counter
    }
  }

  boolean flickedByKeeper( keeper k) { //boolean collision for when collided with keeper
    float d = dist(x, y, k.x, k.y);
    return d<20;
  }
}
