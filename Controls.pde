int lastX, lastY;
float distX = 0.0, distY = 0.0;

void mousePressed(){
  if(!Game.controlsLocked){
    lastX = mouseX;
    lastY = mouseY;
    Game.isPlayerAiming = true;
  }
}

void mouseDragged(){
  if(!Game.controlsLocked){
    distX = radians(mouseX - lastX)/20;
    distY = radians(lastY - mouseY)/20;
    bird.moveSlingPos(distX, distY);
  }
}
void mouseReleased(){
  if(!Game.controlsLocked){
    distX = distY = 0.0;
    bird.shoot();
    Game.isPlayerAiming = false;
  }
}
