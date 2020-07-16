function [v_PC,v_exact] = PCN(N,dt,a,m,subdivisions,Hobj)
[r,c] = size(Hobj);
HPC = HPCconstrN(N,a,m,Hobj);
v = wavefunctionPCN(r,N);

psi1 = zeros(r*N);
psi1(:,1) = exponentiate(v,HPC,-i*dt,subdivisions);

v_PC = zeros(r,1);
for kk = 1:r
    v_PC(kk,1) = psi1((kk-1)*N+1,1) + psi1((kk-1)*N+2,1);
end
index = find(abs(v_PC) == max(abs(v_PC)));
v_PC = v_PC/v_PC(index(1,1));

[eigenvectors, diagonalized_matrix] = eig(Hobj);
% eigenvalues = diag(diagonalized_matrix);
% [sorted_list, ordering] = eigenvalues;
% eigenvectors(:,ordering(1));
v_exact = eigenvectors(:,1);
index = find(abs(v_exact) == max(abs(v_exact)));
v_exact = v_exact/v_exact(index(1,1));

% v_exact = eig(Hobj);
% index = find(abs(v_exact) == max(abs(v_exact)));
% v_exact = v_exact/v_exact(index(1,1));