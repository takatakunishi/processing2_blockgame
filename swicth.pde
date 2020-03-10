void switchcheck(int swi){
  
   switch(swi){
    case 1:
     // println("1");
      if(flag ==0){
      dy = -dy;
      flag = 1;
      }
    break;
    case 2: 
      // println("2");
      if(flag ==0){
      dx = -dx;
      flag = 1;
      }
    break;
    case 3:
    // println("3");
      if(flag ==0){
      dx = - dx;
      flag = 1;
      }
    break;
    case 0:
     //  println("0");
    break;
    case 4:
    if (flag==0){
       //dx =  -dx;
       flag = 1;
     //  println("4");
    }
    break;
   }
}

void switchcheck2(int swi,int swi2){
   switch(swi){
    case 1:
      dy = -dy;
      hit[swi2]--;  //ボールにぶつけると耐久地が消費される
      score = score + 50;
    break;
    case 2:    
      dx = -dx;
    break;
    case 3:
      dy = -dy;
      dx = -dx;
    break;
   }
}
