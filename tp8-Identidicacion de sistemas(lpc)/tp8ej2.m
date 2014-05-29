clear all
clc
s=load('eeg.txt');
%ip=akaike(e,length(s),30);
r=autocorr(s);
[a,g,e]=LevDur(r,8);%8 es orden suficiente dice el enunciado



[H,W] = freqz(g,a,length(s),'whole');
figure(1)
plot(abs(H)); %respuesta en frecuencias del sistema
title('Repuesta en frecuencias (freqz)')
figure(2)
plot(abs(fft(s))); %espectro de la señal de entrada
title('Espectro de la señal de entrada')
