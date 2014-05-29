clear all
close all
clc
% %NOTA: recordar que la fft nos retorna primero la parte positiva
% %luego desde la mitad en adelante la parte negativa
% %empenzando desde cero
  [t,S1] = senoidal(1,10,0,1000,0,1);
  [t,S2] = senoidal(4,20,0,1000,0,1);
  S=S1+S2+4;
 N=length(S);
%1
  X=fft(S);
 
%  dibuja la transformada de forma correcta
%  1) con funciones de matlab 
  XX=fftshift(fft(fftshift(S)));

 % 2) programado 
 %el resultado es el mismo, solo hay diferencia en el indice, con shift el
 %indice es uno mas, corre el indice uno a la derecha.ejemplo: 501 corresponde a
 %500
 %XX=zeros(N);
 %XX(1:(N/2))= X(N/2:N-1);
%  XX((N/2):N-1) = X(1:N/2);
% display(length(X(1:N/2)));
% display(length(X(N/2:N-1)));
%en el eje de las absisas, el 1, representa la frecuencia cero
%la frecuencia cero--> constantes!
% bar(abs(XX),'hist')

%al sumar la cte 4 se agrega una frecuencia cero al principio del espectro 
%igual a  d*fm*cte


%2
% [t,S3] = senoidal(1,10,0,1000,0,1);
% [t,S4] = senoidal(4,11,0,1000,0,1);
% Sn2=S3+S4+4;
% Y=fft(Sn2);
%  YY=fftshift(fft(fftshift(Sn2)));
%  subplot(2,1,1)
%  bar(abs(XX))
%  subplot(2,1,2)
%  bar(abs(YY))
%las barras se encuentras mas juntas debido a que son frecuencias muy
%similares
% 
% %3
[t,S5] = senoidal(1,10,0,1000,0,1);
[t,S6] = senoidal(4,10.5,0,1000,0,1);
Sn3=S5+S6;
Z=tdf(Sn3);
  ZZ=fftshift(fft(fftshift(Sn3)));
 %----------------
% ZZ=zeros(N);
% ZZ(1:(N/2))= Z(N/2:N-1);
% ZZ((N/2):N-1) = Z(1:N/2);
  %----------------
subplot(2,1,1)
bar(abs(XX))
subplot(2,1,2)
bar(abs(ZZ))
% %es un asco, se pegan y se deforman en la cercania
% %eso pasa porq la diferencia de frecuencias es menor que el paso dado por:
% %dF = fm/N (no da la resolucion), por lo cual aparece fruta jaja :P
% %eso se llama aliasing (?) -> Segun entiendo no, eso es problema de
% resolucion frecuencial, alias es tema de fm.


% %4
% [t,S7] = senoidal(1,10,0,1000,0,0.72);
% [t,S8] = senoidal(4,20,0,1000,0,0.72);
% Sn4=S7+S8;
% WW=fftshift(fft(fftshift(Sn4)));
% subplot(3,1,1)
% bar(abs(XX))
% subplot(3,1,2)
% bar(abs(ZZ))
% subplot(3,1,3)
% bar(abs(WW))
% %pasa algo parecido a lo del punto 3, disminuye la resolucion frecuencial
% %(aumente el deltaF)