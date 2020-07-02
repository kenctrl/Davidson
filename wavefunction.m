%Wavefunction
function v = wavefunction(N)
v = ones(N,N);
for jj = 1:N
    for kk = 1:N
        v(jj,kk) = 1/sqrt(N) * exp(i*(jj-1)*(kk-1)*2*pi/N);
    end
end