// This holds some player information, like color and position.
// It also has some player methods for managing how a player moves.


class Player {

  color playerColor = color(255,255,255);
  int position = 0;
  int originPosition = 0;
  int movementEffect = 0;
  int score;

  Player() {
    
  }
  
  void update() {
    if (movementEffect > 0) {
      for (int i = 0; i < movementEffect; i++) {
        display.setPixel(player.position-i-1, color(200,200,200));
      }
      movementEffect--;
    }
    if (movementEffect < 0) {
      println(movementEffect);
      for (int i = -1; i > movementEffect; i--) {
        display.setPixel(player.position-i, color(200,200,200));
      }
      movementEffect++;
    }
    display.setPixel(player.position, player.playerColor);
  }

  // Move player based on keyboard input
  void move(int _direction) {
    movementEffect = _direction;
    println(movementEffect);
    position = position + _direction;
    if (position <= 0) {
      position = 0;
    } else if (position >= displaySize-1) {
      gameState = "RESTART";
      position = displaySize-1;
    }
  }
  
  void initialize() {
    position = 0;
    score = 0;
    movementEffect = 0;
  }
  
  void die() {
    gameState = "RESTART";
  }
}
