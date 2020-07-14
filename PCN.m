function [v_PC] = PCN(N,dt,a,m,subdivisions,Hobj)
[r,c] = size(Hobj);
HPC = HPCconstrN(N,a,m,Hobj);
v = wavefunctionPCN(r,N);

psi1 = zeros(r*N);
psi1(:,1) = exponentiate(v,HPC,-i*dt,subdivisions);

for jj = 1:N-1
    psi1(:,jj+1) = exponentiate(psi1(:,jj),HPC,-i*dt,subdivisions);
end

v_PC = zeros(r,1);
for kk = 1:r
    v_PC(kk,1) = psi1((kk-1)*N+1,1) + psi1((kk-1)*N+2,1);
end
index = find(abs(v_PC) == max(abs(v_PC)));
v_PC = v_PC/v_PC(index);