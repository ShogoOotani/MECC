{
E = ec_crypto(32);
G = random(E);
Z = random(E);
n = random(2^32);

for(i=1,10000,
  P = random(E);
  hp = lift(P[1]);
  Ghp = me_s(E,G,Z,hp);
  Pn = me_s(E,P,Z,n);

  Ka = elladd(E,Ghp,Pn);

  Q = random(E);
  \\print(Q);
  hq = lift(Q[1]);
  \\print(hq);
  Ghq = me_s(E,G,Z,hq);
  Qn = me_s(E,Q,Z,n);

  Kb = elladd(E,Ghq,Qn);

  Php = me_s(E,P,Z,hp);
  B = elladd(E,Kb,Php);

  Qhq = me_s(E,Q,Z,hq);
  \\print(Qhq);
  A = elladd(E,Ka,Qhq);

  print1(lift(A-B));
  if(lift(A-B)!=0,
  print("error");
  break;
  );
  );
}
