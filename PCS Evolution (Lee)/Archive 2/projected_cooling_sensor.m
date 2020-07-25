clear all
close all

format long

L = 20;
D_object = 10;
maxeig = 0.8;
nrepeat = 40;
r = [0:L-1];

H_reservoir = ...
    - sparse(mod(r+1,L)+1,r+1,0.5) ...
    - sparse(mod(r-1,L)+1,r+1,0.5);

H_object = rand(D_object,D_object) + i*rand(D_object,D_object);
H_object = 0.5*(H_object + H_object');

list = sort(eig(H_object));
H_object_new = H_object-list(1)*eye(D_object);
scale = max(eig(H_object_new));
H_object_new = H_object_new/scale*maxeig;

H_apex = sparse(D_object*L,D_object*L);
for ii = 0:D_object-1 
    H_apex(ii*L+[0:L-1]+1,ii*L+[0:L-1]+1) = H_reservoir;
end
for jj = 0:D_object-1
    for ii = 0:D_object-1
        H_apex(ii*L+1,jj*L+1) = H_apex(ii*L+1,jj*L+1) + H_object_new(ii+1,jj+1)/2.0;
        H_apex(ii*L+2,jj*L+1) = H_apex(ii*L+2,jj*L+1) + H_object_new(ii+1,jj+1)/2.0;
        H_apex(ii*L+1,jj*L+2) = H_apex(ii*L+1,jj*L+2) + H_object_new(ii+1,jj+1)/2.0;
        H_apex(ii*L+2,jj*L+2) = H_apex(ii*L+2,jj*L+2) + H_object_new(ii+1,jj+1)/2.0;
    end
end

[vv,dd] = eig(H_object);
[ee,ord] = sort(diag(dd));
index = find(abs(vv(:,ord(1))) == max(abs(vv(:,ord(1)))));
vv_exact_normalized = vv(:,ord(1));
vv_exact = vv(:,ord(1))/vv(index,ord(1));

vobject_init = zeros(D_object,1);
v_init = zeros(D_object*L,1);

for ii = 0:D_object-1
    vobject_init(ii+1) = (rand-0.5) + i*(rand-0.5);
end

%%%%%
% vobject_init = 0.5*vobject_init + 0.5*vv_exact_normalized;
%%%%%
vobject_init = vobject_init/sqrt(vobject_init'*vobject_init);

vobject_init_save = vobject_init;
index = find(abs(vobject_init) == max(abs(vobject_init))); 

'initial state'   
[vobject_init/vobject_init(index) vv_exact]

dt = 0.1;
Lt = floor(L/dt*15.0);
Lt0 = 0;
s0 = -7;
Lt1 = floor(Lt/10);
s1 = -1;
Lt2 = floor(2*Lt/10);
s2 = -0.2;
Lt3 = floor(3*Lt/10);
s3 = -0.1;
Lt4 = floor(4*Lt/10);
s4 = -0.0;
Lt5 = floor(5*Lt/10);
s5 = -0.0;
Lt6 = floor(6*Lt/10);
s6 = -0.0;
Lt7 = floor(7*Lt/10);
s7 = -0.1;
Lt8 = floor(8*Lt/10);
s8 = -0.2;
Lt9 = floor(9*Lt/10);
s9 = -1;
Lt10 = Lt;
s10 = -7;

for ntrial = 1:nrepeat
    
    H = H_apex;
    shift = -7.0;
    for ii = 0:D_object-1
        H(ii*L+1,ii*L+1) = H_apex(ii*L+1,ii*L+1) + shift/2.0;
        H(ii*L+2,ii*L+1) = H_apex(ii*L+2,ii*L+1) + shift/2.0;
        H(ii*L+1,ii*L+2) = H_apex(ii*L+1,ii*L+2) + shift/2.0;
        H(ii*L+2,ii*L+2) = H_apex(ii*L+2,ii*L+2) + shift/2.0;
    end
    
    for ii = 0:D_object-1
        v_init(ii*L+1) = vobject_init(ii+1,1)/sqrt(2);
        v_init(ii*L+2) = vobject_init(ii+1,1)/sqrt(2);       
    end
    psi1(:,1) = exponentiate(v_init,H,-i*dt,10);
    
    for nt = 1:Lt
        H = H_apex;
 
        if (nt < Lt1)
            shift = s0*(Lt1-nt)/(Lt1-Lt0)+s1*(nt-Lt0)/(Lt1-Lt0);
        elseif (nt < Lt2)
            shift = s1*(Lt2-nt)/(Lt2-Lt1)+s2*(nt-Lt1)/(Lt2-Lt1);
        elseif (nt < Lt3)
            shift = s2*(Lt3-nt)/(Lt3-Lt2)+s3*(nt-Lt2)/(Lt3-Lt2);
        elseif (nt < Lt4)
            shift = s3*(Lt4-nt)/(Lt4-Lt3)+s4*(nt-Lt3)/(Lt4-Lt3);
        elseif (nt < Lt5)
            shift = s4*(Lt5-nt)/(Lt5-Lt4)+s5*(nt-Lt4)/(Lt5-Lt4);
        elseif (nt < Lt6)
            shift = s5*(Lt6-nt)/(Lt6-Lt5)+s6*(nt-Lt5)/(Lt6-Lt5);
        elseif (nt < Lt7)
            shift = s6*(Lt7-nt)/(Lt7-Lt6)+s7*(nt-Lt6)/(Lt7-Lt6);
        elseif (nt < Lt8)
            shift = s7*(Lt8-nt)/(Lt8-Lt7)+s8*(nt-Lt7)/(Lt8-Lt7);
        elseif (nt < Lt9)
            shift = s8*(Lt9-nt)/(Lt9-Lt8)+s9*(nt-Lt8)/(Lt9-Lt8);
        else
            shift = s9*(Lt10-nt)/(Lt10-Lt9)+s10*(nt-Lt9)/(Lt10-Lt9);           
        end
        
        for ii = 0:D_object-1
            H(ii*L+1,ii*L+1) = H_apex(ii*L+1,ii*L+1) + shift/2.0;
            H(ii*L+2,ii*L+1) = H_apex(ii*L+2,ii*L+1) + shift/2.0;
            H(ii*L+1,ii*L+2) = H_apex(ii*L+1,ii*L+2) + shift/2.0;
            H(ii*L+2,ii*L+2) = H_apex(ii*L+2,ii*L+2) + shift/2.0;
        end
        psi1(:,nt+1) = exponentiate(psi1(:,nt),H,-i*dt,10);
    end
    
    figure(ntrial)
    hold on
    for ii = 0:D_object-1
        plot(dt*[1:Lt],log(abs(psi1(ii*L+1,1:Lt)+psi1(ii*L+2,1:Lt)).^2/2))
    end
    hold off
        
    jj = 0;
    for ii = 0:D_object-1
        v_PC(ii+1,1) = (psi1(ii*L+mod(2*jj,L)+1,Lt) ...
            + psi1(ii*L+mod(2*jj+1,L)+1,Lt))/sqrt(2.0);
    end
    
    ntrial
    index = find(abs(v_PC) == max(abs(v_PC)));  
    squared_norm(ntrial,1) = v_PC'*v_PC
    [v_PC/v_PC(index) vv_exact]
    
    initial_overlap(ntrial,1) = (abs(vv_exact'*vobject_init))^2 ...
        /((vv_exact'*vv_exact)*(vobject_init'*vobject_init));
    final_overlap(ntrial,1) = (abs(v_PC'*vv_exact))^2 ...
        /((vv_exact'*vv_exact)*(v_PC'*v_PC));    
    
    initial_overlap(ntrial,1)
    final_overlap(ntrial,1)

    norm_initial_overlap(ntrial,1) = (abs(vv_exact'*vobject_init))^2 ...
        /(vv_exact'*vv_exact);    
    norm_final_overlap(ntrial,1) = (abs(v_PC'*vv_exact))^2/(vv_exact'*vv_exact);

    norm_initial_overlap(ntrial,1)
    norm_final_overlap(ntrial,1)
    
    vobject_init = v_PC;
    
end

"initial"
initial_overlap(1)
"overlaps"
final_overlap

figure(nrepeat+1)
plot(log(1-final_overlap))

squared_norm

"H_object_new eigenvalues"
eig(H_object_new)

