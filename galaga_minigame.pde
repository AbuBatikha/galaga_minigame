int beginingPositionX = 0, endingPositionX = 100, beginingPositionY = 0, endingPositionY = 100, craftOffsetY = 2, craftStartX, craftPositionX, craftMovementX = 0,craftColour,randomColour;

Boolean leftAllowed = true, rightAllowed = true,newLaser = true,enemy = false,GameOver = false;

int[] laserX = {-100};

int arrayNum = 0,laserYOffset = 100, enemyPosition,strokeColour;
int points=0;
void settings () {
  size(100, 100);
}

void setup() {
  craftStartX = endingPositionX/2;
  
  randomColour = int(random(1,2));
  if(randomColour == 2){
    craftColour = 200;
  }else {
    craftColour = 255;
  }
  enemy = true;
  enemyPosition = int(random(1,8))*10;
}
  

void draw() {
if(GameOver == false){
  if (keyPressed == true) {

    if (keyCode == RIGHT) {
      if(craftPositionX + 4 < endingPositionX){
      craftMovementX += 2;
      }
    }

    if (keyCode == LEFT) {
      if(craftPositionX - 4 > beginingPositionX){
      craftMovementX -= 2;
      }
    } 
    if (keyCode == LEFT && keyCode == RIGHT) {
    }
  }

  craftPositionX = craftStartX + craftMovementX;
  noStroke();
  fill(0);
  rect(0, 0, 100, 100, 7);

  noStroke();
  fill(craftColour);
  triangle(craftPositionX, (endingPositionY - craftOffsetY - 4), craftPositionX - 4, (endingPositionY - craftOffsetY), craftPositionX + 4, (endingPositionY - craftOffsetY));
  if (frameCount % 10 == 0) {
    if(craftColour == 255){
      craftColour = 200;
    }else {
      craftColour = 255;
    }
  }
  if (enemy == false){
    enemyPosition = int(random(1,8))*10;
    enemy = true;
  }
  if(enemy == true){
    fill(craftColour);
    if(craftColour == 200){
      strokeColour = 255;
    }else {
      strokeColour = 200;
    }
    stroke(strokeColour);
    ellipse(enemyPosition,20,5,5);   
  }
  
  
  if(endingPositionY -2 - laserYOffset <= 20 && endingPositionY -2 - laserYOffset >= 10){
    if(laserX[arrayNum] > enemyPosition - 4 && laserX[arrayNum] < enemyPosition + 4){
      
        points += 10;
        enemy = false;
    }
  }  
  
  if(laserYOffset < 100){
    if(newLaser = true){
      stroke(craftColour);
      line(laserX[arrayNum],endingPositionY -2 - laserYOffset,laserX[arrayNum], endingPositionY - 6 - laserYOffset);
      laserYOffset += 8;
    }else{
      laserYOffset = 100;
    }
  }else {
    newLaser = false;
  }
  
  if (frameCount % 1000 == 0) {
    GameOver = true;
    resetGame();
  }
}else {
  textSize(14);
  text("Score", 30,endingPositionY/2 - 20);
  textSize(10);
  text(points,20,endingPositionY/2);
  ellipse(endingPositionX/2,endingPositionY/2 + 20, 10, 10);
}
}

void mouseClicked() {
  println(mouseX +" "+ mouseY);
  if(mouseX >=44 && mouseX <= 55 && mouseY >= 65 && mouseY <= 76){
    GameOver = false;
      points = 0;
  }
}

void keyReleased(){
  if(keyCode == UP){
    arrayNum+=1;
    laserX = append(laserX,craftPositionX); 
    println(laserX[arrayNum]);
    newLaser = true;
    laserYOffset = 0;
  }
}

public void resetGame(){
  laserYOffset = 100;

}
