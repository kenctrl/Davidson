function [EA,EB] = trottermomentum(N,m,a,b)
[HA,HB] = trotterconstr(N/2,m);
[Kpeven,Kpodd] = momentumcouple(N);
Klc = a*Kpeven + b*Kpodd;
EA = HA*Klc;
EB = HB*Klc;
end

