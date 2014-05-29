%6)
%ejercicio 7
clear all
close all
clc
ecg = load('ecg.txt');
pa = load('pa.txt');
voz = load('voz.txt');
fme = 250;
fmp = 100;
fmv = 8000;
Ne = length(ecg);
Np = length(pa);
Nv = length(voz);
te = 0:1/fme:(Ne/fme)-(1/fme);
tp = 0:1/fmp:(Np/fmp)-(1/fmp);
tv = 0:1/fmv:(Nv/fmv)-(1/fmv);
plot(te,ecg),title('ecg')
figure,plot(tp,pa),title('pa')
figure,plot(tv,voz),title('voz')
%frecuencias portadoras
f1 = 35000;
f2 = 40000;
f3 = 45000;
%resample
fr = 100000;
ecg=resample(ecg,fr,fme);
pa=resample(pa,fr,fmp);
voz=resample(voz,fr,fmv);
%recorto la señal
t = 0:1/fr:1-(1/fr);
ecg1 = ecg(1:fr);
pa1 = pa(1:fr);
voz1 = voz(1:fr);
clear ecg pa voz
figure,plot(t,ecg1),title('ecg remuestreada')
figure,plot(t,pa1),title('pa remuestreada')
figure,plot(t,voz1),title('voz remuestreada')
%modulacion am
mode = ecg1'.*sin(2*pi*f1*t);
modp = pa1'.*sin(2*pi*f2*t);
modv = voz1'.*sin(2*pi*f3*t);
%multiplexado
x = mode + modp + modv;
figure,plot(t,x),title('multiplexado')
%filtros pasabandas
%filtro centrado para la ecg en la frecuencia 35 khz
%ancho de banda 125 hz(mitad de su frecuencia de muestreo) tomamos 130 hz
wn1=(35000-130)/(fr/2);
wn2=(35000+130)/(fr/2);
n = 250;
pbe=fir1(n,[wn1 wn2],hamming(n+1));
%filtro centrado para la pa en la frecuencia 40 khz
%ancho de banda 100 hz(mitad de su frecuencia de muestreo) tomamos 55 hz
wn1=(40000-55)/(fr/2);
wn2=(40000+55)/(fr/2);
n = 250;
pbp=fir1(n,[wn1 wn2],hamming(n+1));
%filtro centrado para la voz en la frecuencia 45 khz
%ancho de banda 4 khz(mitad de su frecuencia de muestreo) tomamos 4010 hz
wn1=(45000-4010)/(fr/2);
wn2=(45000+4010)/(fr/2);
n = 250;
pbv=fir1(n,[wn1 wn2],hamming(n+1));
%aplico filtros pasabanda
fecg = filter(pbe,1,x);
fpa = filter(pbp,1,x);
fvoz = filter(pbv,1,x);
clear x
%demodulacion, a las portadoras tambien se les aplica el filtro para que su fase sea 
%retardada lo mismo que las señales, ya que el filtro FIR es de fase lineal pero
%provoca un retardo de grupo
ecg2 = fecg.*filter(pbe,1,sin(2*pi*f1*t));
pa2 = fpa.*filter(pbp,1,sin(2*pi*f1*t));
voz2 = fvoz.*filter(pbv,1,sin(2*pi*f1*t));
%filtros pasabajo
%El filtro para la voz debe estar centrado en la frecuencia de la señal de 35 Khz
%y la frecuencia de corte es el ancho de banda 125(la mitad de la frecuencia de muestreo) 
%Vamos a tomar 130 Khz de desviación
wn1=(130)/(fr/2);
pbje=fir1(n,wn1,hamming(n+1));
%idem
wn1=(55)/(fr/2);
pbjp=fir1(n,wn1,hamming(n+1));
%idem
wn1=(4010)/(fr/2);
pbjv=fir1(n,wn1,hamming(n+1));
%aplico pasabajos
ecg = filter(pbje,1,ecg2);
pa = filter(pbjp,1,pa2);
voz = filter(pbjv,1,voz2);
figure,plot(t,ecg),title('ecg final')
figure,plot(t,pa),title('pa final')
figure,plot(t,voz),title('voz final')