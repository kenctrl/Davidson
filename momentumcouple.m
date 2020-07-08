function [Kp,Kpphase,Kpeven,Kpodd] = momentumcouple(N)
K = zeros(N,1);

for jj = -N/2:N/2-1
    K(jj + N/2 + 1,1) = exp(i*(jj + N/2)*2*pi*jj*(1/N));
end
K = 1/sqrt(N) * K;

Kphase = K;
for nn = 1:N
    if (mod(nn,2) == 0)
        Kphase(nn,1) = -Kphase(nn,1);
    end
end

Kp = K(N/2+1:end,1);
Kpphase = Kphase(N/2+1:end,1);

Kpeven = 1/sqrt(2) * (Kp + Kpphase);
Kpodd = 1/sqrt(2) * (Kp - Kpphase);