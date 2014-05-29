sent = load('sent.txt'); %cargamos el archivo
plot(sent)
sent = sent(1500:15500); %recortamos la parte donde se encuentra la frase
N = length(sent);

ruido = rand(1,N); %generamos un ruido aleatorio
potSent = sum(sent.^2)/N; %calculamos la potencia de la señal
potRuido = sum(ruido.^2)/N; %calculamos la potencia del ruido

%SEÑAL CON 0 DB:
%despejamos el alfa cuadrado de la formula SNR
alfa2_0db = potSent/(potRuido*10^0); 
r0 = ruido*sqrt(alfa2_0db); %ruido con potencia necesaria
sent0db = sent+r0'; %sent con SNR=0dB

%SEÑAL CON SNR 20 DB: 
alfa2_20db = potSent/(potRuido*10^(20/10)); 
r20 = ruido*sqrt(alfa2_20db); %ruido con potencia necesaria
sent20db = sent+r20'; %sent con SNR=20dB

%SEÑAL CON SNR 50 DB: 
alfa2_50db = potSent/(potRuido*10^(50/10)); 
r50 = ruido*sqrt(alfa2_50db); %ruido con potencia necesaria
sent50db = sent+r50'; %sent con SNR=50dB

% tamaño ventana de 20 milisegundos y muestreada a 8000 hz 
largoVentana = 20*8000/1000; %ventana con 160 muestras.

vf0cor=[]; %vector de f0's por autocorrelacion
vf0cep=[]; %vector de f0's por cepstrum
%generamos solapamiento 
paso = largoVentana/2;
for i=1:paso:N-largoVentana 
    ventana = sent(i:i+largoVentana-1);
    % calculo si es sonoro (true) o sordo (false)
    if(esSonoro(ventana)) %frec fundamental solo en sonoros
        %autocorrelación temporal 
        y1corr = autoCorrelacion(ventana');
        %coeficientes cepstrales 
        y2ceps = ifft(log10(abs(fft(ventana))));
        corte1 = y1corr(25:130); %sacamos la primera y ultima parte porque nos interesa solo la f0, la cual esta en un rango posible acotado de frecuencias
        corte2 = y2ceps(25:130);
        [maxVocal,indice1] = max(corte1); %busco el valor de k correspondiente al mayor valor
        [maxVocal,indice2] = max(corte2);%busco el valor de k correspondiente al mayor valor
        f0corr = 8000/(25+indice1); %busco la frecuencia de ese k
        f0ceps = 8000/(25+indice2); %busco la frecuencia de ese k
        vf0cor = [vf0cor f0corr]; %concateno la nueva f0 
        vf0cep = [vf0cep f0ceps]; %concateno la nueva f0
    else %si es sordo no posee f0
        vf0cor = [vf0cor 0]; %concateno un 0 por ausencia de f0
        vf0cep = [vf0cep 0]; %concateno un 0 por ausencia de f0
    end
end

figure(2) 
subplot(2,1,1); 
plot(vf0cor); %f0's por autocorrelacion
subplot(2,1,2); 
plot(vf0cep); %f0's por cepstrum