function trotterenergyeiggraph(N,m,step)
[HA,HB] = trotterapproximation(N,m);
evoleff = expm(-i*HA*step) * expm(-i*HB*step);
E = eig(logm(evoleff))/(-i*step);
plot(real(E),'b.');
end