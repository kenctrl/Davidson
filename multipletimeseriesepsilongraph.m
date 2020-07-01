function multipletimeseriesepsilongraph(N,t,a,m,epsilon)
Hnew = Hnewconstr(N,a,m,epsilon);
v = zeros(N,1);
v(1,1) = 1;
for jj = 0:t
    plot((abs(expm(-i*Hnew*jj)*v)).^2 + 0.2*jj);
    hold on
end