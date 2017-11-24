oplus(E,P,Q) = {
  local(k,R,R_y,a,b);
  if(P==Q,return (P););
  R=ellsub(E,P,Q);
  R_y = R[2];
  a = lift(R_y);
  b = R_y.mod;
  k = kronecker(a,b);
  print("k="k);
  if(k==1, R = ellsub(E,elladd(E,P,P),Q),
           R = ellsub(E,elladd(E,Q,Q),P);
           );
  return (R);
}

\\{
\\E = ec_crypto(32);
\\for(i=1,10000,
\\  P = random(E);
\\  n=random(2^32);
\\  Q = oplus(E,P,P);
  \\R = ec_s(E,P,n);
  \\  print(lift(P-Q));
  \\);
\\}
