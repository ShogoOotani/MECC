ec_s(E,P,n) ={
local(Q,bi,i);
Q = P;
i=1;
bi = binary(n);
print(bi);
print(bi[1]);
print(length(bi));
for(i=2,length(bi),
    print(i);
    Q = elladd(E,Q,Q);
  if(bi[i] == 1,
    Q = elladd(E,Q,P);
  );
  );
return (Q);
}
