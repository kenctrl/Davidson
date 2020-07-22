function trottersingletimepeakpotential(N,m,dt,tend,potential)
[HA,HB] = trotterconstr(N,m);
Heff = HA + HB;
Heff(1,1) = Heff(1,1) + potential;
evoleff = expm(-i*Heff*dt);
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
xlabel('Time','FontSize', 16);
ylabel('|\psi|^2 at Initial Position','FontSize', 16);
title('Projected Cooling Wave Reflection','FontSize', 16);