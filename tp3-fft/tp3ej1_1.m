close all
clear all
clc
%[t,S1] = senoidal(1,10,0,1000,0,10);
%[t,S2] = senoidal(4,20,0,1000,0,10);
clear all
close all
clc
[t,S1] = senoidal(1,100,0,150,0,1);
[t,S2] = senoidal(2,50,0,150,0,1);

% [t,S1] = senoidal(1,74.9,0,100,0,10);
% [t,S2] = senoidal(0.5,94.9,0,100,0,10);


S=S2+S2;
%figure(1)
%plot(t,S1,t,S2,t,S);
%S=[0 0 0 0 0 0 0 4]; %'??
%&N=length(S);
%X=fftshift(fft(fftshift(S)));%para que me retorne la transformada con el cero en el medio y sea mas entendible

XX=fft(S);
%XX=tdf(S);
%X2=fft(S2)
%subplot(2,1,1);
%plot(S1)
figure(1)
bar(abs(XX))
xlabel('frecuencias')
% figure(2)
% xlabel('frecuencias')
% bar(abs(X));

%subplot(2,1,2);
%plot(S2,'r-')
%bar(abs(X2))
%la funcion tdf parece andar bien