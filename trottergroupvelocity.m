function trottergroupvelocity(N,m,potential)
[HA,HB] = trotterconstr(N,m);
Heff = HA + HB;
Heff(1,1) = Heff(1,1) + potential;
v = sqrt(N) * wavefunction(N);
p = momentum(N);
E = Heff * v;
Eparticle = real(E(1,:));
plot(p(1:N-1,1), diff(Eparticle)./diff(p'));