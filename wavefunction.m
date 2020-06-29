%Wavefunction
function v = wavefunction(N)
v = ones(N,N);
for j = 1:N
    for k = 1:N
        v(j,k) = 1/sqrt(N) * exp(i*(j-1)*(k-1)*2*pi/N);
    end
end