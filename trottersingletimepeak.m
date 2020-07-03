function trottersingletimepeak(N,m,dt,tend)
[HA,HB] = trotterapproximation(N,m);
evoleff = expm(-i*HA*dt) * expm(-i*HB*dt);
v = zeros(N,1);
v(1,1) = 1;
plot(0,(abs(v(1,1))).^2,'b.');
hold on

evol = evoleff * v;
plot(dt,(abs(evol(1,1))).^2,'b.');
hold on
for jj = 2*dt:dt:tend
    evol = evoleff * evol;
    plot(jj,(abs(evol(1,1))).^2,'b.');
    hold on
end