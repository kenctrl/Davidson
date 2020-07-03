function p = momentum(N)
p = ones(N,1);
for jj = 1:N-1
    p(jj+1,1) = 2*jj*pi/N;
end