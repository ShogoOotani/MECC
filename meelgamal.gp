{
E=ec_crypto(32);
G = random(E);
Z = random(E);
P = random(E);
n = random(2^32);
m = random(2^32); \\平文

for(i=1,10000,

  P = random(E);
  hp = lift(P);
  Ghp = me_s(E,G,Z,hp);
  Pn = me_s(E,P,Z,n);
  K =elladd(E,Ghp,Pn);

  R = random(E);
  hr = lift(R);
  Ghr = me_s(E,G,Z,hr);
  Rn = me_s(E,R,Z,n);
  C1 = elladd(E,Ghr,Rn);

  Rhr = me_s(E,R,Z,hr);
  C2 = elladd(E,K,Rhr);
  C2 = lift(C2[1]);

  c2 = C2+m; \\？？？？

  Php = me_s(E,P,Z,hp);
  M = elladd(E,C1,Php);
  M = lift(M[1]);
  mm =c2 - M;

  print1(m-mm",");

  if((m-mm)!=0,
    print("error");

  );
);
}
