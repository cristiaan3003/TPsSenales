%   Calcula la  fundamental de cada ventana si esta  contiene  una vocal mediante los
%   coeficientes cepstrales y  el  metodo de autocorrelacion.  Estos metodos se  basan
%   en la  busqueda de picos  maximos. Para dicha  busqueda sabemos que en el primer valor
%   tanto de los coefs cepstrales  como en  la  autocorrelacion se da un   maximo, por lo  que
%   descartamos una cantidad  determinada de valores  (que  puede ser  ajustada)  cercanos
%   al maximo para  que  la  busqueda de los  valores  correctos.
function [fautocorrel,  fcceps]=obtenerfundamentales(ventanas,  fm, esVocal) 
fautocorrel=[]; %   guarda las  fundamentales estimadas mediante  autocorrelacion
fcceps=[];  %   fundamentales estimadas mediante  coeficientes  cepstrales



for i=1:size(ventanas)

    
    
    ventanaActual=ventanas(i,:);
%   si  la ventana contiene una vocal,  calculamos la  fundamental,  sino  ponemos que  es  0
if esVocal(i)==true
%   calcula  la  fundamental de la  ventana por coeficientes cepstrales
cc=ifft(log10(abs(fft(ventanaActual))));  %   calculamos los  coefs cepstrales

desdeDonde=25;	%   buscamos el 2do   pico desde esta  posicion  p/no  tomar datos del  1ero
[m, mpos]=max(cc(desdeDonde:(length(cc)/2)+1));
%   con el  2do   pico  sabemos la  cantidad  de muestras (mpos+desdedonde)
%   lo  multiplicamos por la  cantidad  de tiempo que representa  cada muestra
%   para obtener el  periodo y  sacando el  inverso  nos da la  frecuencia
freq=(fm/(mpos+desdeDonde));
fcceps=[fcceps freq];


%   calcula  la  fundamental de la  ventana por autocorrelacion 
autocorrel=conv(ventanaActual,  ventanaActual(length(ventanaActual):-1:1));  %calcula la autocorrelacion
autocorrel=autocorrel(length(ventanaActual):length(autocorrel));  %  sabemos que el maximo se  da  en  la mitad
desdedonde=29;	%   buscamos el 2do   pico desde esta  posicion p/no tomar  datos del  1ero
[m, mpos]=max(autocorrel(desdedonde:length(autocorrel)));
%   con el  2do   pico  sabemos la  cantidad  de muestras (mpos+desdedonde)
%   lo  multiplicamos por la  cantidad  de tiempo que representa  cada muestra
%   para obtener el  periodo y  sacando el  inverso  nos da la  frecuencia
freq=(fm/(mpos+desdedonde));
fautocorrel=[fautocorrel freq];  %   guardamos la  fundamental de la  ventana
else
    %es fonema sordo
    fcceps=[fcceps 0];
    fautocorrel=[fautocorrel 0];
end
end
end