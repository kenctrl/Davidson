function [HPC] = HPCconstrN(N,a,m,Hobj)
H = Hconstr(N,a,m);
eigs = eig(Hobj);
Hobj = 0.6/(eigs(2,1)-eigs(1,1)) * (Hobj - (eigs(1,1)+eigs(2,1))/2 * eye(2));

H1 = H;
H1(1:2,1:2) = H1(1:2,1:2) + 1/2*ones(2) * Hobj(1,1);
H2 = H;
H2(1:2,1:2) = H2(1:2,1:2) + 1/2*ones(2) * Hobj(2,2);
Z = zeros(N);
Z1 = Z;
Z1(1:2,1:2) = Z1(1:2,1:2) + 1/2*ones(2) * Hobj(1,2);
Z2 = Z;
Z2(1:2,1:2) = Z2(1:2,1:2) + 1/2*ones(2) * Hobj(2,1);
HPC = [H1 Z1; Z2 H2];