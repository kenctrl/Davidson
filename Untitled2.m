[HA,HB] = trotterapproximation(N,m);
evoleff = expm(-i*HA*step) * expm(-i*HB*step);
evol = evoleff^2;
totalsteps = t/step;
for jj = 1:totalsteps-1
    evol = evoleff * evol;
end
E = eig(logm(evol))/(-i*step);
plot(1:N,real(E));