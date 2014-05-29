function[f0]=frecFundamental(vocal,pCoef,fm) 
    parteCentral=floor(length(vocal)/2); 
    vocal=vocal(parteCentral-512:parteCentral+512); 
    N=length(vocal);
    vf0r=[];
    % tamaño ventana de 30 milisegundos y muestreada a 8000 hz 
    tVentana=30*8000/1000; %ventana con 240 muestras.
    %generamos solapamiento 
    paso=tVentana/2;
    for i=1:paso:N-tVentana %voy saltando con paso igual a la tVentana/2 
        ventana=vocal(i:i+tVentana-1); %señal ventaneada
        % calculamos los coeficientes cepstrales 
        r=ifft(log10(abs(fft(ventana)))); 
        r=r(pCoef:130);
        [maxVocal,indice]=max(r); %en indice obtengo el periodo.
        f0r=fm/(pCoef+indice); %agregamos el pCoef porque son las muestras que eliminamos antes para calcular f0
        vf0r=[vf0r f0r]; %vector con frecuencias fundamentales calculadas con cepstrum..
    end
    f0=mean(vf0r);
end