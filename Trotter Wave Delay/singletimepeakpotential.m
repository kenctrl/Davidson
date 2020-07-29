function psi_all = singletimepeakpotential(N,t,a,m,potential)
Hv = Hconstr(N,a,m);
Hv(1,1) = Hv(1,1) + potential;
v = zeros(N,1);
v(1,1) = 1;

psi_all = zeros(N,t+1);
for jj = 0:10*t
    psi_all(:,jj+1) = (abs(expm(-i*Hv*jj/10)*v)).^2;
    hold on
end

plot([0:0.1:t],psi_all(1,:));
xlabel('{\itt}','FontSize', 16)
ylabel('||\psi(t)\rangle|^2 at Initial Position','FontSize', 16)