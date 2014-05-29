coef=[1 -0.3 0.4 -0.2]; %coeficientes A(k) (los de Y) del sistema
entrada=rand(1,1000)-0.5; %entrada aleatoria con media cero
y=filter(1,coef,entrada); %obtengo la salida
r=autocorr(y); %obtengo el vector de autocorrelacion
[a,g,e]=LevDur(r,10); %aplico algoritmo de Levinson-Durbin
a
g
e'

vp=prediccionFinal(e,r(1),10); %error de predicción final
ip=akaike(e,1000,10); %aplico criterio de Akaike

[a,g,e] = LevDur(r,4); %el sistema de orden optimo 4
a
g
e

figure(1)
plot(vp);
title('Error de predicción final Vp');
xlabel('Orden')
ylabel('Error')
figure(2)
plot(ip);
title('Errores Ip según criterio de Akaike');
xlabel('Orden')
ylabel('Error')
