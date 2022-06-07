float lastX, lastY;
float distX = 0.0, distY = 0.0;

void drawShootingCircle(){
  strokeWeight(1);
  fill(120,120,120,100);
  circle(lastX,lastY, 30);
}

void mousePressed(){
  if(!Game.controlsLocked){
    lastX = mouseX;
    lastY = mouseY;
    Game.isPlayerAiming = true;
  }
}

void mouseDragged(){
  if(!Game.controlsLocked){
    distX = (mouseX - lastX)/200;
    distY = (lastY - mouseY)/200;
    bird.moveSlingPos(distX, distY);
    Game.isPlayerAiming = true;
  }
}
void mouseReleased(){
  if(!Game.controlsLocked){
    distX = distY = 0.0;
    bird.shoot();
    Game.isPlayerAiming = false;
  }
}
