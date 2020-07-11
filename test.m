Z = [1 0; 0 -1];
[HA,HB] = trotterconstr(N,m);
evoleff = expm(-i*HA*dt) * expm(-i*HB*dt) * expm(-i*Z*dt);