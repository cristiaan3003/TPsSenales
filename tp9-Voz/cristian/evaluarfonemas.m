%   Para cada ventana sacada de la  señal  decidimos si el fonema corresponde  a una vocal  o
%   a un   fonema sordo.  Para esto  consideramos que una vocal  posee mucha  energia concentrada
%   en frecuencias  "bajas"  mientras que los  fonemas sordos  poseen  componentes de frecuencias
%   altas  con poca energia y  muy  distribuida.
%   Para evaluar la  frecuencia calculamos la  cantidad de cruces por cero de la  señal en la
%   ventana evaluada. Para la  desicion de si  la  ventana corresponde a un   fonema sordo
%   se usan umbrales para la  cantidad  de cruces por cero y  energia de la  ventana. Se
%   pueden cambiar  estas constantes para ajustar el comportamiento del algoritmo.
%   En  casos extremos la  desicion puede no   ser  correcta  ya que pueden mezclarse mas   de  un
%   fonema en una ventana. Y  en otros  casos el criterio puede no   ser suficiente  para distinguir
function [vocalosordo]=evaluarfonemas(ventanas)
umbralCrucesPorCero=55;  %   cantidad  de cruces  por cero maxima que  puede  tener una vocal
umbralEnergia=0.01;	%   cantidad  de cruces  por cero maxima que  puede  tener una vocal
vocalosordo=[]; %   guarda true si  el fonema de  la  ventana es vocal, false  si  es fonema  sordo
cc=[]; 	%   cruces por cero de todas las  ventanas, no   nos sirve,  solamente para  observar
ev=[];	%   energias de todas las  ventanas, tampoco nos  sirve,  solamente para

for i=1:size(ventanas) 
    
    
ventanaActual=ventanas(i,:);
%   para saber si  es vocal o  fonema sordo tratamos  de ver  la  frecuencia
%   los  fonemas sordos tienen  altas  frecuencias. Para saber esto calculamos
%   la  cantidad de cruces por cero

crucesPorCero=0;	%   cuenta los  cruces por cero de la  ventana
for j=2:length(ventanaActual)
if (ventanaActual(j-1)>0  &&   ventanaActual(j)<0)  || (ventanaActual(j-1)<0  &&ventanaActual(j)>0)
crucesPorCero=crucesPorCero+1;
end
end
cc=[cc crucesPorCero]; 	%   guardamos el  historico  de cruces por cero solamente  para
eVentana=sum(ventanaActual.*ventanaActual);	%   calculamos la  energia de la  ventana 
ev=[ev eVentana]; 	%   guardamos el historico  de  energias  solamente para observar

%   en base a los  umbrales de energia  y  de cruces por cero
%   decidimos si el fonema es  sordo o  corresponde a una vocal
if  crucesPorCero>umbralCrucesPorCero 
    vocalosordo(i)=false;

else
if eVentana<umbralEnergia 
    vocalosordo(i)=false;
else
 vocalosordo(i)=true;   
end
end
end
end

