ec_g(E,P)={

r = random (E.no);
R = ellmul(E,P,r);
print("r="r);
return (R);
}

ecdh(E,R,r) = {

K = ellmul(E,R,r);
return (K);

}
