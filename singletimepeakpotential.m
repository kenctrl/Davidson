function singletimepeakpotential(N,t,a,m,potential)
Hv = Hconstr(N,a,m) - 1/(2*m*a^2) * eye(N) * potential;
v = zeros(N,1);
v(1,1) = 1;
for jj = 0:t
    psi = (abs(expm(-i*Hv*jj)*v)).^2;
    plot(jj,psi(2,1),'b.');
    hold on
end