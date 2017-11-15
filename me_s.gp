oplus(E,P,Q) = {
  local(k,R,R_y,a,b);
  R=ellsub(E,P,Q);
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

me_s(E,P,n) = {
local(X,Y,Z,bi,i);
Y = P;
Z = random(E);
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
