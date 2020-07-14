function [VN] = PCN(N,t,a,m,Hobj)
HPC = HPCconstr(N,a,m,Hobj);
v = wavefunctionPC(N);
for jj = 0:t
    psi = (abs(expm(-i*HPC*jj)*v)).^2;
    plot(jj,psi(1,1)+psi(2,1),'b.');
    hold on
end
V0 = psi(1,1) + psi(2,1);
figure
for jj = 0:t
    psi = (abs(expm(-i*HPC*jj)*v)).^2;
    plot(jj,psi(N+1,1)+psi(N+2,1),'r.');
    hold on
end
V1 = psi(N+1,1) + psi(N+2,1);