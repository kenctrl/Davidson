function [v_PCall,v_PC,v_exact,initial_overlap,final_overlap,final_overlapall] = PCgeneralrerun(N,t,nt,a,m,subdivisions,Hobj,nrepeats)
%Run PC
final_overlapall = zeros(nrepeats,1);
hh = 0;
[v_PC,v_exact,initial_overlap,final_overlap,final_overlapall] = PCgeneral(N,t,nt,a,m,subdivisions,Hobj,0,hh,final_overlapall);
[r,~] = size(Hobj);
%Give option to rerun for better accuracy
% prompt = 'Rerun with v_input = psi(:,nt)? [Y]: ';
% str = input(prompt,'s');
% [r,~] = size(Hobj);
% while str == 'Y'
%     v_PCnew = zeros(r*N,1);
%     for ii = 1:r
%         v_PCnew((ii-1)*N+1,1) = v_PC(ii);
%     end
%     [v_PC,v_exact,initial_overlap,final_overlap] = PCgeneral(N,t,nt,a,m,subdivisions,Hobj,v_PCnew)
%     prompt = 'Rerun with v_input = psi(:,nt)? [Y]: ';
%     str = input(prompt,'s');
% end

v_PCall = zeros(r*N,nrepeats);
for ii = 1:r
    v_PCall((ii-1)*N+1,1) = v_PC(ii);
end
for hh = 1:nrepeats-1
    [v_PC,v_exact,initial_overlap,final_overlap,final_overlapall] = PCgeneral(N,t,nt,a,m,subdivisions,Hobj,v_PCall(:,hh),hh,final_overlapall);
    for ii = 1:r
        v_PCall((ii-1)*N+1,hh+1) = v_PC(ii);
    end
end
figure
plot(1:nrepeats,log(1-final_overlap),'b.');