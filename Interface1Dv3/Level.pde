import java.util.Iterator;

class Level {
  HashMap<Integer, Ball> balls = new HashMap<Integer, Ball>();
  int resetCounter = 0;
  int displaySize = 0;
  
  int waitTime = 150;
  
  Level(int _displaySize) {
    balls.put(5, new Ball(5));
    displaySize = _displaySize;
  }
  
  void update() {
    Iterator<Integer> iterator = balls.keySet().iterator();
    while (iterator.hasNext()) {
      println("ah");
      Ball ball = balls.get(iterator.next());
      ball.update();
      if (ball.gone) iterator.remove();
    }
    
    waitTime--;
    if (waitTime == 0) {
      addNewBall();
      waitTime = 150;
    }
  }
  
  void addNewBall() {
    int newPosition = (int) random(displaySize);
    while (balls.containsKey(newPosition)) {
      newPosition = (int) random(displaySize);
    }
    balls.put(newPosition, new Ball(newPosition));
  }
  
  void restart() {
    //if (resetCounter == 0) {
    //  display.setPixel(displaySize-1, color(255,255,255));
    //  resetCounter++;
    //} else if (resetCounter == displaySize) {
    //  display.setPixel(displaySize-resetCounter, color(0,0,0));
    //  player.initialize();
    //  resetCounter = 0;
    //  Iterator<Integer> iterator = levelElements.keySet().iterator();
    //  while (iterator.hasNext()) {
    //    levelElements.get(iterator.next()).initialize();
    //  }
    //  gameState = "PLAY";
    //} else {
    //  display.setPixel(displaySize-resetCounter, color(0,0,0));
    //  display.setPixel(displaySize-resetCounter-1, color(255,255,255));
    //  resetCounter++;
    //}
  }
}
