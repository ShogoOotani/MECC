oplus(E,P,Q) = {
  local(k,R,R_y,a,b);
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
