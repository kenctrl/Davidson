function [HA,HB] = trotterapproximation(N,m)
HA = zeros(N);
HB = zeros(N);
for ii = 0:N-1
    if mod(ii,2) == 0
        for kk = 2:2:N-2
            HA(kk,kk+1) = 1;
            HA(kk+1,kk) = 1;
        end
        HA(N,1) = 1;
        HA(1,N) = 1;
        HA = -1/(2*m) * HA;
    end
    if mod(ii,2) == 1
        for kk = 1:2:N-1
            HB(kk,kk+1) = 1;
            HB(kk+1,kk) = 1;
        end
        HB(N,1) = 1;
        HB(1,N) = 1;
        HB = -1/(2*m) * HB;
    end
end