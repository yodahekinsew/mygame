
import processing.serial.*;


Serial myPort;                       // The serial port
int[] serialInArray = new int[4];    // Where we'll put what we receive
int serialCount = 0;                 // A count of how many bytes we receive
boolean firstContact = false;        // Whether we've heard from the microcontroller

int joyX, joyY, button, rotary;              // Variables for storing incoming sensor data
boolean joyXRight = false;
boolean joyXLeft = false;


void startSerial() {
  
  // Print a list of the serial ports for debugging purposes
  printArray(Serial.list());
  
  // Open whatever port is the one you're using.
  int portNumber = 1;
  String portName = Serial.list()[portNumber];
  myPort = new Serial(this, portName, 57600);
  
}


// This gets called whenever the serial port gets new data
void serialEvent(Serial myPort) {
  
  int inByte = myPort.read();        // read a byte from the serial port...
  // if this is the first byte received, and it's an A, clear the serial
  // buffer and note that you've had first contact from the microcontroller.
  // Otherwise, add the incoming byte to the array of sensor values
  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    }
    
  // this piece of code captures the sensor data coming in  
  } else {
    
    serialInArray[serialCount] = inByte;    // Add the latest byte from the serial port to array
    serialCount++;                          // Increment count of how many data we've already received
   
    if (serialCount > 3 ) {           // If we have 3 bytes, that means we got everything and we are ready to act on it.
    
      joyX = serialInArray[0];
      joyY = serialInArray[1];
      button = serialInArray[2];   
      rotary = serialInArray[3];
   
      // Output to Processing console so we can see what incoming data looks like
      //println(joyX + "\t" + joyY + "\t" + button + "\t" + rotary);
      
      executeJoystickInput(joyX, joyY, button, rotary);
   
      myPort.write('A');        // Send a capital A to request new sensor readings
      serialCount = 0;          // Reset serialCount, so we can get a new stream
    }
  }
}  
    
void executeJoystickInput(int _joyX, int _joyY, int _button, int _rotary) {
  //if (rotary == 1) player.move(3);
  //if (rotary == 255) player.move(-3);
  if (rotary == 1) {
    player.move(2);
  } else if (rotary == 255) {
    player.move(-2);
  }
  
    //Check if joystick has moved to the right
   if((_joyX > 150) && (joyXRight == false)) {
     player.move(1);                        // move player
     joyXRight = true;                         // don't let player move again until joystick has gone back to center
     
   } else if(_joyX < 130) {                    // has joystick gone back to center?
     joyXRight = false;                        // now free up player to move again
   }
   
   
   // Check if joystick has moved to the left
    if((_joyX < 80) && (joyXLeft == false)) {
     player.move(-1);                        // move player
     joyXLeft = true;                           // don't let player move again until joystick has gone back to center
     
   } else if(_joyX > 120) {                    // has joystick gone back to center?
     joyXLeft = false;                         // now free up player to move again
   }
   
   
   //if(_button == 255) {
   //  if (gameState != "PLAY") {
   //    gameState = "PLAY";                      // if button has been pressed, go back to PLAY state. (only works in SCORE state)
   //  }
   //}
}
    
    
