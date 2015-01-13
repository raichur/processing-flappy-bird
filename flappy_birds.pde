// Resources
PImage backImg = loadImage("http://i.imgur.com/cXaR0vS.png");
PImage birdImg = loadImage("http://i.imgur.com/mv0ai3K.png");
PImage wallImg = loadImage("http://i.imgur.com/4SUsUuc.png");
PImage startImg = loadImage("http://i.imgur.com/U6KEwxe.png");

// Variables
int gamestate = 0;
int x = -200, y, vy = 1;

void setup() {
  size(600, 800); // Canvas size
}

void draw() { // Runs 60 times/second
  if(gamestate == 0) {
    imageMode(CORNER);
    image(backImg, x, 0);
    image(backImg, x + backImg.width, 0); 
    image(birdImg, width/2, y);
    x -= 6; // Make the background move to create the illusion that the bird is moving. 
    vy += 1; // Gravity (acceleration of 1px/second^2)
    y += vy; // Move down by 1px/second
  } else {
    imageMode(CENTER); 
    image(backImg, width/2, height/2);
  }
}
