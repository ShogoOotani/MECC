\\楕円曲線E
\\ベースポイントG
\\補助元Z
\\自然数n
\\Kb生成

E = [Mod(0, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(0, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(0, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(53339124112001252595208613887211082174357364251754946759229721752128653406012, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(34892490288744125246590571224926817021994233273674877622626532654839272268890, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(0, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(28778756999766736680647871214199457114015352088520699779250813454921539165117, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(61670469930740732476592928339484560853277556679710316751297500570021321428653, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(38007346758135436978527368459879445510282508685403308679682978846613658067641, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(10405253023720236252375299901217394375925937610405948950858147525904968859355, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(77890985528553968736256807029640500060340500560712904863624245361146606678956, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(31297701419680455696293116299088791319825265845934847347039783350416066703014, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(44865193144438583015235797763682187454291799332505317041387105233572451067883, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Vecsmall([3]), [77899491224235768509769356560222707234699376414989193739208630049335767646907, [30656133256496695224944328908021180788797190178996153283664536997908911385043, 459307566817187769677674651439187415379296130919599281556773162214692269354, [6, 0, 0, 0]]], [77899491224235768509769356560222707234444060868273541782988403176858162246659, 0, 0, 0]]

G = [Mod(45022842631700963122795587051392038474435028111264601490003461283055070624754, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(68620299511039604657921541675833481938794509899606563473821638269715060968155, 77899491224235768509769356560222707234699376414989193739208630049335767646907)]

Z = [Mod(72499889479106052754785197839825173192488391001805957325987552826678356886373, 77899491224235768509769356560222707234699376414989193739208630049335767646907), Mod(14155358152096575278732662347266133098763063583195310636268976946900283836260, 77899491224235768509769356560222707234699376414989193739208630049335767646907)]

n = 89387427620410635249757572607858113161992769793686730770372542044057053437712

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


{
count = 0;
for(i=1,1000000000000,\\1兆回
  \\print("i="i);
\\Aの処理
  P = random(E);
  \\print(P);
  hp = lift(P[1]);
  \\print(hp);
  Ghp = me_s(E,G,Z,hp);
  \\print(Ghp);
  Pn = me_s(E,P,Z,n);
  \\print(Pn);
  Ka = elladd(E,Ghp,Pn);
  \\print(Ka);

\\Bの処理
  Q = random(E);
  \\print(Q);
  hq = lift(Q[1]);
  \\print(hq);
  Ghq = me_s(E,G,Z,hq);
  \\print(Ghq);
  Qn = me_s(E,Q,Z,n);
  \\print(Qn);
  Kb = elladd(E,Ghq,Qn);
  \\print(Kb);

\\Aの鍵
  Php = me_s(E,P,Z,hp);
  \\print(Php);
  B = elladd(E,Kb,Php);
  \\print(B);

\\Bの鍵
  Qhq = me_s(E,Q,Z,hq);
  \\print(Qhq);
  A = elladd(E,Ka,Qhq);
  \\print(A);

\\エラー時の処理
  if(lift(A-B)!=0,
    count = count + 1;
    print("P="P);
    print("hp="hp);
    print("Ghp="Ghp);
    print("Pn="Pn);
    print("Ka="Ka);
    print("Q="Q);
    print("hq="hq);
    print("Ghq="Ghq);
    print("Qn="Qn);
    print("Kb="Kb);
    print("Phq="Phq);
    print("B="B);
    print("Qhq="Qhq);
    print("A="A);
  );

\\出力
  if(i%5000 == 0,
    print("i="i);
    print("error="count);
  );
  );
}