// Resources
PImage backImg = loadImage("http://i.imgur.com/cXaR0vS.png");
PImage birdImg = loadImage("http://i.imgur.com/mw0ai3K.png");
PImage wallImg = loadImage("http://i.imgur.com/4SUsUuc.png");
PImage startImg = loadImage("http://i.imgur.com/U6KEwxe.png");

// Variables
int x = -200, y, vy = 1, game_state = 1, score = 0, high_score;
int[] wx = new int[2];
int[] wy = new int[2];

void setup() {
  size(600, 800); // Canvas size
  fill(0);
  textSize(40);
}

void draw() { // Runs 60 times/second
  if(game_state == 0) {
    
    imageMode(CORNER);
    image(backImg, x, 0);
    image(backImg, x + backImg.width, 0); 
    image(birdImg, width/2, y);
    x -= 6; // Make the background move to create the illusion that the bird is moving. 
    vy += 1; // Gravity (acceleration of 1px/second^2)
    y += vy; // Move down by 1px/second
    
    for(int i = 0; i < 2; i++) {
      image(wallImg, wx[i], wy[i] - (wallImg.height/2 + 100));
      image(wallImg, wx[i], wy[i] + (wallImg.height/2 + 100));
      if(wx[i] < 0) {
        wy[i] = (int)random(200, height - 200);
        wx[i] = width;
      }
      if(wx[i] == width/2) {
        score++;
        high_score = max(score, high_score);
      }
      wx[i] -= 6;
    }
    text(""+score, width/2-15, 700);    
    
  } else {
    imageMode(CENTER); 
    image(backImg, width/2, height/2);
    text("High Score: " + high_score, 50, width);
  }
}

void mousePressed() {
  vy = -17;
  if(game_state == 1) {
    wx[0] = 600;
    wy[0] = height/2;
    wx[1] = 900;
    wy[1] = 600;
    x = 0;
    y = height/2;
    game_state = 0;
  }
}
