PImage backgroundImage;
PImage slingshotImage;

Bird bird = new Bird();
Seed seed = new Seed();

int livesLeftText = 0;
int resetStartTime = 0;

void setup(){
  size(1280, 720);
  
  //Set positions
  bird.setPos(80, height-height/4);
  seed.setRandomPos();
  
  //Bird Image
  bird.birdImage = loadImage("data/bird.png");
  bird.birdImage.resize(Config.birdSize, Config.birdSize);
  
  //Seed Image
  seed.seedImage = loadImage("data/seed.png");
  seed.seedImage.resize(int(Config.seedSize/1.3), Config.seedSize);
  
  //Background Image
  backgroundImage = loadImage("data/bg.jpg");
  backgroundImage.resize(width, height);
  
  //Slingshot Image
  slingshotImage = loadImage("data/slingshot.png");
  slingshotImage.resize(Config.slingshotSize, Config.slingshotSize*2);
}

void draw(){
  background(backgroundImage);
  
  //UI
  fill(0);
  textSize(24);
  livesLeftText = Game.lives > 0 ? Game.lives : 0;
  textAlign(LEFT);
  text("Lives: " + livesLeftText, 10, 30);
  text("Hits: " + Game.hits, 10, 60);
  
  if(Game.lives >= 0){
    //Draw Seed
    seed.drawSeed();
    
    //Draw Bird
    bird.drawBird();
    
    //Draw Slingshot
    image(slingshotImage, 150, height-height/5);
    
    if(bird.isShooting){
      //Move bird when shooting
      bird.shootMove();
      
      //Check for hit
      bird.checkForHit();
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
