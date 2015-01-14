// Resources
PImage backImg;
PImage birdImg;
PImage wallImg;
PImage startImg;

// Variables
int x = -200, y, vy = 1, game_state = 1, score = 0, high_score;
int[] wx = new int[2];
int[] wy = new int[2];

void setup() {
  size(600, 800); // Canvas size
  backImg = loadImage("bg.png");
  birdImg = loadImage("bird.png");
  wallImg = loadImage("wall.png");
  startImg = loadImage("splash.png");
  fill(0);
  textSize(40);
}

void draw() { // Runs 60 times/second
  if(game_state == 0) {
    
    imageMode(CORNER);
    image(backImg, x, 0);
    image(backImg, x + backImg.width, 0); 
    x -= 6; // Make the background move to create the illusion that the bird is moving. 
    vy += 1; // Gravity (acceleration of 1px/second^2)
    y += vy; // Move down by 1px/second
    if(x == -1000) x = 0;
    for(int i = 0; i < 2; i++) {
      imageMode(CENTER);
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
      if(y > height || y < 0 || (abs(width/2 - wx[i]) < 25 && abs(y - wy[i]) > 199)) {
        game_state = 1;
      }
      wx[i] -= 6;
    }
    image(birdImg, width/2, y);
    text(""+score, width/2-15, 700);    
    
  } else {
    imageMode(CENTER); 
    image(startImg, width/2, height/2);
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
