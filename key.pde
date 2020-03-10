void keyPressed() {            //ボタン押したときの変化設定
  if (key=='s') {
    score = 0;
    screen=1;
    song.close();
    song = minim.loadFile("bgm1.mp3");
    song.play();
    song.loop();
    vep=0;
    for(int i = 0;i<15;i++){
      hit[i]=5;
    
    if(i==7){
      hit[i]=10;
    }
    }
  }
  if ((key=='r')&&(ballFall == 0)) {
    screen=1;
    ballFall = 3;
    countB = 0;
    score=0;
    for (int i = 0; i<15; i++) {
      hit[i] =5;
    }
    hit[7]=10;
    song.play();
  }
  if (keyCode==RIGHT) {
    right=true;
    pointer = pointer + 10;
  }
  if (keyCode==LEFT) {
    left = true;
    pointer = pointer - 10;
  }
  if (key=='a') {
    a=true;
  }
  if(key=='t'){
    t=true;
  }
}

void keyReleased() {
  if (keyCode==RIGHT) {
    right=false;
  }
  if (keyCode==LEFT) {
    left = false;
  }

  if (key=='a') {
    a=false;           //必殺技
  }
 if(key =='t'){
   t=false;
 }
}
