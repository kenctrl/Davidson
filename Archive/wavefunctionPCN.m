function [v,vobj_initial] = wavefunctionPCN(r,N)
v = zeros(r*N,1);
vobj_initial = zeros(r,1);
for ii = 1:r
    r = rand(1) + rand(1)*i;
    v((ii-1)*N+1,1) = r;
    v((ii-1)*N+2,1) = r;
    vobj_initial(ii,1) = v((ii-1)*N+1,1);
end