clear all
format long g


L = 20;

numeigs = 10

cutoff = 100;
atovera = 1./300*cutoff;
mnu = 938.92/cutoff;

opts.isreal = 1;
opts.issym = 1;
opts.maxiter = 3000;

c_n1_n2 = +0.0001;

r = [0:L^1-1];
nucleon1z = mod(r,L);

% position vectors are measured relative to the hyperon

V_n1_n2 = c_n1_n2*(nucleon1z == 0);
H_n1_n2 = spdiags(V_n1_n2',0,L^1,L^1);

D_n = 2/(2.*mnu);

H_nucleon1 = sparse(r+1, r+1, D_n);

%%%%%%%%%%%%%
%'nucleon1_zp'
r_nucleon1_zp = 0 ...
    +   mod(nucleon1z+1,L);
H_nucleon1 = H_nucleon1 + sparse(r_nucleon1_zp+1,r+1,-1/(2.*mnu));
clear r_nucleon1_zp;

%'nucleon1_zm'
r_nucleon1_zm = 0 ...
    +   mod(nucleon1z-1,L);
H_nucleon1 = H_nucleon1 + sparse(r_nucleon1_zm+1,r+1,-1/(2.*mnu));
clear r_nucleon1_zm;

%%%%%%%%%%%%%%%

H = H_nucleon1 + H_n1_n2;

%%%%%%%%%%%%%%%

[vv,dd] = eigs(H,numeigs,'sr');

energ = diag(dd);
[sorted,ord] = sort(real(energ));
vv = vv(:,ord);
energies_H = energ(ord)*cutoff

plot(abs(vv(mod([-L/2:L/2],L)+1,1)))
