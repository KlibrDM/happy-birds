public class Barricade{
  public float x;
  public float y;
  public float boomX;
  public float boomY;
  public boolean isBarricadeActive = false;
  PImage plankImage;
  PImage boomImage;
 
  Barricade(){}
  
  void setRandomPos(){
    if(Game.hits >= 10){
      this.x = random(width/2 ,(width/2 + width/4));
      this.y = random(50, height - height/4);
      
      isBarricadeActive = true;
    }
  }
  
  void drawPlank(){
    imageMode(CENTER);
    image(this.plankImage, this.x, this.y);
  }
  
  void drawBoom(){
    imageMode(CENTER);
    image(this.boomImage, this.boomX, this.boomY);
  }
}
