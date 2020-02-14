
/* /////////////////////////////////////

  4.043 / 4.044 Design Studio: Advanced Interactions
  February  5, 2020
  Marcelo Coelho

  Note:
  - Don't forget to install gif library provided

*/ /////////////////////////////////////

//import gifAnimation.*;                      // library for playing animated gifs
//import http.requests.*;

final static int displaySize = 50;          // how many pixels are visible in the game
final static int displayPixelSize = 30;     // how big should they look on screen

final static int WAIT_TIME = 25;
final static int ENEMY_SPEED = 1;

int timeChange = 0;

int currentFrame = 0;
int appFramerate = 60;
int numFrames =  60;

DisplayBuffer display = new DisplayBuffer(displaySize);    // aggregates our final visual output

Player player = new Player();

Level level = new Level(displaySize);

//Player playerOne = new Player(color(255,0,255), displaySize, 0);             // Adding 2 players to the game
//Player playerTwo = new Player(color(0,255,0), displaySize, displaySize-1);

//Target target = new Target(color(255,255,0), displaySize, int(displaySize/2));              // and one target for players to catch.

Controller controller = new Controller();   // this is where the state machine and software logic lives
String gameState = "PLAY";

PImage[] animation;

color getColor(String colorStr, double factor) {
  switch(colorStr) {
    case "BLUE":
      return color(0,0,(int)(factor*255));
    case "GREEN":
      return color(0,(int)(factor*255),0);
    case "RED":
      return color((int)(factor*255),0,0);
  }
  return 0;
}

void settings() {
  
  size((displaySize*displayPixelSize), displayPixelSize);    // dynamically sets canvas size

}


void setup() {
    
  frameRate(appFramerate);     //  important to lock the framerate, so animations are smooth
  
  //animation = Gif.getPImages(this, "Animation.gif");
  startSerial();
  
  //GetRequest get = new GetRequest("http://httprocessing.heroku.com");
  //get.send();
  //println("Reponse Content: " + get.getContent());
  //println("Reponse Content-Length Header: " + get.getHeader("Content-Length"));
   
}


void draw() { 

   // Not used, but you might find helpful to count frames for animations or synchronization
   //currentFrame = (currentFrame+1) % numFrames; 
   //println(currentFrame);
  
    // Runs state machine at determined framerate
  	controller.update();
}
