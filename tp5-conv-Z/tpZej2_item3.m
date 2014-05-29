 close all
 clear all
 clc
[Z,P,K]=TF2ZPK(7,[1 -2 6])
zplane(Z,P); %si los polos estan fuera del circulo unitario el sistema es inestable
fm = 10000;
N = 10000;
k = 1:N;z = exp((-j*2*pi*k)/N);
Hf = 7 ./ (1 - 2*z.^-1 + 6*z.^-2);
sys=tf(0.7,[1 -2 6])
figure,plot(abs(Hf))