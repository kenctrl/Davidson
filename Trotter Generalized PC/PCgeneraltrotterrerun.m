function [v_PC,v_exact,initial_overlap,final_overlap] = PCgeneraltrotterrerun(N,t,nt,a,m,subdivisions,Hobj,v_input)
%Run PC
[v_PC,v_exact,initial_overlap,final_overlap] = PCgeneraltrotter(N,t,nt,a,m,subdivisions,Hobj,v_input)

%Give option to rerun for better accuracy
prompt = 'Rerun with v_input = psi(:,nt)? [Y]: ';
str = input(prompt,'s');
[r,~] = size(Hobj);
while str == 'Y'
    v_PCnew = zeros(r*N,1);
    for ii = 1:r
        v_PCnew((ii-1)*N+1,1) = v_PC(ii);
    end
    [v_PC,v_exact,initial_overlap,final_overlap] = PCgeneraltrotter(N,t,nt,a,m,subdivisions,Hobj,v_PCnew)
    prompt = 'Rerun with v_input = psi(:,nt)? [Y]: ';
    str = input(prompt,'s');
end