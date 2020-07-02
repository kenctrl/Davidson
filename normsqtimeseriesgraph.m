function normsqtimeseriesgraph(N,t,a,m)
for jj = 0:1:t
    H = Hconstr(N,a,m);
    v = zeros(N,1);
    v(1,1) = 1;
    psip = (abs(expm(-i*H*jj)*v)).^2;
    plot(jj,psip(1,1),'.');
    hold on
end