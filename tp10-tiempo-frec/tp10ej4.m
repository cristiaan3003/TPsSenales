fm=1000;
largoVentana=50;
paso=1;
t=0:1/fm:1-1/fm; s=sin(2*pi*(4*fm*t.^2));
espec=espectrograma(s',Gabor(largoVentana),paso);   
imagesc(t,[0 fm/2],espec);
xlabel('Tiempo')
ylabel('Frecuencia')
axis xy 