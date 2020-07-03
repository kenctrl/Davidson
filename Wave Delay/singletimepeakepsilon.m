function singletimepeakepsilon(N,t,a,m,epsilon)
Hnew = Hnewconstr(N,a,m,epsilon);
v = zeros(N,1);
v(1,1) = 1;
for jj = 0:t
    psi = (abs(expm(-i*Hnew*jj)*v)).^2;
    plot(jj,psi(1,1),'b.');
    hold on
end