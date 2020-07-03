function trottertimeseriesgraph(N,m,step,t)
[HA,HB] = trotterapproximation(N,m);
evoleff = expm(-i*HA*step) * expm(-i*HB*step);
v = zeros(N,1);
v(1,1) = 1;
evol = evoleff * v;
totalsteps = t/step;
for jj = 1:totalsteps-1
    evol = evoleff * evol;
end
plot(0:N-1,real(evol));