function edge = multipletimeseriesepsilon(N,t,a,m,epsilon)
Hnew = Hnewconstr(N,a,m,epsilon);
v = zeros(N,1);
v(1,1) = 1;
edge = zeros(t+1,1);
for j = 0:t
    x = zeros(N/2,1);
    psi = (abs(expm(-i*Hnew*j)*v)).^2;
    for ii = 0:N/2 - 1
        if psi(ii+1,1) < 0.0001
            x(ii+1,1) = ii;
        end
    end
    edge(j+1,1) = min(x(x>0));
end