\\楕円曲線E
\\ベースポイントG
\\補助元Z
\\P
\\自然数n
\\平文m

\\hp
\\Ghp
\\Pn
\\K


en_meel128(E,G,Z,m,n,K) = {

for(i=1,10000,
\\ランダムにR
R = random(E);
\\hrを計算
hr = lift(R[1]);
\\Ghrを計算
Ghr = me_s(E,G,Z,hr);
\\Rnを計算
Rn = me_s(E,R,Z,n);
\\C1を計算
C1 = elladd(E,Ghr,Rn);
\\c2を計算
Rhr = me_s(E,R,Z,hr);
KRhr=elladd(E,K,Rhr);
c2 = lift(KRhr[1])+m;
\\Cにする
C =[C1,c2];
);
return(C);
}

de_meel128(E,P,C) = {
for(i=1,10000,
C1=C[1];
c2=lift(C[2]);
hp = lift(P[1]);
Php = me_s(E,P,Z,hp);
CPhp = elladd(E,C1,Php);
mm=c2-lift(CPhp[1]);
);
return (mm);
}
