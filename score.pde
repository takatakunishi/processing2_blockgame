void score(){
  if(highscore<=score){
    highscore = score;
  }
  fill(255,150,0);
  textSize(20);
  text("最高得点"+highscore,0,height);
  text("得点"+score,0,height-30);
  
}
