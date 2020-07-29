L = 100;
D_object = 30;
maxeig = 0.5;
nrepeat = 30;
r = [0:L-1];
dt = 0.5;
Lt = floor(L/dt*0.8);
subdivisions = 10;

H_reservoir = - sparse(mod(r+1,L)+1,r+1,0.5) - sparse(mod(r-1,L)+1,r+1,0.5);
H_object = rand(D_object,D_object) + i*rand(D_object,D_object);
H_object = 0.5*(H_object + H_object');
%  H_object = [1 0; 0 -1];

list = sort(eig(H_object));
H_object_new = H_object-(list(1)+list(2))/2*eye(D_object);
scale = max(eig(H_object_new));
H_object_new = H_object_new/scale*maxeig;

H = sparse(D_object*L,D_object*L);
for ii = 0:D_object-1 
    H(ii*L+[0:L-1]+1,ii*L+[0:L-1]+1) = H_reservoir;
end
for jj = 0:D_object-1
    for ii = 0:D_object-1
        H(ii*L+1,jj*L+1) = H(ii*L+1,jj*L+1) + H_object_new(ii+1,jj+1)/2.0;
        H(ii*L+2,jj*L+1) = H(ii*L+2,jj*L+1) + H_object_new(ii+1,jj+1)/2.0;
        H(ii*L+1,jj*L+2) = H(ii*L+1,jj*L+2) + H_object_new(ii+1,jj+1)/2.0;
        H(ii*L+2,jj*L+2) = H(ii*L+2,jj*L+2) + H_object_new(ii+1,jj+1)/2.0;
    end
end

[vv,dd] = eig(H_object);
[ee,ord] = sort(diag(dd));
index = find(abs(vv(:,ord(1))) == max(abs(vv(:,ord(1)))));
vv_exact = vv(:,ord(1))/vv(index,ord(1));

vobject_init = zeros(D_object,1);
v_init = zeros(D_object*L,1);

%Algorithm
for ii = 0:D_object-1
    vobject_init(ii+1) = (rand-0.5) + i*(rand-0.5);
end

for ntrial = 1:nrepeat
    for ii = 0:D_object-1
        v_init(ii*L+1) = vobject_init(ii+1,1);
        v_init(ii*L+2) = vobject_init(ii+1,1);       
    end
    psi1(:,1) = exponentiate_pcs(v_init,H,-i*dt,subdivisions);    

    for nt = 1:Lt
        psi1(:,nt+1) = exponentiate_pcs(psi1(:,nt),H,-i*dt,subdivisions);
    end

    figure(ntrial)
    hold on
    for ii = 0:D_object-1
        plot(dt*[1:Lt],log(abs(psi1(ii*L+1,1:Lt)+psi1(ii*L+2,1:Lt)).^2))
    end
    xlabel('{\it t}')
    ylabel('ln({\it|v_{PCS} |^2})','FontSize',14)
    title('Projected Cooling Sensor for Arbitrary 2x2','FontSize',14)
    legend('State 1','State 2','FontSize',14)
    hold off
    
    for ii = 0:D_object-1
        v_PC(ii+1,1) = psi1(ii*L+1,Lt) + psi1(ii*L+2,Lt);
    end
    index = find(abs(v_PC) == max(abs(v_PC)));
    
    ntrial
    v_PC = v_PC/v_PC(index);
    squared_norm(ntrial,1) = v_PC'*v_PC;
    [v_PC vv_exact]
    
    initial_overlap(ntrial,1) = (abs(vv_exact'*vobject_init))^2/((vv_exact'*vv_exact)*(vobject_init'*vobject_init));
    final_overlap(ntrial,1) = (abs(v_PC'*vv_exact))^2/((vv_exact'*vv_exact)*(v_PC'*v_PC));
    
    initial_overlap(ntrial,1)
    final_overlap(ntrial,1)
    
    vobject_init = v_PC;
end

"initial"
initial_overlap(1)
"overlaps"
final_overlap

figure(nrepeat+1)
% arb = log(1-final_overlap);
% arb(3:end) = -Inf;
% plot(arb)
plot(log(1-final_overlap))
xlabel('Iteration','FontSize',14)
ylabel('ln(1-{\itO})','FontSize',14)
title('Multiple Iterations of Projected Cooling Sensor for Arbitrary 30\times30,{\it L} = 100','FontSize',12)
squared_norm
eig(H_object_new)