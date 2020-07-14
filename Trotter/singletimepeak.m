function singletimepeak(N,t,a,m)
H = Hconstr(N,a,m);
v = zeros(N,1);
v(1,1) = 1;
for jj = 0:t
    psi = (abs(expm(-i*H*jj)*v)).^2;
    plot(jj,psi(1,1),'b.');
    hold on
end