oplus(E,P,Q) = {
  local(k,R,R_y,a,b);
  R=ellsub(E,P,Q);
  if(P==Q,return (P););
  R_y = R[2];
  a = lift(R_y);
  b = R_y.mod;
  k = kronecker(a,b);
  \\print("k="k);
  if(k==1, R = ellsub(E,elladd(E,P,P),Q),
           R = ellsub(E,elladd(E,Q,Q),P);
           );
  return (R);
}

me_s(E,P,Z,n) = {
local(X,Y,bi,i);
Y = P;
i=1;
bi = binary(n);
\\print(bi);
\\print(bi[1]);
\\print(length(bi));
for(i=2,length(bi),
\\    print(i);
    X = elladd(E,Z,Y);
    Y = oplus(E,X,Y);
  if(bi[i] == 1,
    Y = oplus(E,Y,P);
  );
  );
return (Y);
}
/*
{\\検証用
E = ec_crypto(32);
for(i=1,10000,
  P = random(E);
  print("P"P);
  Q = random(E);
  print("Q"Q);
  Z = random(E);
  n = random(2^32);
  R = elladd(E,me_s(E,P,Z,n),Q);
  S = elladd(E,me_s(E,Q,Z,n),P);
  \\Q = oplus(E,P,P);
  \\R = ec_s(E,P,n);
  print(lift(R-S));
  );
}
*/
