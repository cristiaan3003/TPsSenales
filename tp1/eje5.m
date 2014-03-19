%ejercicio 4
[t,x]=senoidal(1,4000,0,2,129);
plot(t,x)
%le representacion obtenida nos induce a pensar
%que es una senoidal de 1 Hz, en lugar de los 4000Hz
%reales. Esto se debe a que se encuentra mal muestreada
% (frecuencia de muestreo muy inferior a la frecuencia de
% la señal).