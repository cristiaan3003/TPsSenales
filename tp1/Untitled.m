clear all
close all
clc
%consideracion
%t=2*pi*fs*t con t perteneciente al (-1,1)
t=-10:0.0001:10;
x=2*pi*100*t;
xx=sinc(x);
figure(1)
plot(xx)
figure(2)
plot(abs(fftshift(fft(fftshift(xx))))) % la transformada de una sinc en el
%tiempo es una ventana cuadrada en la frecuencia

% xx=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
% figure(1)
% plot(xx)
% figure(2)
% plot(abs(fftshift(fft(fftshift(xx))))) -> la transfo Furier de una
% ventana cuadrada en el tiempo es una sinc en la frecuencia