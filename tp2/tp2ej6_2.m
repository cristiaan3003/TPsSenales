clear all
close all
clc
%6.2
%senoidales con fase fija a cero y distinta frec
[t,S1] = senoidal(1,1,0,100,0,2);
[t,S2] = senoidal(1,2,0,100,0,2);
[t,S3] = senoidal(1,3,0,100,0,2);
[t,S4] = senoidal(1,4,0,100,0,2);
[t,S5] = senoidal(1,5,0,100,0,2);
[t,S6] = senoidal(1,6,0,100,0,2);
[t,S7] = senoidal(1,7,0,100,0,2);
[t,S8] = senoidal(1,8,0,100,0,2);
[t,S9] = senoidal(1,9,0,100,0,2);
[t,S10] = senoidal(1,10,0,100,0,2);

%senoidales con distinta fase  y distinta frec
[t,S1f] = senoidal(1,1,0,100,0,2);
[t,S2f] = senoidal(1,2,20,100,0,2);
[t,S3f] = senoidal(1,3,30,100,0,2);
[t,S4f] = senoidal(1,4,40,100,0,2);
[t,S5f] = senoidal(1,5,50,100,0,2);
[t,S6f] = senoidal(1,6,60,100,0,2);
[t,S7f] = senoidal(1,7,70,100,0,2);
[t,S8f] = senoidal(1,8,80,100,0,2);
[t,S9f] = senoidal(1,9,90,100,0,2);
[t,S10f]= senoidal(1,10,100,100,0,2);
figure(1)
plot(t,S1f,t,S2f,t,S3f,t,S4f,t,S5f,t,S6f,t,S7f,t,S8f,t,S9f,t,S10f)
title('senoidales con distinta fase')

N = length(S1);
k1=9;
k2=7;
k3=5;
k4=1;
k5=3;
k6=2;
k7=6;
k8=0;
k9=4;
k10=8;
% 

% no tendrian que ser todas mas o menos de la misma long las barras?
% k1=2;
% k2=2;
% k3=2;
% k4=2;
% k5=2;
% k6=2;
% k7=2;
% k8=2;
% k9=2;
% k10=2;

COMB2 = k1.*S1f + k2.*S2f + k3.*S3f + k4.*S4f + k5.*S5f + k6.*S6f + k7.*S7f + k8.*S8f + k9.*S9f + k10.*S10f;
figure(2)
plot(t,COMB2)
title('Combinacion de las senoidales con distinta fase')
    suma = zeros(1,10);
for i=1:1:N
    suma(1) = suma(1) + COMB2(i)*S1(i);
    suma(2) = suma(2) + COMB2(i)*S2(i);
    suma(3) = suma(3) + COMB2(i)*S3(i);
    suma(4) = suma(4) + COMB2(i)*S4(i);
    suma(5) = suma(5) + COMB2(i)*S5(i);
    suma(6) = suma(6) + COMB2(i)*S6(i);
    suma(7) = suma(7) + COMB2(i)*S7(i);
    suma(8) = suma(8) + COMB2(i)*S8(i);
    suma(9) = suma(9) + COMB2(i)*S9(i);
    suma(10) = suma(10) + COMB2(i)*S10(i);
end
figure(3)
bar(suma)
%bar(suma,'histc') %es mas parecida con las de mayor "k"
%de hecho Ki es la componente de la señal COMB en la señal Si
%el cambio de fase NO INFLUYE  o SI ?? NO PUEDO CONCLUIR!
title('grafico de barra del prod interno - ')
