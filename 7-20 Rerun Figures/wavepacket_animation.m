clear all

h = figure;
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'wave_animation.gif';

m = 1.0
L = 200
r = [0:L-1]

w1 = 1.0

H = sparse(mod(r+1,L)+1,r+1,-0.5/m) ...
    + sparse(mod(r-1,L)+1,r+1,-0.5/m) ...
    
V0 = -0.5;
Vfull = sparse(L,L);
Vfull(1:2,1:2) = V0/2;
H = H + Vfull;

v1_init = zeros(L,1);
v1_init(1,1) = 1;

dt = 1;
evolve = expm(-i*H*dt);
psi1(:,1) = evolve*v1_init;

for nt = 1:0.45*L
    psi1(:,nt+1) = evolve*psi1(:,nt);
    plot([-L/2:L/2],abs(psi1(mod(-L/2:L/2,L)+1,nt)+psi1(mod([-L/2:L/2]+1,L)+1,nt)).^2)    
    drawnow 
      % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if nt == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end     
end





