close all
clear all
clc
ecg = load('ecg.txt');
eeg = load('eeg.txt');
emg = load('emg.txt');
pres = load('presion.txt');
resp = load('respiracion.txt');
Tecg = abs(fft(ecg));
Teeg = abs(fft(eeg));
Temg = abs(fft(emg));
Tpres = abs(fft(pres));
Tresp = abs(fft(resp));

Eecg=0
N=length(Tecg)
%bar(Tresp)

e=energia(Tecg(1:N/2))
ee=energia(Teeg(1:N/2))
eee=energia(Temg(1:N/2))
eeee=energia(Tpres(1:N/2))
eeeee=energia(Tresp(1:N/2))
n=1
ancho1=0
%1.2423e+010 --> 100% de la eneguia--> en ancho de banda BW=fm/2
%lo voy a estimar con el 80% de esa enegia es 9.936*10^9
%estimo el ancho de banda con el 80% de esa eneguia
%calcular porcentage
% B= ((porcentage * Y)/100)
for r=1:floor(N/2)
    e1=energia(Tecg(1:n))
    if(e1>((90 * e)/100))
        ancho1=r;
        break
    end
    n=n+1;
end
ancho1 % ecg

n=1
ancho2=0
for r=1:floor(N/2)
    e2=energia(Teeg(1:n))
    if(e2>((90 * ee)/100))
        ancho2=r;
        break
    end
    n=n+1;
end
ancho2 %eeg

n=1
ancho3=0
for r=1:floor(N/2)
    e3=energia(Temg(1:n))
    if(e3>((90 * eee)/100))
        ancho3=r;
        break
    end
    n=n+1;
end
ancho3 %emg

n=1
ancho4=0
for r=1:floor(N/2)
    e4=energia(Tpres(1:n))
    if(e4>((90 * eeee)/100))
        ancho4=r;
        break
    end
    n=n+1;
end
ancho4 %presion


n=1
ancho5=0
for r=1:floor(N/2)
    e5=energia(Tresp(1:n))
    if(e5>((90 * eeeee)/100))
        ancho5=r;
        break
    end
    n=n+1;
end
ancho5 %respiracion

% 1. ecg, 2.eeg, 3. presion, 4.respiracion, 3.emg
figure('Name','Ancho de Banda, de Mayor a menor','NumberTitle','off');
subplot(5,1,1); plot(Tecg); title('ecg');
subplot(5,1,2); plot(Teeg); title('eeg');
subplot(5,1,3); plot(Tpres); title('presion');
subplot(5,1,4); plot(Tresp); title('respiracion');
subplot(5,1,5); plot(Temg); title('emg');
%parece estar bien!! :) :)