function PCN(N,dt,a,m,subdivisions,Hobj)
[r,c] = size(Hobj);
HPC = HPCconstrNorig(N,a,m,Hobj);
v = wavefunctionPCN(r,N);

psi1 = zeros(r*N,subdivisions+2);

psi1(:,1) = exponentiate(v,HPC,0,subdivisions);
ddt = dt/subdivisions;
psi1(:,2) = exponentiate(v,HPC,ddt,subdivisions);


for jj = ddt:ddt:dt
    psi1(:,jj/ddt+2) = exponentiate(v,HPC,-i*jj,subdivisions);
end

% v_PC = zeros(r,dt);
% for kk = 1:r
%     for bb = 1:dt
%         v_PC(kk,bb) = abs(psi1((kk-1)*N+1,bb) + psi1((kk-1)*N+2,bb)).^2;
%     end
% end

for ii = 0:ddt:dt
    plot(ii,abs(psi1(0*N+1,ii/ddt+1)+psi1(0*N+2,ii/ddt+1)).^2,'b.');
    hold on
    plot(ii,abs(psi1(1*N+1,ii/ddt+1)+psi1(1*N+2,ii/ddt+1)).^2,'r.');
    hold on
end

% index = find(abs(v_PC) == max(abs(v_PC)));
% v_PC = v_PC/v_PC(index(1,1));
% 
% 
% 
% for nt = 1:subdivisions
%     psi1(:,nt+1) = exponentiate(psi1(:,nt),HPC,-i*dt,subdivisions);
% end
% 
% v_PC = zeros(r);
% for kk = 1:r
%     for bb = 1:r
%         v_PC(kk,bb) = psi1((kk-1)*N+1,bb) + psi1((kk-1)*N+2,bb);
%     end
% end
% 
% T = subdivisions-1;
% for jj = 0:dt
%     plot(dt*[1:T],abs(psi1(jj*N+1,1:T)+psi1(jj*N+2,1:T)).^2);
%     hold on
% end