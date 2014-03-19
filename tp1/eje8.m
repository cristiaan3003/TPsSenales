%ejercicio 8
clear all
clc
hfile = 'handel.wav';
[y1, Fs1, nbits1, readinfo1] = wavread(hfile);
x=rand(1,73113)';
suma=y1+x;
subplot(3,1,1)
plot(y1)
subplot(3,1,2)
plot(x)
subplot(3,1,3)
plot(suma)

pS=potencia(y1);
pR=potencia(x);
snrDb=10*log10(pS/pR)

xx=2*x;
pS=potencia(y1);
pR=potencia(xx);
snrDb=10*log10(pS/pR)

 
 
 x0=x*sqrt(pS/pR);
 pR0=potencia(x0);
 snrDb0=10*log10(pS/pR0)
 sound(x0+y1, Fs1);
% %%
 alpha100=sqrt(pS/((10^10)*pR));
 x100=x*alpha100;
 pR100=potencia(x100);
 snrDb100=10*log10(pS/pR100)
% 
 sound(x100+y1, Fs1);