class IceExplosion {
  float x, y;
  PImage exp1, exp2, exp3;
  int imageCounter = 0;
  boolean exploded = false;

  IceExplosion(float x, float y) {
    this.x = x;
    this.y = y;

    exp1 = loadImage("explosion1.png");
    exp1.resize(200, 200);
    exp2 = loadImage ("explosion2.png");
    exp2.resize(200, 200);
    exp3 = loadImage("explosion3.png");
    exp3.resize(200, 200);
  }

  void display() {
    if (exploded) return;
    if (imageCounter <5 ) image(exp1, x, y);
    else if (imageCounter <10) image(exp2, x, y);
    else if (imageCounter <15) image(exp3, x, y);

    imageCounter++;

    if (imageCounter>=15) {
      exploded = true;
    }
  }
}
