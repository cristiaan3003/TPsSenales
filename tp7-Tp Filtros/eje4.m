clear all
close all
clc
%Filtro FIR
%elimimar ruido de 50 Hz
%DATOS
%deltaF=fm/N=1/NT=1/T_t
N=300;	%señal muestreada a 300hz (suponemos duracion 1 seg)
truncado=300;	%cantidad de muestras que tomo para el truncado temporal. (ventana en el tiempo,la cual voy a antitransformar y convolucionar en la frecuencia)
ancho=2;	%ancho para eliminar componente de 50Hz

%MUESTREO DE LA RESPUESTA EN FRECUENCIA
%recordar que en los filtro FIR, yo armo la respuesta en frecuencia que
%quiero para mi filtro, y luego antitransformo esa H[k] para obtener los
%coeficientes de mi filtro ( h[n])
fft_f=ones(1,N);

%elimino las muestras anterior y posterior a k = 51 (50hz) con el
%ancho definido arriba
for i=-ancho:ancho,
fft_f(51+i)=0;	% frecuencia positiva 
fft_f(251+i)=0;	% frecuencia negativa
end
%ploteo mi respuesta en frecuencia
figure('name','H[k] deseada');
plot(fft_f);xlabel('frecuencia');ylabel('magnitug');title('Respuesta Frecuencia Filtro Deseado')
%APLICO LA TDF INVERSA
f=real(ifft(fft_f)); %f esta en el tiempo
figure('name','ifft de H[k] -> h[n]');
plot(real(fftshift(ifft(fft_f))));xlabel('muestras');title('transformada inversa del filtro deseado - sinc - sin truncar N=300') %se observa que la antitransformada es una sinc

%REALIZO EL TRUNCADO TEMPORAL (trunco  la sinc temporal)
%f truncada
ftrunc=[f(1:truncado/2) f(N-truncado/2+1:N)]; %trunco en el tiempo
%MUESTRO DE [-fm/2 fm/2] CON FFTSHIFT
h=fftshift(ftrunc); %acomodo las muestras
figure('name','truncado temporal');
plot(h);xlabel('muestras'); title('transformada inversa del filtro deseado - sinc - truncarda N=100');

 
%VENTANAS
%ventana cuadrada --> dejo la respuesta en frecuencia como esta
%ventana de Hanning--###
windows1=h.*hanning(length(h))';
%ventana de Hamming--####
windows2=h.*hamming(length(h))';
%ventana de Blackman --####
windows3=h.*blackman(length(h))';

 
%GRAFICO PARA COMPARAR RESULTADOS 
whitebg([.5,.5,.5])
figure('name','ventana de Blackman');
subplot(2,1,1), plot(windows3,'y');xlabel('muestras'); title(['ventana de Blackman ',num2str(truncado),' muestras']); subplot(2,1,2), plot(abs(fft(windows3)),'y');xlabel('frecuencias');ylabel('magnitud');
figure('name','ventana de Hamming');
subplot(2,1,1), plot(windows2,'y');xlabel('muestras'); title(['ventana de Hamming ',num2str(truncado),' muestras']);subplot(2,1,2), plot(abs(fft(windows2)),'y');xlabel('frecuencias');ylabel('magnitud');
figure('name','ventana de Hanning');
subplot(2,1,1), plot(windows1,'y');xlabel('muestras');title(['ventana de Hanning ',num2str(truncado),' muestras']); subplot(2,1,2), plot(abs(fft(windows1)),'y');xlabel('frecuencias');ylabel('magnitud');
figure('name','ventana cuadrada');
subplot(2,1,1), plot(h,'y');xlabel('muestras');title(['ventana cuadrada ',num2str(truncado),' muestras']); subplot(2,1,2), plot(abs(fft(h)),'y');xlabel('frecuencias');ylabel('magnitud');
