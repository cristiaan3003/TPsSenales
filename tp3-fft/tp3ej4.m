clear all
close all
clc
%1 - genero señal cuadrada
t=0:0.01:0.99;
SQ = square(t*4*2*pi);
%2 - agrego ceros al final de la misma
SQ2 = zeros(1,length(SQ)*2);
SQ2(1:length(SQ)) = SQ;
%3 - calcculo su transformada
X = fft(SQ2);
N = length(X);
XX=zeros(1,N);
for k=0:N-1
    XX(k+1) = X(k+1)*exp(-(1i*2*pi*k*(10))/N); %retardo t0=10
end
X2 = ifft(XX);
figure(1)
 subplot(2,1,1)
 plot(SQ2)
 title('señal cuadrada con ceros al final Sin fourier')
 subplot(2,1,2)
 plot(real(X2))
 title('Misma Señal- retardada en la frec,antitransf y graficada')


% 
% %4 - misma señal pero retardada 10 muestras
figure('Name','Comparadas en Dominio Temporal','NumberTitle','off');
SQ10 = square(t*4*2*pi);
SQ10a = zeros(1,2*length(SQ10));
SQ10a(11:110) = SQ10;
%plot(SQ10a)
% %5
Y = fft(SQ10a);
resu = Y - XX;


subplot(4,1,1)
plot(SQ10a);
title('Generada en Dominio temporal con 10 muentras de retardo')
subplot(4,1,2);
plot(real(X2))
title('Generada en Dominio frec con 10 muentras de retardo y antitransf')
subplot(4,1,3);
plot(SQ10a-real(X2));
title('la diferencia es cero en domino temporal');
% %generada con 10 muestras de retardo
subplot(4,1,4)
plot(abs(resu))
title('la diferencia es cero en domino frecuencial');
% %desplazada mediante propiedades de la transformada
%  plot(abs(XX))
% % conclusion .... MUY BIEN GRACIAS!!!