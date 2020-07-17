function H = Hconstrwithoutdiag(N,a,m)
% Ignore Planck's constant
H = zeros(N);
for ii = 1:N-1
    H(ii+1,ii) = 1;
    H(ii,ii+1) = 1;
end
H(N,1) = 1;
H(1,N) = 1;
H = -1/(2*m*a^2) * H;
end