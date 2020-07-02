function Hnew = Hnewconstr(N,a,m,epsilon)
% Ignore Planck's constant
Hnew = zeros(N);
for ii = 1:N
    Hnew(ii,ii) = -2;
end
for ii = 1:N-1
    Hnew(ii+1,ii) = 1;
    Hnew(ii,ii+1) = 1;
end
Hnew(N,1) = 1;
Hnew(1,N) = 1;
for ii = 1:N
    for jj = 1:N
        Hnew(ii,jj) = -1/2 * 1/((m + epsilon * (min(ii,N-ii) + min(jj,N-jj))/2) * a^2) * Hnew(ii,jj); %a^2 may not be coded in correctly
    end
end