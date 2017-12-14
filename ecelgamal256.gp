\\パラメータ生成
\\Eの生成
\\ベースポイントP
\\平文 M
\\乱数db
\\スカラー倍点Pb=db*P

en_ecel256(E,P,M,Pb) = {
for(i=1,10000,
  r = random(2^256);\\乱数生成r
  R = ellmul(E,P,r);\\スカラー倍点R=r*P
  K = ellmul(E,Pb,r);\\スカラー倍点K=r*Pb
  C = elladd(E,M,K);\\C=M+K
  \\print("C="C);
  \\print("R="R);
  CR = [C,R];
);
  return (CR);\\(C,R)を返す
}

de_ecel256(E,db,CR) = {
for(i=1,10000,
C = CR[1];
R = CR[2];
KK = ellmul(E,R,db);\\KK=db*R
MM = ellsub(E,C,KK);\\MM=C-KK
);
return (MM);\\MMを返す

}

check_el256(M,MM)={
  if(M == MM,
    return("true");
  ); else (
    return("false");
  );

}
