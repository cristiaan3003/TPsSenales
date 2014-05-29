close all
clear all
clc
%   carga la señal
sent=load('sent.txt')';
%   frecuencia  de muestreo 
fm=8000;	
tiempoVentana=0.019;%   segundos que abarca cada ventana 
muestrasVentana=round(tiempoVentana*fm);%   cantidad  de muestras  que tendra  cada  ventana
ventanas=ventanearsenal(sent, muestrasVentana,'hamming');%   hacemos el  ventaneo de la señal 

%   para cada ventana tratamos de estimar si  corresponde  a una vocal  o  a un   fonema sordo
%   usaremos esta  estimacion independientemente del  ruido  con el  que contaminemos la señal
%   ya que seria  demasiado dificil realizar dicha estimacion  con  ruido 
esVocal=evaluarfonemas(ventanas);
%   una vez  que sabemos si  cada ventana corresponde a una vocal o  fonema  sordo,
%   calculamos la frecuencia fundamental de la  ventana mediante los  metodos
%   de coeficientes  cepstrales  y  autocorrelacion
[fautocorrel, fcceps]=obtenerfundamentales(ventanas,  fm, esVocal);


%   graficamos los resultados
figure (1)
plot(fcceps);
title('Estimacion  de F0  en base a coeficientes  cepstrales');
xlabel('ventana');  ylabel('F0');  grid on;
print  'cceps.png'; 
figure(7)
plot(fautocorrel);
title('Estimacion  de F0  en base a autocorrelacion');
xlabel('ventana');  ylabel('F0');  grid on;
%print 'autocorr.png';

%   ensuciamos la  señal  con una SNR de  50dB
sent50db=ensuciar(sent, 50);
%   ventaneamos la  señal  nuevamente con los  mismos valores
%   NO   volvemos a calcular si la misma  corresponde  a una  vocal ventanas=ventanearsenal(sent50db,  muestrasVentana,  'hamming');
%   calculamos  nuevamente la  fundamental por los  dos metodos
[fautocorrel, fcceps]=obtenerfundamentales(ventanas,  fm, esVocal);




%   graficamos los  resultados 
figure(2)
plot(fcceps);
title('Estimacion  de F0  en base a coeficientes  cepstrales  para SNR=50dB');
xlabel('ventana');  ylabel('F0');  grid on;
%print  '50dbcceps.png'; 
figure(8)
plot(fautocorrel);
title('Estimacion  de F0  en base a autocorrelacion  SNR=50dB');
xlabel('ventana');  ylabel('F0');  grid on;
%print '50dbautocor.png';



%   ensuciamos la  señal  con una SNR de  20dB
sent20db=ensuciar(sent, 20);
%   ventaneamos la  señal  nuevamente con los  mismos valores
%   NO   volvemos a calcular si la misma  corresponde  a una  vocal ventanas=ventanearsenal(sent20db,  muestrasVentana,  'hamming');
%   calculamos  nuevamente la  fundamental por los  dos metodos
[fautocorrel, fcceps]=obtenerfundamentales(ventanas,  fm, esVocal);




% %   graficamos los  resultados 
figure(3)
plot(fcceps);
title('Estimacion  de F0  en base a coeficientes  cepstrales  para SNR=20dB');
xlabel('ventana');  ylabel('F0');  grid on;
%print  '20dbcceps.png'; 
figure(9) 
plot(fautocorrel);
title('Estimacion  de F0  en base a autocorrelacion  SNR=20dB');
xlabel('ventana');  ylabel('F0');  grid on;
%print '20dbautocor.png';


%   ensuciamos la  señal  con una SNR de  10dB
sent10db=ensuciar(sent, 10);
%   ventaneamos la  señal  nuevamente con los  mismos valores
%   NO   volvemos a calcular si la misma  corresponde  a una  vocal ventanas=ventanearsenal(sent10db,  muestrasVentana,  'hamming');
%   calculamos  nuevamente la  fundamental por los  dos metodos
[fautocorrel, fcceps]=obtenerfundamentales(ventanas,  fm, esVocal);



% %   graficamos los  resultados 
figure(4)
plot(fcceps);
title('Estimacion  de F0  en base a coeficientes  cepstrales  para SNR=10dB');
xlabel('ventana');  ylabel('F0');  grid on;
%print  '10dbcceps.png';
figure (10)
plot(fautocorrel);
title('Estimacion  de F0  en base a autocorrelacion  SNR=10dB');
xlabel('ventana');  ylabel('F0');  grid on;
%print '10dbautocor.png';

%   ensuciamos la  señal  con una SNR de  5dB
sent5db=ensuciar(sent, 5);
%   ventaneamos la  señal  nuevamente con los  mismos valores
%   NO   volvemos a calcular si la misma  corresponde  a una  vocal ventanas=ventanearsenal(sent5db,  muestrasVentana,  'hamming');
%   calculamos  nuevamente la  fundamental por los  dos metodos
[fautocorrel, fcceps]=obtenerfundamentales(ventanas,  fm, esVocal);
%   graficamos los  resultados figure


figure(5)
plot(fcceps);
title('Estimacion  de F0  en base a coeficientes  cepstrales  para SNR=5dB');
xlabel('ventana');  ylabel('F0');  grid on;
%print  '0dbcceps.png';
figure(11)
plot(fautocorrel);
title('Estimacion  de F0  en base a autocorrelacion  SNR=5dB');
xlabel('ventana');  ylabel('F0');  grid on;
%print '0dbautocor.png';

%   ensuciamos la  señal  con una SNR de  0dB
sent0db=ensuciar(sent, 0);
%   ventaneamos la  señal  nuevamente con los  mismos valores
%   NO   volvemos a calcular si la misma  corresponde  a una  vocal ventanas=ventanearsenal(sent0db,  muestrasVentana,  'hamming');
%   calculamos  nuevamente la  fundamental por los  dos metodos
[fautocorrel, fcceps]=obtenerfundamentales(ventanas,  fm, esVocal);


%   graficamos los  resultados 
figure(6)
plot(fcceps);
title('Estimacion  de F0  en base a coeficientes  cepstrales  para SNR=0dB');
xlabel('ventana');  ylabel('F0');  grid on;
%print  '0dbcceps.png'; 
figure(12)
plot(fautocorrel);
title('Estimacion  de F0  en base a autocorrelacion  SNR=0dB');
xlabel('ventana');  ylabel('F0');  grid on;
%print '0dbautocor.png';


wavwrite(sent50db,8000,'sent50db.wav');
wavwrite(sent20db,8000,'sent20db.wav');
wavwrite(sent20db,8000,'sent10db.wav');
wavwrite(sent20db,8000,'sent5db.wav');
wavwrite(sent0db, 8000,  'sent0db.wav');
