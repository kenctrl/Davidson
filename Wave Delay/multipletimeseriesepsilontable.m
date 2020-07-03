function edgetable = multipletimeseriesepsilontable(N,t,a,m)

edgetable = zeros(11,11);
for epsilon = 0:0.1:1
    Hnew = Hnewconstr(N,a,m,epsilon);
    v = zeros(N,1);
    v(1,1) = 1;
    for jj = 0:t
        x = zeros(N/2,1);
        psi = (abs(expm(-i*Hnew*jj)*v)).^2;
        for ii = 0:N/2 - 1
            if psi(ii+1,1) < 0.0001
                x(ii+1,1) = ii;
            end
        end
%         for kk = 0:N/2 - 2
%             if x(kk+1,1) > 0 && x(kk+2,1) == 0
%                x(kk+1,1) = 0;
%             else
               edgetable(jj+1,round(epsilon*10) + 1) = min(x(x>0));
%             end
%         end
    end
end