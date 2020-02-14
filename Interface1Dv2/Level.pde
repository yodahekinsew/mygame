import java.util.Iterator;

class Level {
  HashMap<Integer, Element> levelElements = new HashMap<Integer, Element>();
  int resetCounter = 0;
  int displaySize = 0;
  
  Level(int _displaySize) {
    levelElements.put(5, new Enemy(5, 8, 2));
    levelElements.put(10, new Spikes(10, 5));
    levelElements.put(15, new Enemy(15, 2, 5));
    levelElements.put(23, new Enemy(23, 2, 3));
    levelElements.put(25, new Enemy(28, 2, 1));
    levelElements.put(30, new Spikes(30, 6));
    levelElements.put(36, new Enemy(36, 8, 7));
    displaySize = _displaySize;
  }
  
  void update() {
    Iterator<Integer> iterator = levelElements.keySet().iterator();
    while (iterator.hasNext()) {
      Element element = levelElements.get(iterator.next());
      element.update();
    }
  }
  
  void restart() {
    if (resetCounter == 0) {
      display.setPixel(displaySize-1, color(255,255,255));
      resetCounter++;
    } else if (resetCounter == displaySize) {
      display.setPixel(displaySize-resetCounter, color(0,0,0));
      player.initialize();
      resetCounter = 0;
      Iterator<Integer> iterator = levelElements.keySet().iterator();
      while (iterator.hasNext()) {
        levelElements.get(iterator.next()).initialize();
      }
      gameState = "PLAY";
    } else {
      display.setPixel(displaySize-resetCounter, color(0,0,0));
      display.setPixel(displaySize-resetCounter-1, color(255,255,255));
      resetCounter++;
    }
  }
}
