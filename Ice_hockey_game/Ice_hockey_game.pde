//global variables
PImage background_img; //setting background
int bgX=0;

keeper K1; //keeper (player)
Goal goal1; // goal
ArrayList<Enemy> enemies; //polymorphism
ArrayList<IceExplosion> explosions;

boolean gameOver= false;//it won't end unless it's changed to true in a collision function
int score = 0;

void setup() { //code runs once at start
  size(700, 500); // setting size for the game
  imageMode(CENTER);
  background_img = loadImage ("icehockeyfloorimp.jpg"); //importing background image
  background_img.resize (width, height);
  background(background_img);


  K1 = new keeper(350, 250);
  goal1 = new Goal(600, 250);

  enemies = new ArrayList<Enemy>();
  explosions = new ArrayList<IceExplosion>();
  
  
  for (int i=0; i<14; i++) {//black pucks
    enemies.add(
      new Pucks (0, random(50, height-50), 1, i*150));
  }

  for (int j=0; j<5; j++) {//red pucks
    enemies.add(
      new RedPuck( 0, random(50, height-50), 3, 600 + j*220));
  }
}

void draw() { // display objects and repeated 60 times per second
  background(background_img);

  fill(255,0, 0); //display score
  textSize(20);
  text("Score " + score, 20, 30);
  
  
  if (gameOver) { //drawing GAME OVER screen
    background(0);
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER!!!", width/2, height/2);
    return; // stops draw function, the game
  }



  K1.display();

  //pucks loop
  float goalX = goal1.x;
  float goalY = goal1.y;
  
  for (int i=0; i<enemies.size(); i++) { //one loop for both enemies for polymorphism
    Enemy en = enemies.get(i);
    en.move(goalX, goalY);
    en.display();

    if (en instanceof Pucks) { //black pucks collisions
      Pucks p = (Pucks) en;

      if (p.visible && !p.reachGoal && goal1.collides(p)) {
        p.reachGoal = true;
        p.visible = false;
        p.speed = 0;
        score = score - 5;
      }
    }

    if (en instanceof RedPuck) { //redpucks collisions
      RedPuck RP = (RedPuck) en;

      if (RP.visible && RP.collidedWithKeeper(K1)) {
        gameOver = true;
      }
    }
  }

  goal1.display();

  for (int i= explosions.size() - 1; i >=0; i--) { //explosion with pucks collision
    explosions.get(i).display();
    if (explosions.get(i).exploded) {
      explosions.remove(i);
    }
  }
}

void mouseMoved() //keeper moves wherever the mouse moves, so it's with the mouse
{
  K1.x = mouseX;
  K1.y = mouseY;
}

void mouseClicked() //when mouse clicks and keeper touches pucks they disappear, the pucks
{
  for (int i = 0; i < enemies.size(); i++) {
    Enemy en = enemies.get(i);

    if (en instanceof Pucks) {
      Pucks p = (Pucks) en;

      if (p.visible && p.flickedByKeeper(K1)) {
        p.visible = false;
        explosions.add(new IceExplosion(p.x, p.y));//after pucks get hit explosion happens in puck position
        score = score + 5;
        break; //one puck only
      }
    }
  }
}
