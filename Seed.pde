public class Seed{
  public float x;
  public float y;
  public float startX;
  public float startY;
  public float endX;
  public float endY;
  public boolean startReached = true;
  public boolean endReached = false;
  public boolean isSeedMoving = false;
  PImage seedImage;
  PImage boomImage;
 
  Seed(){}
  
  void setRandomPos(){
    this.x = random((width/2 + width/4), width-20);
    this.y = random(50, height - height/4);
    
    //Move the seed if the player has more than 5 hits
    if(Game.hits >= 5){
      isSeedMoving = true;
      this.startX = this.x;
      this.startY = this.y;
      this.endX = random((width/2 + width/4), width-20);
      this.endY = random(50, height - height/4);
    }
  }
  
  void moveSeed(){
    if(this.startReached){
      this.x -= (this.startX - this.endX)/60;
      this.y -= (this.startY - this.endY)/60;
      
      //Check for reaching end on X axis
      //Both axises reach their destination at the same time
      //Therefore, it's enough to check just one
      if(this.endX < this.startX && x <= this.endX){
        this.startReached = false;
        this.endReached = true;
      }
      if(this.endX > this.startX && x >= this.endX){
        this.startReached = false;
        this.endReached = true;
      }
    }
    
    //Once end is reached, go back to start
    if(endReached){
      this.x += (this.startX - this.endX)/60;
      this.y += (this.startY - this.endY)/60;
      
      //Check for reaching start
      if(this.startX < this.endX && x <= this.startX){
        this.endReached = false;
        this.startReached = true;
      }
      if(this.startX > this.endX && x >= this.startX){
        this.endReached = false;
        this.startReached = true;
      }
    }
  }
  
  void drawSeed(){
    imageMode(CENTER);
    image(this.seedImage, this.x, this.y);
  }
  
  void drawBoom(){
    imageMode(CENTER);
    image(this.boomImage, this.x, this.y);
  }
}
