medh(E) = {
local(G,n,Z,ra,rb,Ra,Rb,Ka,Kb);
\\E = ec_crypto(32);
n = 2^32;
for(i=1,10000,
  G = random(E);
  Z = random(E);
  ra = random(n);
  rb = random(n);
  Ra = me_s(E,G,Z,ra);
  Rb = me_s(E,G,Z,rb);
  Ka = me_s(E,Ra,Z,rb);
  Kb = me_s(E,Rb,Z,ra);
  \\print1(lift(Ka-Kb));
  \\if(lift(Ka-Kb)!=0,
  \\print("error");
  \\);
  );
}
