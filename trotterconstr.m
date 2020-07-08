function [HA,HB] = trotterconstr(N,m)
HB = zeros(N);
HA = zeros(N);

for kk = 2:2:N-1
    HB(kk,kk+1) = 1;
    HB(kk+1,kk) = 1;
end
if (mod(N,2) == 0)
    HB(N,1) = 1;
    HB(1,N) = 1;
end
HB = -1/(2*m) * HB;

for kk = 1:2:N
    HA(kk,kk+1) = 1;
    HA(kk+1,kk) = 1;
end
if (mod(N,2) == 1)
    HA(N,1) = 1;
    HA(1,N) = 1;
end
HA = -1/(2*m) * HA;
end