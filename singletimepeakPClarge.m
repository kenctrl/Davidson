function [psi1,V0n,V1n] = singletimepeakPClarge(N,dt,a,m,subdivisions,Hobj)
H = HPCconstr(N,a,m,Hobj);
v = wavefunctionPC(N);

psi1 = zeros(2*N);
psi1(:,1) = exponentiate(v,H,-i*dt,subdivisions);

for jj = 1:N-1
    psi1(:,jj+1) = exponentiate(psi1(:,jj),H,-i*dt,subdivisions);
end

V0 = psi1(1,1) + psi1(2,1);
V1 = psi1(N+1,1) + psi1(N+2,1);

if abs(V0) >= abs(V1)
    V0n = V0;
    V1n = V1/V0;
else
    V0n = V0/V1;
    V1n = V1;
end