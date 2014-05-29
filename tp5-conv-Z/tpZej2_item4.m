clc
close all
clear all
ceros = 0;
polos = roots([1 2^-1 4^-1 8^-1 16^-1 32^-1 64^-1 128^-1]);    %si los polos estan fuera del circulo unitario el sistema es inestable
zplane(ceros,polos);
fm = 10000;
N = 10000;
k = 1:N;
z = exp((-j*2*pi*k)/N);
Hf = (1 - (2^-1)*z.^-1 + (4^-1)*z.^-2 +(8^-1)*z.^-3+(16^-1)*z.^-4+(32^-1)*z.^-5+(64^-1)*z.^-6+(128^1)*z.^-7);
sys=tf([1 2^-1 4^-1 8^-1 16^-1 32^-1 64^-1 128^-1],1)
figure,plot(abs(Hf))
%NOTA
% Un sistema inestable presenta un comportamiento no acotado. Puede crecer 
% a valores muy grandes, ya sea en forma monotona o en forma oscilatoria, 
% pero en general manifiesta un crecimiento sostenido y cada vez mayor en 
% amplitud. Eso hace que el contenido energético sea muy grande, y por lo 
% tanto eso se verá reflejado en la transformada de fourier como valores 
% muy grandes en alguna/muchas componentes frecuenciales. De hecho en esas 
% condiciones la transformada de fourier puede no ser un adecuado 
% estimador del contenido frecuencial de la señal e inclusive diverger sin 
% mostrar resultados claros.
% 
% >2) en la teoria dice que para que los sistemas de tiempo discreto sean
% >estables los polos deben estar en el interior del circulo unitario, ¿si los
% >polos caen en el perimetro en vez del interior, sigue siendo estable?
% >
% >  
% >
% Los ceros pueden estar en cualquier lado, el problema son los polos. Los 
% polos dentro del círculo definen un sistema estable. Los polos complejos 
% conjugados en general estan asociados a un comportamiento oscilatorio 
% amortiguado, mientras que en general un polo ubicado sobre el circulo 
% unitario esta relacionado a componentes oscilatorias no amortiguadas. Si 
% algun polo cae fuera del círculo unitario el sistema es inestable. Los 
% polos sobre el círculo en general dan caracteristicas no muy deseadas 
% (solemos querer que el sistema "tienda" a un valor constante luego de un 
% tiempo, no que se quede oscilando todo el tiempo), aunque en alguna 
% aplicacion pueden ser de interés, pero aun asi suelen ser peligrosos, 
% porque un error sistemático en las operaciones, auque sea chico, puede 
% tener el efecto de una pequeña variación de los coeficientes que haga 
% que dicho polo quede fuera del círculo y vuelva inestable al sistema.