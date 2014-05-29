%function[f0]=ej1tpvoz(vOriMas,pCoef,fm)
pCoef=30;
fm=8000;
s=load('aeiou_mas.txt');
a=s(1900:5300);
e=s(7800:13000); 
i=s(14900:19500); 
o=s(22000:27000); 
u=s(29000:33000);

%FRECUENCIAS FUNDAMENTALES
 
f0a= frecFundamental(a,pCoef,fm); 
f0e= frecFundamental(e,pCoef,fm); 
f0i= frecFundamental(i,pCoef,fm); 
f0o= frecFundamental(o,pCoef,fm); 
f0u= frecFundamental(u,pCoef,fm);

f0=[f0a f0e f0i f0o f0u];%frecuencia fundamental de cada vocal

% FRECUENCIAS FORMANTES 
figure(1) 
ffa=frecFormantes(a,pCoef,fm); 
stem(ffa);
xlabel('a'); 
ffe=frecFormantes(e,pCoef,fm); 
figure(2)
stem(ffe);
xlabel('e');
ffi=frecFormantes(i,pCoef,fm);
figure(3)
stem(ffi);
xlabel('i'); 
ffo=frecFormantes(o,pCoef,fm); 
figure(4)
stem(ffo);
xlabel('o');
figure(5)
ffu=frecFormantes(u,pCoef,fm);
stem(ffu);
xlabel('u');

%CALCULAR AUTOCORRELACION A PATA!!!

%Respuesta en frecuencia con prediccion lineal:
aa=autocorr(a'); 
[coefA,coefB]= levinson(aa, 50);
rf=freqz(coefA,coefB,50);
figure(6)
shiftRF=fftshift(rf);
stem(abs(shiftRF));

ee=autocorr(e');
[coefA,coefB]= levinson(ee, 50);
rf=freqz(coefA,coefB,50);
figure(7)
shiftRF=fftshift(rf);
stem(abs(shiftRF));

ii=autocorr(i');
[coefA,coefB]= levinson(ii, 50);
rf=freqz(coefA,coefB,50);
figure(8)
shiftRF=fftshift(rf);
stem(abs(shiftRF));

oo=autocorr(o');
[coefA,coefB]= levinson(oo, 50);
rf=freqz(coefA,coefB,50);
figure(9)
shiftRF=fftshift(rf);
stem(abs(shiftRF));

uu=autocorr(u');
[coefA,coefB]= levinson(uu, 50);
rf=freqz(coefA,coefB,50);
figure(10)
shiftRF=fftshift(rf);
stem(abs(shiftRF));