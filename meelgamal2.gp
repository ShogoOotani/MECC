{
p=5;\\modを決める
count=0;
for(a=0,p-1,\\楕円曲線の係数a
  for(b=0,p-1,\\楕円曲線の係数b
\\print1("a="a);\\確認用
\\print1("b="b);\\確認用
    if(((4*a^3+27*b^2)%p)!=0,\\判別式

      for(x=0,p-1,\\ベースポイントGのx座標
        for(y=0,p-1,\\ベースポイントGのy座標
          if(((y^2-x^3-a*x-b)%p)==0,\\楕円曲線上の点であるかどうか
            G = [Mod(x,p),Mod(y,p)];\\ベースポイントGの確定


            for(X=0,p-1,\\補助元Zのx座標
              for(Y=0,p-1,\\補助元Zのy座標
                \\count = count + 1;\\確認用
                \\print("count="count);\\確認用
                if(((Y^2-X^3-a*X-b)%p)==0,\\楕円曲線上の点であるかどうか
                  Z = [Mod(X,p),Mod(Y,p)];\\補助元Zの確定

                  if(G!=Z,\\補助元とベースポイントが違うか
                    E = ellinit([0, 0, 0, a, b] * Mod(1,p));\\楕円曲線の生成
                    print("E:y^2=x^3+"a"x+"b" (mod "p")");\\確認用
                    print("G="G);\\確認用
                    print("Z="Z);\\確認用

                    for(xp=0,p-1,\\Pのx座標
                      for(yp=0,p-1,\\Pのy座標
                        if(((yp^2-xp^3-a*xp-b)%p)==0,\\楕円曲線上の点であるかどうか
                          P = [Mod(xp,p),Mod(yp,p)];\\Pの確定

                          for(xr=0,p-1,\\Rのx座標
                            for(yr=0,p-1,\\Rのy座標
                              if(((yr^2-xr^3-a*xr-b)%p)==0,\\楕円曲線上の点であるかどうか
                                R = [Mod(xr,p),Mod(yr,p)];\\Rの確定

                                for(n=1,p,\\自然数n
                                  if(P!=G && P!=Z && R!=G && R!=Z,

                                    hp = lift(P);
                                    Ghp = me_s(E,G,Z,hp);
                                    Pn = me_s(E,P,Z,n);
                                    K =elladd(E,Ghp,Pn);
                                    hr = lift(R);
                                    Ghr = me_s(E,G,Z,hr);
                                    Rn = me_s(E,R,Z,n);
                                    C1 = elladd(E,Ghr,Rn);
                                    Rhr = me_s(E,R,Z,hr);
                                    C2 = elladd(E,K,Rhr);
                                    C2 = lift(C2[1]);
                                    c2 = C2+m;
                                    Php = me_s(E,P,Z,hp);
                                    M = elladd(E,C1,Php);
                                    M = lift(M[1]);
                                    mm =c2 - M;

                                    if((m-mm)!=0,
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
