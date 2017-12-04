ecdh128(E,G,Rb) = {

for(i=1,10000,
  ra = random(2^128);
  \\print(ra);
  Ra = ellmul(E,G,ra);
  Ka = ellmul(E,Rb,ra);
);
return(Ka);
}
