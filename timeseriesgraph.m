function timeseriesgraph(N,t,a,m)
for jj = 0:t
    H = Hconstr(N,a,m);
    v = zeros(N,1);
    v(1,1) = 1;
    plot(real(expm(-i*H*jj)*v));
    hold on
end