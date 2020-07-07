function [HA,HB] = trotterconstr(N,m)
HA = zeros(N);
HB = zeros(N);

for kk = 2:2:N-1
    HA(kk,kk+1) = 1;
    HA(kk+1,kk) = 1;
end
if (mod(N,2) == 0)
    HA(N,1) = 1;
    HA(1,N) = 1;
end
HA = -1/(2*m) * HA;

for kk = 1:2:N
    HB(kk,kk+1) = 1;
    HB(kk+1,kk) = 1;
end
if (mod(N,2) == 1)
    HB(N,1) = 1;
    HB(1,N) = 1;
end
HB = -1/(2*m) * HB;
end