%   devuelve una señal  contaminada con ruido  blanco  uniformemente distribuido
%   y  no   autocorrelacionado con la  relacion  S/R   especificada  en SNR (en decibeles)
%   si la señal es un   vector columna,  devuelve un   vector  columna,
%   si es un   vector fila, devuelve un   vector fila
function [senal_sucia]=ensuciar(senal,  SNR)
%   creamos ruido  uniforme entre -1  y 1 
ruido=2*rand(1,length(senal))-0.5; 
Ps=sum(senal.*2)/length(senal); 
Pr=sum(ruido.*2)/length(ruido);
%   sabemos que:
%   SNR=10*log10(Ps/Pr)  =>  Pr=Ps/(10**(SNR/10)
%   y
%   Pr=sum((alfa*Pr(i)).**2) =>  alfa=sqrt(Ps/(Pr*(10**(SNR/10))))
alfa=sqrt(Ps/(Pr*(10*(SNR/10)))); 
[nFilas,  nColumnas]=size(senal); 
ruido2=ruido.*alfa;
%   tenemos en cuenta  si la señal es vector fila  o  columna
if(nFilas==1)
senal_sucia=senal+ruido2;
else
    senal_sucia=senal+ruido2;
end
end