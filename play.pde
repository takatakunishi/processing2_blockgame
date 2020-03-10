void gamePlay() {                                  //ゲーム開始
  
  if (song.position()>= 313000) {
    song.rewind();
    song.play();
  }
  image (backimg, 0, 0, width, height);
  
  score();

  for (int i=0; i<3; i++) {         // ジャマーの発生   

    fill(255, 0, 255);            
    rect(jx[i], jy[i], 50, 13); 
    image(jamimg, jx[i], jy[i], 50, 13);
    switchcheck(checkJammer(i));
    if (jx[i] < 0) {                           //jammaerの画面端での動き
      djx[i] = 2;
    } else if (jx[i] >= width-50) {
      djx[i] = -djx[i];
    }
    jx[i] = jx[i] + djx[i];
    jy[i] = i * 100 + 200;
  }                                      //ここまでがjammerの設定

  fill(0, 0, 255);                //弾の設定　　　　　
  rect(x, y, a_w, a_h, 100);    
  noFill();                        //目隠し
  rect(0, 80, width, 100);
  x = x + dx;             // ボールの変位の設定
  y = y + dy;

  if (x + a_w >= width) {    //ボールの壁での跳ね返りの設定
    dx = -1;
  } else if (x < 0) {
    dx = 1;
  }

  if (y + a_h > height) {     //ボールの上下端での動作設定
    x = 0;
    y = 100;
    dx = 1;
    dy = 2;
    count = 0;
    ballFall -= 1; 
    deathBar = pointer;
    deathBallx = x;
    deathBally = y;
  } else if (y < 0) {
    dy = 2;
  }                            //ここまでがボールの設定


  fill(255);                    //ボムの設定
  rect(480, 600, 100, 8);

   if(countB >=1) {           
    fill(0, 155, 155);
    rect(480, 600, countB*10, 8);
   }

    if((countB == 10)&&(a)){  
      countT = 300;
      countB = 0;
      bom = mouseX + 25 ;                   //必殺技使用時
      
    }

    if(countT >0){
      countT=countT -1;
      if(countT/20==0){
      image(bom2,bom-30,-150);
      }else if(countT/20==1){
      image(bom1,bom-30,-150);
      }else{
      image(bom0,bom-30,-150);
      }
      
    }else{
      bom=-100;
    }
      


  for (int i = 0; i < hit.length; i++) {                  //ブロックの耐久地を減らす

    if ((hit[i]>0)&&(bom >= b_w*i)&&(bom <= b_w *(i+1))){     //必殺技の時のブロックの耐久地の設定
      hit[i]=-30;
      score = score + 100;
      //bom = -30;
    }

    if (hit[i]>0) {  //耐久地による変化、配列による制御

      fill(255);
      show_block(i);
      switchcheck2(checkHitBlock(i, x, y), i);
    }
    
  if((hit[i]<=0)&&(flagvep[i]==1)){
    flagvep[i]=0;
    vep+=1;
  }
    
  }

  for (int i=0; ballFall-i>0; i++) {
    image(lifimg, 400+20*i, height-20, 20, 20);
  }

  fill(255, 0, 0);
  rect(pointer, 550, r_w, 3);   //バーを描く設定
  image(myimg, mouseX, 550, r_w, r_w);               //自機を描く
  

  textSize(10);
  text(count, 10, height);        //続いた回数を描く設定

  if (checkHit(x, y)) {  //もし当たったらカウントアップ
    dy = -2;
    count = count + 1;
    if (countB<=9) {
      countB = countB + 1;
    }
  }



  if (ballFall == 0) {            //ゲームに失敗したときの設定
    x = deathBallx;
    y = deathBally;
    pointer = deathBar;              //
    screen = 2;                      //リトライ画面へ
    endfont =0;                      //リトライ画面で文字を大きくする関数を初期化
  }
     if(((frameCount%10)==0)&&(mousePressed)){
     danmaku.add(new Tama(mouseX+25,550, 10));
     println(1);
   }
   for (int i = danmaku.size() -1; i>= 0; i--) {
     Tama t = (Tama)danmaku.get(i);
     t.update();
   }
   
  if(vep==15){
    song.close();
    screen=3;
  }
   
}
