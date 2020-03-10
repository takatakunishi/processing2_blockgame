ArrayList danmaku;               //Class Tamaの作成
class Tama {
  float tx, ty, tr,bcount=1,dcount=1;
  Tama(float sx, float sy, float sr) {
    tx = sx;
    ty = sy;
    tr = sr;
  }
  void update() {
       ty -= 10;
       stroke(255, 0, 0);
       ellipse(tx, ty, tr, tr);   
       if((bcount==1)&&(ty<10)){
         refcount++;
         bcount=0;
       }
       for(int i =0;i<hit.length;i++){
         if((hit[i]>0)&&(dcount==1)&&(b_w*i<tx+40)&&(tx<b_w*(i+1))&&(40<ty+10)&&(ty<40+b_h)){
           ty=-30;
           hit[i]-=1;
           dcount=0;
           println(2);
           score = score + 1;
         }
       }  
         
       for(int i = 0;i<3;i++){
           if((tx + 10 > jx[i]) && (tx < jx[i] + 50) && (ty + 10 > jy[i] ) && (ty < jy[i]+13)){
             ty= -30;
           }
         
       }  
           
  }
}
