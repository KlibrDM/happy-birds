void loadData(){
  //Load Font
  textFont = createFont("data/Hujan.ttf", 128);
  
  //Bird Image
  bird.birdImage = loadImage("data/bird.png");
  bird.birdImage.resize(Config.birdSize, Config.birdSize);
  
  //Seed Image
  seed.seedImage = loadImage("data/seed.png");
  seed.seedImage.resize(int(Config.seedSize/1.3), Config.seedSize);
  
  //Boom Image
  seed.boomImage = loadImage("data/boom.png");
  seed.boomImage.resize(Config.boomSize, Config.boomSize);
  
  //Background Image
  backgroundImage = loadImage("data/bg.jpg");
  backgroundImage.resize(width, height);
  
  //Slingshot Image
  slingshotImage = loadImage("data/slingshot.png");
  slingshotImage.resize(Config.slingshotSize, Config.slingshotSize*2);
  
  //Plank Image
  plank.plankImage = loadImage("data/plank.png");
  plank.plankImage.resize(Config.plankSize, Config.plankSize*3);
  
  //Boom Image
  plank.boomImage = loadImage("data/plankBoom.png");
  plank.boomImage.resize(Config.boomSize, Config.boomSize);
}
