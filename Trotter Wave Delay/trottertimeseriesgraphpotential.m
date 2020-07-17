function trottertimeseriesgraphpotential(N,m,step,t,potential)
[HA,HB] = trotterconstr(N,m);
HA(1,1) = HA(1,1) + potential;
HB(1,1) = HB(1,1) + potential;
evoleff = expm(-i*HA*step) * expm(-i*HB*step);
v = zeros(N,1);
v(1,1) = 1;
evol = evoleff * v;
totalsteps = t/step;
for jj = 1:totalsteps-1
    evol = evoleff * evol;
end
plot(0:N-1,real(evol));