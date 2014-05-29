close all
 clear all
clc
[Z,P,K]=TF2ZPK(1,[1 -1 -1])   
zplane(Z,P); %si los polos estan fuera del circulo unitario el sistema es inestable
fm = 10000;
N = 10000;
k = 1:N;
r=1;
z = r*exp((-j*2*pi*k)/N);
Hf = 1 ./ (1 - 1*z.^-1 -1*z.^-2);
sys=tf(1,[1 -1 -1])
figure,plot(abs(Hf))

[h,w] = freqz([1],[1 -1 -1],10000,'whole')
% graficamos
figure(3)
stem(abs(h)); 
title('Respuesta en frecuencia del filtro entre 0 y Pi .')