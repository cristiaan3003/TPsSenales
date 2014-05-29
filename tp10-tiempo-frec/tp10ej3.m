fm=500;
t=0:1/fm:1-1/fm; %muestreamos 1 segundo
%calculamos el sin con la formula descripta anteriormente para utilizar en
%el análisis
s=sin(2*pi*(100*t+50*t.^2)); 
figure(1)
subplot(3,1,1)
vent1=Gabor(200);
plot(vent1) %vista desde la perspectiva temporal
title('Gabor en el tiempo')
subplot(3,1,2)
plot(abs(fftshift(fft(vent1)))) %observamos el comportamiento frecuencial
title('Gabor en frecuencia')
subplot(3,1,3)
espec=espectrograma(s',vent1,10); %graficamos con un atomo de Gabor
imagesc(t,[0 fm/2],espec); 
xlabel('Tiempo')
ylabel('Frecuencia')
axis xy
figure(2)
subplot(3,1,1)
vent2=Gabor150(200);
plot(vent2) %vista desde la perspectiva temporal
title('Gabor en el tiempo')
subplot(3,1,2)
plot(abs(fftshift(fft(vent2)))) %observamos el comportamiento frecuencial
title('Gabor en frecuencia')
subplot(3,1,3)
espec2=espectrograma(s',vent2,10); %graficamos con otro atomo de Gabor diferente
imagesc(t,[0 fm/2],espec2);
xlabel('Tiempo')
ylabel('Frecuencia')
axis xy

%graficamos
% figure(3)
% afwig1=wignerdist(s);
% 
% figure(4)
% afwig2=wignerdist(vent1);
% 
% figure(5)
% afwig3=wignerdist(vent2);

figure(6)
cwd = cohendist(s,10); %sigma = 10

figure(7)
cwd2 = cohendist(vent1,10); %sigma = 10

figure(8)
cwd3 = cohendist(vent2,10); %sigma = 10
% figure(6)
% tfrcw(s', 1:length(s), length(s), hamming(length(s)/10), hamming(length(s)/4), 1, 0 );