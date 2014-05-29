close all
 clear all
 clc

clear all
close all
clc
[Z,P,K] = tf2zpk([2 0 -3],[1 -0.1 -0.5])
zplane(Z,P);
fm = 10000;
N = 10000;
df=fm/N;
k = 1:N;
r=1
z =r* exp((-1i*2*pi*k)/N);
Hf = (2-3*z.^-2)/(1-0.1*z.^-1-0.5*z.^-2);
sys=tf([2 0 -3],[1 -0.1 -0.5])
figure,plot(abs(Hf))