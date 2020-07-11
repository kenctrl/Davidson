function [vg] = trottergroupvelocityformula(m,t)
vg = 2*sin(t/(2*m))/t;
end

