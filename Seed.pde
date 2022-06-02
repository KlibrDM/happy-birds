public class Seed{
  public float x;
  public float y;
  PImage seedImage;
  PImage boomImage;
 
  Seed(){}
  
  void setRandomPos(){
    this.x = random((width/2 + width/4), width-20);
    this.y = random(50, height - height/4);
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
