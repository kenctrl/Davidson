function multipletrottertimeseriesgraph(N,m,step,tend)
[HA,HB] = trotterapproximation(N,m);
evoleff = expm(-i*HA*step) * expm(-i*HB*step);
v = zeros(N,1);
v(1,1) = 1;
evol = evoleff * v;
stepspersec = 1/step;
for s = 0:tend-1
    for jj = 1:stepspersec-1
        evol = evoleff * evol;
    end
    plot(0:N-1,real(evol) + 0.2 * s);
    hold on
    evol = evoleff * evol;
end

