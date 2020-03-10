import ddf.minim.*;                    //音の設定
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;                                 //Minim　クラスの設定r
AudioPlayer song;

PImage  backimg, myimg, bloimg, jamimg, lifimg,bom0,bom1,bom2,clegame;   //画像ファイルの管理
boolean  right, left,a,t;    //zは弾幕設定
int pointer = 300;                   //自機の座標管理
int countT = 30000;                      //必殺技使用時のframeCount戻し管理
int bom = -30;                             //必殺技使用時のX座標観測
float cjx[] = new float [3];    //あたり判定のｘ、ｙ座標
float cjy[] = new float [3];
int flag = 0;                         //あたり判定のフラグ管理
float x =  0; //ボールの初期位置
float y = 100;
float dx = 1; //ボールの速度変化
float dy = 2;
int count = 0; //落ちた回数
int hit [] = new int [15];//{5, 5, 5, 5, 5, 5, 5, 10, 5, 5, 5, 5, 5, 5, 5};  //ボールに何回当たれば壊れるかの記録整理
float r_w = 50.0; //ラケットの幅
float b_w = 40.0; //ブロックの幅
float b_h = 40.0; //ブロックの高さ
float a_w = 10; //ボールの幅
float a_h = 10; //ボールの高さ
float jx[] = {30, 150, 300};                      //jammer配列の初期化と設定
float jy [] = new float [3] ;
float djx [] = new float [3];
float djy [] = new float [3];
int screen ;                //画面制御変数
int countB = 10;            //ボムの時間制御変数
int ballFall = 3; // ボー落とした回数
float deathBallx;    // ボールとマウスの死亡地点
float deathBally;
int deathBar;
int endfont = 0;          //リトライ画面の制御関数
int refcount=0;
int score = 0;               //スコア変数
int highscore = 0;
int vep;              //クリア制御数
int flagvep[]=new int[15];

void setup() {
  PFont font = createFont("MS Gothic", 48, true);   //文字設定
  textFont(font);
  size(600, 650);                   //ウィンドウの大きさ決め
  for(int i = 0;i<15;i++){
    flagvep[i]=1;
  }
  for (int i=0; i<3; i++) {            //jammerの初期設定
    jy[i] = 30;
    djx[i] = 2;
    cjx[i] = 0;
    cjy[i]  = 0;
  }

  minim = new Minim ( this ) ;
  song = minim.loadFile("bgm.mp3");
  song.play();
  song.loop();
  backimg = loadImage("背景2.jpg");
  myimg = loadImage("戦闘機.png");
  bloimg = loadImage("ブロック１.jpg");
  jamimg = loadImage("jammer1.jpg");
  lifimg  = loadImage("life.png");
  bom0 = loadImage("必殺技.png");
  bom1 = loadImage("必殺技1.png");
  bom2 = loadImage("必殺技２.png");
  clegame = loadImage("clear.jpg");
  
  danmaku = new ArrayList();              //弾幕関数の初期化
}



void draw() {                             //ゲーム関数の制御
  if (screen==0) {
    gameTitle();
  } else if (screen==1) {
    gamePlay();
  }else if(screen==3){
    gameclear();
  }  else {
    gameOver();
  }
}
