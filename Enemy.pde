class Enemy implements Element {
  int position;
  int originPosition;
  int movement = 0;
  int range;
  int waitTime;
  int speed;
  int direction = 1;
  
  Enemy(int _position, int _speed, int _range) {
    position = _position;
    originPosition = _position;
    waitTime = (int)(appFramerate/_speed);
    speed = _speed;
    range = _range;
  }
  
  void update() {
    if (player.position == position) {
      player.die();
    } else {
      if (waitTime == 0) {
        position += direction;
        movement += direction;
        if (movement == range) direction = -1;
        if (movement == 0) direction = 1;
        waitTime = (int)(appFramerate/speed);
      } else waitTime--;
      if (position >= displaySize) position = displaySize - 1;
      display.setPixel(position, color(255,0,0));
    }
  }
  
  void initialize() {
    movement = 0;
    waitTime = (int)(appFramerate/speed);
    direction = 1;
    position = originPosition;
  }
}
