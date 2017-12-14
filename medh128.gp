\\楕円曲線E
\\ベースポイントG
\\補助元Z
\\自然数n
\\Kb生成

medh128(E,G,Z,Kb,n)={
for(i=1,10000,
  \\ランダムに点P生成
  P = random(E);
  \\hp生成
  hp = lift(P[1]);
  \\Ghp計算
  Ghp = me_s(E,G,Z,hp);
  \\Pn計算
  Pn = me_s(E,P,Z,n);
  \\Ka計算
  Ka = elladd(E,Ghp,Pn);

\\(Kbを受け取る)

  \\Phpを計算
  Php = me_s(E,P,Z,hp);
  \\Kb+Phpを計算
  B = elladd(E,Kb,Php);
);
  return(B);
}
