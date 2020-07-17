function [HPC_A,HPC_B,Hobjmatrix] = Htrotterconstr(N,m,Hobj)
HB = zeros(N);
HA = zeros(N);

for kk = 2:2:N-1
    HB(kk,kk+1) = 1;
    HB(kk+1,kk) = 1;
end
if (mod(N,2) == 0)
    HB(N,1) = 1;
    HB(1,N) = 1;
end
HB = -1/(2*m) * HB;

for kk = 1:2:N
    HA(kk,kk+1) = 1;
    HA(kk+1,kk) = 1;
end
if (mod(N,2) == 1)
    HA(N,1) = 1;
    HA(1,N) = 1;
end
HA = -1/(2*m) * HA;

[r,c] = size(Hobj);
list = sort(eig(Hobj));
H_objnew = (Hobj-(list(1)+list(2))/2*eye(r));
scale = max(eig(H_objnew));
H_objnew = H_objnew/scale*0.5;

Hobjmatrix = zeros(r*N,c*N);
for ii = 1:r
    for jj = 1:c
        if ii == jj
            HPC_A((ii-1)*N+1:ii*N,(ii-1)*N+1:ii*N) = HA;
            HPC_B((ii-1)*N+1:ii*N,(ii-1)*N+1:ii*N) = HB;
        end
        Hobjmatrix((ii-1)*N+1:(ii-1)*N+r,(jj-1)*N+1:(jj-1)*N+r) = 1/2*ones(r) * H_objnew(ii,jj);
    end
end
end
