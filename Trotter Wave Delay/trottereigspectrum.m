function trottereigspectrum(N,m)
for kp = 0:2*pi/N:pi
    [eig1,eig2] = trottereig(kp,m,1);
    if eig2 > eig1 && kp < pi/2
        plot(kp,eig1,'b.');
        hold on
        plot(kp+pi,eig2,'b.');
        hold on
    elseif eig1 > eig2 && kp < pi/2
        plot(kp,eig2,'b.');
        hold on
        plot(kp+pi,eig1,'b.');
        hold on
    elseif eig2 > eig1 && kp >= pi/2
        plot(kp,eig2,'b.');
        hold on
        plot(kp+pi,eig1,'b.');
        hold on
    elseif eig1 > eig2 && kp >= pi/2
        plot(kp,eig1,'b.');
        hold on
        plot(kp+pi,eig2,'b.');
        hold on
    end
xlabel('k_{+}', 'Interpreter', 'tex')
ylabel('\lambda', 'Interpreter', 'tex')
axis([0 6.28-2*pi/N -1 1]);
end