clear all
close all
clc

necg = load('necg.txt');
N = length(necg);
Tnecg = fft(necg);
subplot(4,1,1);plot(abs(Tnecg));title('Tnecg- tranformada señal sin filtro');
subplot(4,1,2);plot(abs(necg));title('abs(necg) - señal sin filtro' );

%se aplica "filtro" se colocan ceros en la frecuencias que van desde 40 a 180 Hz
%forma de calculo para colocar los ceros en el intevalo correcto
% N=1024 muestras
%Dt=T=1/fm
% Df=fm/N=1/NT=1/T0
%T0=NT=1024/360=2.84 duracion total
%Df=360/1024=0.3515 
% fm/N=1/NT --> fm=1/T --> T=1/fm=1/360
Tnecg(113:511) = zeros(511-113+1,1);%parte positiva
Tnecg(N-511:N-113) = zeros(511-113+1,1);%parte negativa
subplot(4,1,3);plot(abs(Tnecg));title('abs(Tnecg)');
subplot(4,1,4);plot(abs(ifft(Tnecg)));title('abs(ifft(Tnecg))- señal con el ruido filtado');