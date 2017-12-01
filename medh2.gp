{
p=11;\\modを決める
count=0;
for(a=0,p-1,\\楕円曲線の係数a
  for(b=0,p-1,\\楕円曲線の係数b
\\print1("a="a);
\\print1("b="b);
    if(((4*a^3+27*b^2)%p)!=0,\\判別式

      for(x=0,p-1,\\ベースポイントのx座標
        for(y=0,p-1,\\ベースポイントのy座標
          if(((y^2-x^3-a*x-b)%p)==0,\\楕円曲線上の点であるかどうか
            G = [Mod(x,p),Mod(y,p)];\\ベースポイントGの確定


            for(X=0,p-1,\\補助元のx座標
              for(Y=0,p-1,\\補助元のy座標
                \\count = count + 1;\\確認用
                \\print("count="count);\\確認用
                if(((Y^2-X^3-a*X-b)%p)==0,\\楕円曲線上の点であるかどうか
                  Z = [Mod(X,p),Mod(Y,p)];\\補助元Zの確定

                  if(G!=Z,\\補助元とベースポイントが違うか
                    E = ellinit([0, 0, 0, a, b] * Mod(1,p));
                    print("E:y^2=x^3+"a"x+"b" (mod "p")");
                    print("G="G);
                    print("Z="Z);

                    for(xp=0,p-1,\\Pの座標
                      for(yp=0,p-1,\\
                        if(((yp^2-xp^3-a*xp-b)%p)==0,\\楕円曲線上の点であるかどうか
                          P = [Mod(xp,p),Mod(yp,p)];\\Pの確定

                          for(xq=0,p-1,\\Q
                            for(yq=0,p-1,\\
                              if(((yq^2-xq^3-a*xq-b)%p)==0,\\楕円曲線上の点であるかどうか
                              Q = [Mod(xq,p),Mod(yq,p)];\\Qの確定

                              for(n=1,p,
                                if(P!=G && P!=Z && Q!=G && Q!=Z,
                                  hp = lift(P);
                                  Ghp = me_s(E,G,Z,hp);
                                  Pn = me_s(E,P,Z,n);
                                  Ka = elladd(E,Ghp,Pn);
                                  hq = lift(Q);
                                  Ghq = me_s(E,G,Z,hq);
                                  Qn = me_s(E,Q,Z,n);
                                  Kb = elladd(E,Ghq,Qn);
                                  Php = me_s(E,P,Z,hp);
                                  B = elladd(E,Kb,Php);
                                  Qhq = me_s(E,Q,Z,hq);
                                  A = elladd(E,Ka,Qhq);
                                  \\print1(lift(A-B));
                                  if(lift(A-B)!=0,
                                    print("error");
                                    count = count + 1;
                                    print("error is "count);
                                  );
                                );
                              );
                            );
                          );
                        );
                      );
                    );
                  );
                );
              );
            );
          );
        );
      );
    );
  );
);
);
print(count);
}
