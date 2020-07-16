function [HPC] = HPCconstrN(N,a,m,Hobj)
H = Hconstr(N,a,m);
[r,c] = size(Hobj);
list = sort(eig(Hobj));
H_objnew = (Hobj-(list(1)+list(2))/2*eye(r));
scale = max(eig(H_objnew));
H_objnew = H_objnew/scale*0.5;

% [r,c] = size(Hobj);
% eigs = eig(Hobj);
% eigs = sort(eigs);
% mineig = eigs(1,1);
% mineig2 = eigs(2,1);
% 
% combinedmin = [mineig;mineig2];
% if mineig < 0
%     if mineig2 < 0
%         avg = mean(combinedmin);
%         Hobj = Hobj - avg*eye(r);
%     else
%     Hobj = Hobj + (-mineig - 0.3)*eye(r);
%     end
% end
% 
% if mineig == 0
%     Hobj = Hobj - 0.3*eye(r);
% end
% 
% eigsnew = eig(Hobj);
% maxeig_abs = max(abs(eigsnew));
% Hobj = 0.3/maxeig_abs * Hobj;

% Hobj = 1/2*(0.6/(eigs(r,1)-eigs(1,1)) * (Hobj - (eigs(1,1)+eigs(r,1))/2 * eye(r,c)) + 0.2*eye(r,c));

HPC = zeros(r*N,c*N);
for ii = 1:r
    for jj = 1:c
        if ii == jj
            HPC((ii-1)*N+1:ii*N,(ii-1)*N+1:ii*N) = H;
        end
        HPC((ii-1)*N+1:(ii-1)*N+r,(jj-1)*N+1:(jj-1)*N+r) = HPC((ii-1)*N+1:(ii-1)*N+r,(jj-1)*N+1:(jj-1)*N+r) + 1/2*ones(r) * H_objnew(ii,jj);
    end
end

% function [HPC] = HPCconstrN(N,a,m,Hobj)
% [r,c] = size(Hobj);
% H = Hconstr(N,a,m);
% eigs = eig(Hobj);
% eigs = sort(eigs);
% Hobj = 1/2*(0.6/(eigs(r,1)-eigs(1,1)) * (Hobj - (eigs(1,1)+eigs(r,1))/2 * eye(r)) + 0.299*eye(r,c));
% 
% HPC = zeros(r*N,c*N);
% for ii = 1:r
%     for jj = 1:c
%         if ii == jj
%             HPC((ii-1)*N+1:ii*N,(ii-1)*N+1:ii*N) = H;
%         end
%         HPC((ii-1)*N+1:(ii-1)*N+2,(jj-1)*N+1:(jj-1)*N+2) = HPC((ii-1)*N+1:(ii-1)*N+2,(jj-1)*N+1:(jj-1)*N+2) + 1/2*ones(2) * Hobj(ii,jj);
%     end
% end