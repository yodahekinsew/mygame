class Spikes implements Element {
  int position;
  int originPosition;
  int size;
  int waitToStart = 30;
  int waitToEnd = 10;
  double colorFactor = 0.2;
  
  Spikes(int _position, int _size) {
    position = _position;
    originPosition = _position;
    size = _size;
  }
  
  void update() {
    int colorValue = (int) (colorFactor*255);
    if (player.position >= position && player.position <= position+2 && colorFactor >= 1.0) {
      player.die();
    } else {
      for (int i = 0; i < size; i++) {
        display.setPixel(position + i, color(colorValue,colorValue,0));
      }
      if (waitToStart == 0) {
        if (colorFactor >= 1.0) {
          if (waitToEnd == 0) {
            waitToStart = 30;
            waitToEnd = 10;
            colorFactor = 0.2;
          } else waitToEnd--;
        }
        colorFactor += .01;
      } else waitToStart--;
    }
  }
  
  void initialize() {
    waitToStart = 30;
    waitToEnd = 10;
    colorFactor = .2;
    position = originPosition;
  }
}
