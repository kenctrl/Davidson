function normsqtimeseriesgraph(N,t,a,m)
for j = 0:1:t
    H = Hconstr(N,a,m);
    v = zeros(N,1);
    v(1,1) = 1;
    psip = (abs(expm(-i*H*j)*v)).^2;
    plot(j,psip(1,1),'.');
    hold on
end