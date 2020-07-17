function [v_PC] = singletimepeakPC(N,t,a,m,Hobj)
HPC = HPCconstr(N,a,m,Hobj);
v = wavefunctionPC(N);
for jj = 0:t
    psi = (abs(expm(-i*HPC*jj)*v)).^2;
    plot(jj,psi(1,1)+psi(2,1),'b.');
    hold on
    plot(jj,psi(N+1,1)+psi(N+2,1),'r.');
    hold on
end
psi1 = expm(-i*HPC*t)*v;
V0 = psi1(1,1) + psi1(2,1);
V1 = psi1(N+1,1) + psi1(N+2,1);
v_PC = [V0;V1];
index = find(abs(v_PC) == max(abs(v_PC)));
v_PC = v_PC/v_PC(index);