PImage backgroundImage;
PImage slingshotImage;
PFont textFont;

Bird bird = new Bird();
Seed seed = new Seed();

int livesLeftText = 0;
int resetStartTime = 0;

void setup(){
  size(1280, 720);
  
  //Set positions
  bird.setPos(80, height-height/4);
  seed.setRandomPos();
  
  loadData();
}

void draw(){
  background(backgroundImage);
  
  //UI
  fill(20);
  textFont(textFont);
  textSize(24);
  livesLeftText = Game.lives > 0 ? Game.lives : 0;
  textAlign(LEFT);
  text("Lives: " + livesLeftText, 10, 30);
  text("Hits: " + Game.hits, 10, 60);
  
  if(Game.lives >= 0){
    //Draw Seed
    if(!bird.targetHit){
      seed.drawSeed();
    }
    
    //Draw shooting line (behind bird)
    if(Game.isPlayerAiming){
      drawShootingCircle();
      bird.drawShootingLine();
    }
    
    //Draw Bird
    bird.drawBird();
    
    //Draw Slingshot
    image(slingshotImage, 150, height-height/5);
    
    if(bird.isShooting){
      //Move bird when shooting
      bird.shootMove();
      
      //Check for hit
      bird.checkForHit();
      
      if(bird.targetHit){
        seed.drawBoom();
      }
    }
  }
  else{
    //Game over screen
    fill(255);
    textSize(72);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2);
    textSize(42);
    text("Resetting...", width/2, height/2+60);
    //Reset after 5 seconds
    if(millis() > resetStartTime + 5000){
      Game.reset();
    }
  }
}
