void show_block(int n) {       // show_blockというかんすうを定義（引数はひとつ）
  rect(b_w * n, 40, b_w, b_h); //ブロックを引数ｎによって座標を変えながら表示
  image(bloimg, b_w * n, 40, b_w, b_h);
  fill(200,150,0);
  textSize(10);
  text(hit[n], b_w*n, 40);
}
