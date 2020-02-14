class Ball {
  int position;
  double opacity = 0;
  double direction = 1;
  
  boolean waiting = false;
  int waitTime = 15;
  
  boolean hitBack = false;
  
  boolean gone = false;
  
  Ball(int _position) {
    position = _position;
  }
  
  void update() {
    if (waiting) {
      if (position >= player.position && position < player.position + player.size) hitBack = true;
      waitTime--;
      if (waitTime == 0) {
        waiting = false;
        waitTime = 15;
        if (!hitBack) println("Lost");
      }
    } else {
      opacity += direction;
      if (direction > 0 || direction < 0 && hitBack) direction += .01;
      if (direction < 0 && !hitBack) direction -= .25;
      if (opacity < 0) {
        if (!hitBack) {
          gameState = "OVER";
        }
        gone = true;
        return;
        //direction = 1;
        //hitBack = false;
      }
      if (opacity >= 100) {
        direction *= -1;
        waiting = true;  
      }
    }
    if (position >= player.position && position < player.position + player.size) {
      display.setPixel(position, color(255,(int)((double)(100-opacity)/100*255),(int)((double)(100-opacity)/100*255)));
    } else display.setPixel(position, color((int)((double)opacity/100*255),0,0)); 
  }
  
  
}
