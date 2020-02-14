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
  
  int getSpeed() {
    if (speed + timeChange > 10) {
      if (10-(speed+timeChange-10) < 1) return -1*(10-(speed+timeChange-10));
      return 10-(speed+timeChange-10);
    }
    return speed + timeChange;
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
        waitTime = (int)(appFramerate/getSpeed());
      } else waitTime--;
      if (position >= displaySize) position = displaySize - 1;
      display.setPixel(position, color(255,0,0));
    }
  }
  
  void initialize() {
    movement = 0;
    waitTime = (int)(appFramerate/getSpeed());
    direction = 1;
    position = originPosition;
  }
}
