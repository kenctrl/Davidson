function [v] = wavefunctionPC(N)
v = zeros(2*N,1);
v(1,1) = rand(1) + rand(1)*i;
v(N+1,1) = rand(1) + rand(1)*i;
end