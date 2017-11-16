ec_s(E,P,n) = {
local(Q,bi,i);
Q = P;
i=1;
bi = binary(n);
\\print(bi);
\\print(bi[1]);
\\print(length(bi));
for(i=2,length(bi),
    \\print(i);
    Q = elladd(E,Q,Q);
  if(bi[i] == 1,
    Q = elladd(E,Q,P);
  );
  );
return (Q);
}
{
E = ec_crypto(32);
P = random(E);
for(i=1,10000,
  n=random(2^32);
  Q = ellpow(E,P,n);
  R = ec_s(E,P,n);
  print(lift(Q-R));
  );
}
