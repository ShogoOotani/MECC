ecdh(E) = {
local(G,n,Z,ra,rb,Ra,Rb,Ka,Kb);
\\ E = ec_crypto(32);
n = 2^32;
for(i=1,10000,
  G = random(E);
  ra = random(n);
  rb = random(n);
  Ra = ellmul(E,G,ra);
  Rb = ellmul(E,G,rb);
  Ka = ellmul(E,Ra,rb);
  Kb = ellmul(E,Rb,ra);
  \\print1(lift(Ka-Kb));
  \\if(lift(Ka-Kb)!=0,
  \\print("error");
  \\);
  );
}
