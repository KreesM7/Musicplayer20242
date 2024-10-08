import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 8; //Able to Autodetect based on Pathway
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
//
int appWidth, appHeight;
float musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight;
//
void setup()
{
  size(900, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonWidth = appWidth*1/2;
  musicButtonHeight = appHeight*1/2;
  musicButtonX = musicButtonWidth - musicButtonWidth*1/2;
  musicButtonY = musicButtonHeight - musicButtonHeight*1/2;
  if ( musicButtonWidth >= musicButtonHeight ) { //error: square does not go in the middle
    // musicButtonWidth needs to change
    musicButtonWidth = musicButtonHeight;
  } else {
    // musicButtonHeight needs to change
    musicButtonHeight = musicButtonWidth;
  }
  //Use if statement to change, introduce ternary operator
  //
  float padding = 1/4;
  float stopButtonSize = 1-(1/4);
  stopWidth = musicButtonWidth*3/4;  //StopButtonSize;
  stopHeight = musicButtonHeight*3/4; //StopButtonSize;
  stopX = musicButtonX;
  stopY = musicButtonY;
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
  //
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
  //Alphebetical order, same as OS ordering files
  String ghostWalk = "Ghost_Walk";
  String groove = "groove";
  String MYEYES = "MYEYES";
  //
  //Add Reading into Array
  String directory = "../../../" + musicPathway;
  String file = directory + groove + mp3FileName;
  song[currentSong] = minim.loadFile( file );
  file = directory + ghostWalk + mp3FileName;
  file = directory + MYEYES + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  //
  currentSong = 0;
  //
  song[currentSong].play();
  //Use play(timeStart) & loop(numberOfLoops)
  //Purpose is 2D Shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y, Width, Height );
  rect( musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight );
} //End setup
//
void draw() {
  background(0); // Gray Scale: 0-255
  rect( musicButtonX, musicButtonY, musicButtonWidth, musicButtonHeight );
  //fill();
   rect( stopX, stopY, stopWidth, stopHeight );
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
// End Main Program
