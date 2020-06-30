function normsqtimeseriesgraph(N,t,a,m)
for j = 0:t
    H = Hconstr(N,a,m);
    v = zeros(N,1);
    v(1,1) = 1;
    plot(abs(expm(-i*H*j)*v).^2);
    hold on
end