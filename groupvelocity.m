%Find Group Velocity
function groupvelocity(N,a,m)
H = Hconstr(N,a,m);
v = N/(2*pi) * wavefunction(N);
p = momentum(N);
E = H * v;
Eparticle = real(E(1,:));
plot(2*pi/N:2*pi/N:2*pi*(N-1)/N, diff(Eparticle)./diff(p'));