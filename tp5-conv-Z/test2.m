% frutaaaa????

%Bode plot of frequency response, magnitude and phase of frequency response
clear all
close all
clc
s=tf('s');
sys=(10*(s-5))/(s+3)

T=1/60; %T=1/fm
% DISCRETE Transfer function - EULER:
sysz_e=c2d(sys,T,'zoh')
% DISCRETE Transfer function - BILINEAR:
sysz_b=c2d(sys,T,'tustin')

[mag,phase]=bode(sys);
maximo=max(0.5)
magdb=20*log10(maximo)
 figure('name','Sistema continuo');
 bode(sys);figure('name','Transformacion conforme Euler');
bode(sysz_e)
figure('name','Transformacion conforma Bilinear');
bode(sysz_b)