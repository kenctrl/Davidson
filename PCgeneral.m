function [v_PC,v_exact,initial_overlap,final_overlap] = PCgeneral(N,t,nt,a,m,subdivisions,Hobj,v_input)
[r,~] = size(Hobj);

%Construct Hamiltonian
HPC = HPCconstrN(N,a,m,Hobj);

%Construct or initialize wave function & find initial PC eigenstate
if v_input == 0
    [v,vobj_initial] = wavefunctionPCN(r,N);
else
    v = v_input;
    vobj_initial = zeros(r,1);
    for jj = 1:r
        vobj_initial(jj,1) = v_input((jj-1)*N+1,1);
    end
end

%Run PC at 0
psi1 = zeros(r*N,nt);
psi1(:,1) = exponentiate(v,HPC,0,subdivisions);

%Run PC until nt+1
dt = t/nt;
for jj = 1:nt-1
    psi1(:,jj+1) = exponentiate(psi1(:,jj),HPC,-i*dt,subdivisions);
end

%Plot time evolution of each state
for ii = 0:dt:t-dt
    plot(ii,log(abs(psi1(0*N+1,ii/dt+1)+psi1(0*N+2,ii/dt+1)).^2),'b.');
    hold on
    plot(ii,log(abs(psi1(1*N+1,ii/dt+1)+psi1(1*N+2,ii/dt+1)).^2),'r.');
    hold on
end

%Find bound eigenstate calculated by PC
v_PC = zeros(r,1);
for kk = 1:r
    v_PC(kk,1) = psi1((kk-1)*N+1,nt) + psi1((kk-1)*N+2,nt);
end
index = find(abs(v_PC) == max(abs(v_PC)));
v_PC = v_PC/v_PC(index(1));

%Calculate exact bound eigenstate from input Hamiltonian
[eigHobj, diagHobj] = eig(Hobj);
[~,ord] = sort(diag(diagHobj));
index = find(abs(eigHobj(:,ord(1))) == max(abs(eigHobj(:,ord(1)))));
v_exact = eigHobj(:,ord(1))/eigHobj(index,ord(1));
if size(v_exact,2) ~= size(v_PC,2)
    v_exact = v_exact(:,1);
end

%Find overlap between initial PC eigenstate and exact eigenstate
initial_overlap = abs(v_exact'*vobj_initial)/(sqrt(v_exact'*v_exact)*sqrt(vobj_initial'*vobj_initial));

%Find overlap between final PC eigenstate and exact eigenstate
final_overlap = abs(v_PC'*v_exact)/(sqrt(v_exact'*v_exact)*sqrt(v_PC'*v_PC));