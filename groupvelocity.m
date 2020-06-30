%Find Group Velocity
function groupvelocity(N,a,m)
H = Hconstr(N,a,m);
v = N/(2*pi) * wavefunction(N);
p = momentum(N);
E = H * v;
Eparticle = real(E(1,:));
plot(p(1:N-1,1), diff(Eparticle)./diff(p'));