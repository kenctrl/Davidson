function [HPC] = HPCconstrNone(N,a,m,Hobj)
[r,c] = size(Hobj);
H = Hconstr(N,a,m);
HPC = zeros(r*N,c*N);
for ii = 1:r
    for jj = 1:c
        if ii == jj
            HPC((ii-1)*N+1:ii*N,(ii-1)*N+1:ii*N) = H;
        end
        HPC((ii-1)*N+1:(ii-1)*N+r,(jj-1)*N+1:(jj-1)*N+r) = HPC((ii-1)*N+1:(ii-1)*N+r,(jj-1)*N+1:(jj-1)*N+r) + 1/2*ones(r) * Hobj(ii,jj);
    end
end