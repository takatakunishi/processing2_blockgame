void gameTitle() {
  String t[] = {"操作方法", "バー移動方法", "左右十字キー", "特殊ビーム　Aボタン 右下のゲージが溜まったとき"};
  textSize(20);
  colorMode(RGB, 255);
 
  background(255); 
  fill(255, 0, 0);
  text("Are you ready?", 150, 200);
  text("Type s", 150, 230);
  colorMode(HSB, 100, 100, 100);
  for (int i=0; i<4; i++) {
    fill(i*10, 100, 100);
    text(t[i], 100, 400+i*20);
  }
  colorMode(RGB, 255);
}

void gameClear(){
  
  fill(255,0,0);
  textSize(40);
  text("GAME CLEAR",100,300);
}

void gameclear(){
  song.close();
  image(clegame,0,0);
  if (t){
    screen=0;
  }
  fill(255,0,0);
  textSize(30);
  text("please push t buttun",150,550);
}
  

void gameOver() {
  song.pause();
  background(0);
  fill(200, 150, 30);
  if (frameCount%5==0) {
    endfont++;
  }
  textSize(20+endfont/2);
  text("Do you want to try again?", 0, 300);
  text("Please type r", 0, 400);
  textSize(20);
  text("please push r", 300, 500);
  text("今回の得点"+score,100,350);
}
