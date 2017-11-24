{
E=ec_crypto(32);
G = random(E);
Z = random(E);

for(i=1,10000,
  db = random(E.no);
  Pb = me_s(E,G,Z,db);

  r = random(E.no);

  R = me_s(E,G,Z,r);
  K = me_s(E,Pb,Z,r);
  M = random(E);
  C = elladd(E,M,K);
  KK = me_s(E,R,Z,db);
  MM = ellsub(E,C,KK);
  print1(lift(M-MM));
  if(lift(M-MM)!=0,
  print("error");
  break;
  );
  );

}
