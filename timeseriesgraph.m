function timeseriesgraph(N,t,a,m)
for j = 0:t
    H = Hconstr(N,a,m);
    v = zeros(N,1);
    v(1,1) = 1;
    plot(real(expm(-i*H*j)*v));
    hold on
end