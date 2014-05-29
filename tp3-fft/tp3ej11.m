%buscar alrededor de multiplos de 440.
%
nshima = load('nshima.txt'); %fm = 11025
%sound(nshima)
figure('Name','Nota LA y Transformada','NumberTitle','off');
subplot(2,1,1)
plot(nshima)
title('Archivo nshma.txt')
Tn = fft(nshima);
subplot(2,1,2)
stem(abs(Tn))
title('transformada del archivo')
figure('Name','Recorte con Lugar donde esta nota LA en FFT','NumberTitle','off');
N = length(Tn); %69632
TLA = zeros(N,1);
for k=0:2778:N/2 %indice donde caeria LA ->2778. Sin embargo no es correcto esto, xq no estoy buscando los multiplos de 440 a ver si se toco o no LA
    TLA(k+1)=Tn(k+1); %LA positivo
    TLA(N-k)=Tn(N-k); %LA negativo
end
subplot(2,1,1)
plot(abs(TLA))
title('TLA')
subplot(2,1,2)
stem(abs(ifft(TLA)))
title('ifft TLA')

TLA2 = zeros(N,1);
TLA2(8360) = Tn(8360);
TLA2(N-8360) = Tn(N-8360);

%plot(real(ifft(TLA2)))