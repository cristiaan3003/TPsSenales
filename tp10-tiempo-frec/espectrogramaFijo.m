function [espec]=espectrograma(s,largoVentana,paso)
    espec = [];
    n = length(s);
    for i=1:paso:n-largoVentana 
        %aplico una ventana de Blackman
        ventana = s(i:i+largoVentana-1);
        ventana = ventana.*blackman(largoVentana);
        %agregamos ceros para aumentar la resolución frecuencial
        ventana = [ ventana zeros(largoVentana,1) ];
        %calculamos las operaciones propias de un espectrograma
        fftVentana = abs(fft(ventana)); 
        fftVentana = fftVentana.^2;
        fftVentana = log(fftVentana);
        %dejamos solo las frecuencias positivas
        especVent = positiva(fftVentana);
        espec = [ espec especVent' ];
    end
    %dibujo el espectrograma
    imagesc(espec);
    xlabel('Tiempo')
    ylabel('Frecuencia')
    axis xy;
end
