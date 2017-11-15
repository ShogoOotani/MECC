/* 使用する楕円曲線を定義する*/

check_curve(p, n) = {
  local(d);
  if (p == n, return(1)); \\ anomalous
  if (p == n + 1, return(2)); \\ supersingular
  d = 1;
  for (i = 0, 30,
    d = (d * p) % n;
    if (d == 1, return(3)) \\ MOV condition not satisfied
  );
  return (0);
}

is_singular(a, b, p) = (4*a^3 + 27*b^2) % p == 0;

ec_crypto(nb) = {
  local(p, E, e, n, a4, a6, t=1<<(nb-1));
  p = nextprime(t + random(t));
  while (1, print1("*");
    a4 = random(p);
    a6 = random(p);
    if (is_singular(a4,a6,p), next);
    E = ellinit([0, 0, 0, a4, a6] * Mod(1,p));
    n = p + 1 - ellap(E, p);
    if (isprime(n) && !check_curve(p, n), break)
    );
  print("");
  e=E.no;
  /*楕円曲線の方程式*/
    return (E);
}
