function singletimepeakpotential(N,t,a,m,potential)
Hv = Hconstr(N,a,m);
Hv(1,1) = Hv(1,1) + potential;
v = zeros(N,1);
v(1,1) = 1;
for jj = 0:t
    psi = (abs(expm(-i*Hv*jj)*v)).^2;
    plot(jj,psi(1,1),'b.');
    hold on
end