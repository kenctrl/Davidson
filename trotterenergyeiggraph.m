function trotterenergyeiggraph(N,m,dt)
[HA,HB] = trotterconstr(N,m);
evoleff = expm(-i*HA*dt) * expm(-i*HB*dt);
E = eig(logm(evoleff)/(-i*dt));
plot(real(E),'b.');
% hold on
% for jj = 0:0.1:dt
%     plot(jj,real(log(cos(jj) - i*sin(jj))/(-i*jj)),'r.')
%     hold on
%     plot(jj,real(log(cos(jj) + i*sin(jj))/(-i*jj)),'g.')
%     hold on
% end