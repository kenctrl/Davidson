Hnew = zeros(size(H));
for ii = 1:N
    for jj = 1:N
        if ii == jj
            Hnew(ii,jj) = 1/(1 + epsilon*min(ii,N - ii)) * H(ii,jj);
        elseif ii == jj + 1
            Hnew(ii,jj) = 1/(1 + epsilon*min(ii - 1,N + 1 - ii)) * H(ii,jj);
        elseif ii == jj - 1
            Hnew(ii,jj) = 1/(1 + epsilon*min(ii,N - ii)) * H(ii,jj);
        else
            Hnew(ii,jj) = H(ii,jj);
        end
    end
end