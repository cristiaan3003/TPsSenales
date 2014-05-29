function [espec]=espectrogramaGabor(s,tVentana,paso)
    espec=[]; 
    n=length(s); 
    tVentana=floor(tVentana); 
    paso=floor(paso);
    for i=1:paso:n-tVentana 
        ventana=s(i:i+tVentana-1); 
        ventana=ventana.*Gabor(length(ventana))';
        ventana=[ventana zeros(tVentana,1)]; %agregamos ceros para aumentar la resolucion frecuencial
        fft_ventana=abs(fft(ventana)); 
        fft_ventana=fft_ventana.^2; 
        fft_ventana=log(fft_ventana); %para que se vea mejor
        espec_vent=positiva(fft_ventana);%dejamos solo las frecuencias positivas
        espec=[espec espec_vent'];
    end
    imagesc(espec); axis xy;
end
