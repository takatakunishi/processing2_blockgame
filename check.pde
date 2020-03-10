int checkHitBlock(int n, float x, float y) {   //ｎ番目のブロックにボールが当たったかを調べる
  float left    = b_w * n;
  float right   = b_w * (n+1);
  float top     = 40;
  float bottom  = 40 + b_h;
  float bdx, bdy;

  if ((x + a_w < left)||   //ボールがブロックにあたっていないとき　checkBox　は０になる
    (x >= right) ||
    (y + a_h < top) ||
    (y >= bottom)) {
    return 0;
  }

  if (x + a_w - left > right - x){ //ボールがブロックのどちら側に寄っているかを記録
    bdx = right -x;
  } else {
    bdx = x + a_w - left;
  }

  if (y + a_h -top > bottom - y){  //ボールがブロックの上下どちら側によっているかを記録
    bdy = bottom -y;
  } else {
    bdy = y + a_h - top;
  }

  if (bdx > bdy) {
    return 1;
  } else if (bdx < bdy) {
    return 2;
  } else {
    return 3;
  }
} 

int checkJammer(int n) {

  if ((x + a_w < jx[n]) || (x >= jx[n] + 50) ||(y + a_h < jy[n] ) ||(y >= jy[n]+13)) {
    cjx[n]= x;                 //ボールの値を保存
    cjy[n] = y;
    flag= 0;                         //フラグスタンバイ
    return 0;                       //何もしない
  } else {
    if (((jx[n]<cjx[n])&&(jx[n]+50>cjx[n]+a_w))&&((cjy[n]>jy[n]+13)||(cjy[n]+a_w<jy[n]))) {
      return 1;                                   //縦方向反射
    } else if (((jy[n]<cjy[n])&&(cjy[n]+a_w<jy[n]+13))&&((cjx[n]+a_w<jx[n])||(cjx[n]>jx[n]+50))) {
      return 2;                                    //横方向反射
    } else if ((cjx[n] + a_w >jx[n])&&(cjx[n] < jx[n] + 50)&&(cjy[n] + a_h > jy[n] )&&(cjy[n] < jy[n]+13)) {
      return 4;                                   //中にある
    } else {                                         //3番の位置にある
      return 2;
    }
  }
}

boolean checkHit(float x, float y) { //真偽判定
  if (y + a_h < 550) { //もしボールの下端がバーの上端より上にあるならば　偽
    return false;
  } else if ((x + a_w >= pointer && x <= pointer + r_w)&&(y + a_h >= 550 && y <= 550 + 3)) {
    return true; // ボールがバーの間にあってボールがバーに接しているあいだ　真
  } else {
    return false; // 上記のもの以外は　偽
  }
}  
