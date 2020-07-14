function multipletrottertimeseriesgraph(N,m,dt,tend)
[HA,HB] = trotterapproximation(N,m);
evoleff = expm(-i*HA*dt) * expm(-i*HB*dt);
v = zeros(N,1);
v(1,1) = 1;
evol = evoleff * v;
stepspersec = 1/dt;
for s = 0:tend-1
    for jj = 1:stepspersec-1
        evol = evoleff * evol;
    end
    plot(0:N-1,real(evol) + 0.2 * s);
    hold on
    evol = evoleff * evol;
end