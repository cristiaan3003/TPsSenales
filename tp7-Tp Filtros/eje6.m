%ejercicio 6
clear all
close all
clc
fm = 20000;
n = 200;
m=zeros(1,n);
m(100*n/(fm/2):200*n/(fm/2))=ones(1,(200-100)*n/(fm/2)+1);
m(1640*n/(fm/2):3028*n/(fm/2))=ones(1,(3028-1640)*n/(fm/2)+1);
m(5000*n/(fm/2):6000*n/(fm/2))=(1:(6000-5000)*n/(fm/2)+1)/((6000-5000)*n/(fm/2)+1);
f=0:1/(n-1):1;
plot(f,m),title('filtro deseado'),grid on
pause
b = fir2(n,f,m,hamming(n+1));
h = freqz(b,1,fm);
plot(abs(h)),title('filtro fir multibanda')