close all
 clear all
 clc
%[Z,P,K]=TF2ZP(1,[1 -0.5 0.25])
clear all
close all
clc
[Z,P,K] = tf2zpk(1,[1 -0.5 0.25])
zplane(Z,P);title('zplane')
fm = 5000;
N = 5000;
df=fm/N;
k = 1:N;
r=1
z =r* exp((-1i*2*pi*k)/N);
Hf = 1 ./ (1 - 0.5*z.^-1 + 0.25*z.^-2);
sys=tf(1,[1 -0.5 0.25])
figure(2),plot(abs(Hf));title('forma 1 - usando avalua H(z=r*e^(jw)), w=(2*pi*k)/N')
%otra forma de hacerlo
t_ini=0;
t_fin=1
w2=[t_ini:1/fm:t_fin-(1/fm)];
r=1;
z2=r* exp((-1i*w2));
Hf2 = 1 ./ (1 - 0.5*z.^-1 + 0.25*z.^-2);
figure,plot(abs(Hf2));title('forma 2, cambiando la forma en la se genera w')
%[respuesta en frecuencia, frecuencia angular] =
%freqz(numerador,denominador,n) 
[h,w] = freqz(1,[1 -0.5 0.25],5000,10000) 
figure,plot(abs(h),'r');title('freqz- solo parte de 0 a pi(0 hz a fm/2 hz)')