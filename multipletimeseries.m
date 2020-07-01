function multipletimeseries(N,t,a,m)
H = Hconstr(N,a,m);
v = zeros(N,1);
v(1,1) = 1;
for jj = 0:t
    plot((abs(expm(-i*H*jj)*v)).^2 + 0.2*jj);
    hold on
end