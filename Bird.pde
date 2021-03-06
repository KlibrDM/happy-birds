public class Bird{
  public float x;
  public float y;
  public float anchorX;
  public float anchorY;
  public float forceX = 0;
  public float forceY = 0;
  public boolean isShooting = false;
  public boolean targetHit = false;
  public boolean barricadeHit = false;
  PImage birdImage;
  
  Bird(){}
  
  public void setPos(float x, float y){
    this.x = x;
    this.y = y;
    this.anchorX = x;
    this.anchorY = y;
  }
  
  public void resetPos(){
    this.x = this.anchorX;
    this.y = this.anchorY;
  }
  
  public void moveSlingPos(float x, float y){
    if(this.x < (this.anchorX - 50) && x < 0 || this.x >= this.anchorX && x > 0){
      //Block
    }
    else{
      this.x += x;
    }
    if(this.y > (this.anchorY + 50) && y < 0 || this.y <= this.anchorY && y > 0){
      //Block
    }
    else{
      this.y -= y;
    }
  }
  
  public void shootMove(){
    this.x += forceX;
    this.y -= forceY + Config.gravity;
    if(forceX > 0){
      this.forceX -= 1 - 10/this.forceX;
    }
    else{
      forceX = 0;
    }
    this.forceY -= 1;
    
    //If shoot ends (goes outside of the screen)
    if(this.x > width + Config.birdSize + 800 || this.y > height + Config.birdSize + 800){
      if(this.targetHit){
        Game.lives += 4;
        Game.hits++;
        seed.setRandomPos();
        plank.setRandomPos();
      }
      this.isShooting = false;
      this.targetHit = false;
      this.barricadeHit = false;
      Game.controlsLocked = false;
      Game.lives--;
      this.resetPos();
      if(Game.lives < 0){
        //If game is lost, save time for reset
        Game.controlsLocked = true;
        resetStartTime = millis();
      }
    }
  }
  
  public void checkForHit(){
    //If bird is in range of seed hitpoint
    if(this.x > seed.x - Config.seedHitpoint 
    && this.x < seed.x + Config.seedHitpoint
    && this.y > seed.y - Config.seedHitpoint
    && this.y < seed.y + Config.seedHitpoint){
      this.targetHit = true;
    }
  }
  
  public void checkForBarricadeHit(){
    if(plank.isBarricadeActive){
      if(this.x + this.forceX > plank.x - Config.plankSize
      && this.x + this.forceX < plank.x + Config.plankSize
      && this.y > plank.y - Config.plankSize * 2
      && this.y < plank.y + Config.plankSize * 2){
        //Force move the bird next to the plank
        if(this.x < plank.x){
          this.x = plank.x - Config.plankSize;
        }
        
        //Stop bird X axis movement
        this.forceX = 0;
        
        //Slow down Y movement
        if(this.forceY > 10){
          this.forceY /= 2;
        }
        
        //Set boom position (only once)
        if(!this.barricadeHit){
          plank.boomX = this.x + Config.plankSize / 3;
          plank.boomY = this.y;
        }
        
        this.barricadeHit = true;
      }
    }
  }
  
  public void shoot(){
    this.forceX = (this.anchorX - this.x)*1.2;
    this.forceY = (this.y - this.anchorY)/1.8;
    this.isShooting = true;
    Game.controlsLocked = true;
  }
  
  public void drawShootingLine(){
    stroke(255);
    strokeWeight(4);
    float lineEndX = this.anchorX+(this.anchorX-this.x)*2.5;
    float lineEndY = this.anchorY+(this.anchorY-this.y)*2.5;
    line(this.x, this.y, lineEndX, lineEndY);
  }
  
  public void drawBird(){
    imageMode(CENTER);
    image(this.birdImage, this.x, this.y);
  }
}
