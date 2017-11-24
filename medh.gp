{
local(G,n,Z,ra,rb,Ra,Rb,Ka,Kb);
E = ec_crypto(32);
G = random(E);
Z = random(E);
for(i=1,10000,
  ra = random(E.no);
  rb = random(E.no);
  Ra = me_s(E,G,Z,ra);
  Rb = me_s(E,G,Z,rb);
  Ka = me_s(E,Ra,Z,rb);
  Kb = me_s(E,Rb,Z,ra);
  print1(lift(Ka-Kb));
  if(lift(Ka-Kb)!=0,
  print("error");
  break;
  );
  );
}
