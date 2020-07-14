function [v] = wavefunctionPCN(r,N)
v = zeros(r*N,1);
for ii = 1:r
    v((ii-1)*N+1,1) = rand(1) + rand(1)*i;
end