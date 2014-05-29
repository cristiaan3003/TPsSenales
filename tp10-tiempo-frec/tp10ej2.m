fm=500; %para cumplir el teorema de muestreo
t=0:1/fm:1-1/fm; %muestreamos 1 segundo
s=sin(2*pi*(100*t+50*t.^2)); %calculamos el sin con la formula descripta anteriormente
espec=espectrograma(s',blackman(200),10); %graficamos
imagesc(t,[0 fm/2],espec); 
xlabel('Tiempo')
ylabel('Frecuencia')
axis xy