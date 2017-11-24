el_g(E,P)={
db = random (E.no);
Pb = ellmul(E,P,db);
print("db="db);
return(Pb);
}

el_e(E,P,Pb)={
r = random (E.no);
R = ellmul(E,P,r);
K = ellmul(E,Pb,r);
M = random(E);
print("M="M);
C = elladd(E,M,K);
CR = [C,R];
return (CR);
}

el_d(E,CR,rb)={
C = CR[1];
R = CR[2];
K = ellmul(E,R,rb);
M = ellsub(E,C,K);
return (M);
}
