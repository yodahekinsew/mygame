
// This is where your state machines and game logic lives


class Controller {

  Controller() {

  }


  void update() {
    // STATE MACHINE
    switch (gameState) {
        
      case "PLAY":
        display.clear();
        
        player.update();
        level.update();
        break;
        
      case "RESTART":
        level.restart();
        break;
        
      case "OVER":
        display.clear();
        break;
        
      default:
        break;
    }
    display.show();
  }
}

// All the keyboard  input goes here.
// If your game starts getting too complex, you could move the key detection events insde of the player class. 
// It's a more advanced ways of doing of the same thing. Example here: https://forum.processing.org/two/discussion/comment/34602/#Comment_34602
void k() {
  
}

void keyPressed() {
  int keyIndex = -1;

  if (key == 'A' || key == 'a') {
    player.move(-3);
  }
  if (key == 'S' || key == 's') {
    player.move(-1);
  }
  if (key == 'D' || key == 'd') {
    player.move(1);
  }
  if (key == 'F' || key == 'f') {
    player.move(3);
  }

}
