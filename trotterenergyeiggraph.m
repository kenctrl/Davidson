function trotterenergyeiggraph(N,m,dt)
[HA,HB] = trotterconstr(N,m);
evoleff = expm(-i*HA*dt) * expm(-i*HB*dt);
E = eig(logm(evoleff)/(-i*dt));
plot(real(E),'b.');