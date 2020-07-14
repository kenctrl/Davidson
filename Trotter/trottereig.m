function [eig1,eig2] = trottereig(kp,m,t)
ieig1 = (cos(kp))^2*cos(m*t) + (sin(kp))^2 + sqrt((cos(kp))^2*(-3 + cos(2*kp) - 2*(cos(kp))^2*cos(m*t))*(sin(m*t/2))^2);
ieig2 = (cos(kp))^2*cos(m*t) + (sin(kp))^2 - sqrt((cos(kp))^2*(-3 + cos(2*kp) - 2*(cos(kp))^2*cos(m*t))*(sin(m*t/2))^2);
eig1 = log(ieig1)/(-i*t);
eig2 = log(ieig2)/(-i*t);