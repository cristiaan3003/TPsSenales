function[fft_cep]=frecFormantes(vocal,pCoef,fm) 
    parteCentral=floor(length(vocal)/2); 
    vocal=vocal(parteCentral-512:parteCentral+512); 
    N=length(vocal);
    vfft_cep=[];
    yM=[];
    % tamaño ventana de 25 milisegundos y como esta muestreada a 8000 muestras por
    %segundo: N=25*8000/1000 
    tVentana=floor(25*fm/1000);
    %solapamiento 
    paso=tVentana/4;
    for i=1:paso:N-tVentana %voy saltando con paso igual a la tVentana/4 
            ventana=vocal(i:i+tVentana-1); %señal ventaneada
        % calculamos los coeficientes cepstrales 
        y=ifft(log10(abs(fft(ventana)))); 
        y1=y(1:pCoef);
        n=length(y);
        aux= n - pCoef;
        y3=y(aux :n);% recordar que el cepstrum es simetrico por eso nos
        %interesan tanto las primeras muestras como las últimas, a los demas
        %valores les asignamos ceros para mantener la longitud del vector
        y2= zeros((aux- pCoef),1);
        yM= [y1' y2' y3']; % obtuvimos el cepstrum con los datos que nos interesan
        fft_cep=abs(exp(fft(yM))); % deshacemos las operaciones q hice para obtener
        %el cepstrum y ahora voy a poder visualizar las formantes.. 
        vfft_cep=[vfft_cep fft_cep];
    end
end