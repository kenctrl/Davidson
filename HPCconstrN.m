function [HPC] = HPCconstrN(N,a,m,Hobj)
H = Hconstr(N,a,m);
[r,c] = size(Hobj);
eigs = eig(Hobj);
eigs = sort(eigs);
Hobj = 0.6/(eigs(r,1)-eigs(1,1)) * (Hobj - (eigs(1,1)+eigs(r,1))/2 * eye(r,c));

HPC = zeros(r*N,c*N);
for ii = 1:r
    for jj = 1:c
        if ii == jj
            HPC((ii-1)*N+1:ii*N,(ii-1)*N+1:ii*N) = H;
        end
        HPC((ii-1)*N+1:(ii-1)*N+2,(jj-1)*N+1:(jj-1)*N+2) = HPC((ii-1)*N+1:(ii-1)*N+2,(jj-1)*N+1:(jj-1)*N+2) + 1/2*ones(2) * Hobj(ii,jj);
    end
end