function trottergroupvelocitydoublederivative(N,t,m)
[eig01,eig02] = trottereig(0,m,t);
for kp = 0:2*pi/N:pi
    [eig1,eig2] = trottereig(kp,m,1);
    if eig2 > eig1 && kp < pi/2
        plot(kp,eig1-eig01,'b.');
        hold on
%         plot(kp+pi,eig2+eig01,'b.');
%         hold on
    elseif eig1 > eig2 && kp < pi/2
        plot(kp,eig2-eig01,'b.');
        hold on
%         plot(kp+pi,eig1+eig01,'b.');
%         hold on
    elseif eig2 > eig1 && kp >= pi/2
        plot(kp,eig2-eig01,'b.');
        hold on
%         plot(kp+pi,eig1+eig01,'b.');
%         hold on
    elseif eig1 > eig2 && kp >= pi/2
        plot(kp,eig1-eig01,'b.');
        hold on
%         plot(kp+pi,eig2+eig01,'b.');
%         hold on
    end
    plot(kp,2*sin(t/m)/(t+t*cos(t/m))*((kp)^2)/2,'r.')
    hold on
end