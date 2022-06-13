public class Barricade{
  public float x;
  public float y;
  PImage plankImage;
 
  Barricade(){}
  
  void setRandomPos(){
    this.x = random(width/2 ,(width/2 + width/4));
    this.y = random(50, height - height/4);
  }
  
  void drawPlank(){
    imageMode(CENTER);
    image(this.plankImage, this.x, this.y);
  }
}
