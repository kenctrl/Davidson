function p = momentum(N)
p = ones(N,1);
for j = 1:N-1
    p(j+1,1) = 2*j*pi/N;
end