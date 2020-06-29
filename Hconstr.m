function H = Hconstr(N,a,m)
% Ignore Planck's constant
H = zeros(N);
for i = 1:N
    H(i,i) = -2;
end
for i = 1:N-1
    H(i+1,i) = 1;
    H(i,i+1) = 1;
end
H(N,1) = 1;
H(1,N) = 1;
H = -1/(2*m*a^2) * H;
end