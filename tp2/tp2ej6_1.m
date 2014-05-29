clear all
clc
close all
[t,S1] = senoidal(1,1,0,100,0,2);
[t,S2] = senoidal(1,2,0,100,0,2);
[t,S3] = senoidal(1,3,0,100,0,2);
[t,S4] = senoidal(1,4,0,100,0,2);
[t,S5] = senoidal(2,5,0,100,0,2);
[t,S6] = senoidal(1,6,0,100,0,2);
[t,S7] = senoidal(1,7,0,100,0,2);
[t,S8] = senoidal(1,8,0,100,0,2);
[t,S9] = senoidal(1,9,0,100,0,2);
[t,S10]= senoidal(1,10,0,100,0,2);
N = length(S1);
figure(1)
plot(t,S1,t,S2,t,S3,t,S4,t,S5,t,S6,t,S7,t,S8,t,S9,t,S10)
title('grafico de todas la senoidales juntas generadas')


k1=1;
k2=1;
k3=1;
k4=1;
k5=6;
k6=2;
k7=3;
k8=0;
k9=4;
k10=3;
COMB = k1.*S1 + k2.*S2 + k3.*S3 + k4.*S4 + k5.*S5 + k6.*S6 + k7.*S7 + k8.*S8 + k9.*S9 + k10.*S10;
figure(2)
plot(t,COMB)
title('combinacion lineal de las señales generadas - COMB')
suma = zeros(10);
for i=1:1:N
    suma(1) = suma(1) + COMB(i)*S1(i);
    suma(2) = suma(2) + COMB(i)*S2(i);
    suma(3) = suma(3) + COMB(i)*S3(i);
    suma(4) = suma(4) + COMB(i)*S4(i);
    suma(5) = suma(5) + COMB(i)*S5(i);
    suma(6) = suma(6) + COMB(i)*S6(i);
    suma(7) = suma(7) + COMB(i)*S7(i);
    suma(8) = suma(8) + COMB(i)*S8(i);
    suma(9) = suma(9) + COMB(i)*S9(i);
    suma(10) = suma(10) + COMB(i)*S10(i);
end

figure(3)
bar(suma) %es mas parecida con las de mayor "k"
%de hecho Ki es la componente de la señal COMB en la señal Si
title('Producto Interno de COMB contra la Si senales')
