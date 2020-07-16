function [HPC] = HPCconstrN(N,a,m,Hobj)
H = Hconstrwithoutdiag(N,a,m); %Initialize without diagonal
[r,c] = size(Hobj);
list = sort(eig(Hobj));
H_objnew = (Hobj-(list(1)+list(2))/2*eye(r));
scale = max(eig(H_objnew));
H_objnew = H_objnew/scale*0.5;

HPC = zeros(r*N,c*N);
for ii = 1:r
    for jj = 1:c
        if ii == jj
            HPC((ii-1)*N+1:ii*N,(ii-1)*N+1:ii*N) = H;
        end
        HPC((ii-1)*N+1:(ii-1)*N+r,(jj-1)*N+1:(jj-1)*N+r) = HPC((ii-1)*N+1:(ii-1)*N+r,(jj-1)*N+1:(jj-1)*N+r) + 1/2*ones(r) * H_objnew(ii,jj);
    end
end