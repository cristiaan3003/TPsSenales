clear all
close all
clc
%Butterworth
[Nbut, Wnbut] = buttord([2500/5000 3000/5000 ], [2300/5000 3200/5000], 0.7, 55)
[Bbut, Abut] = butter(Nbut, Wnbut);
figure('name','Ejercicio 3 - Butterworth');
plot(abs(freqz(Bbut,Abut,5000)));title('Butterworth')

%orden y frecuencia para filtro pasabanda de Chebyshev 1
[Ncheb1,Wncheb1]=cheb1ord([2500/5000 3000/5000],[2300/5000 3200/5000],0.7,55) 
%partir de estos datos generamos el filtro de Chebyshev 1
[Bcheb1,Acheb1] = cheby1(Ncheb1, 0.7, Wncheb1);
figure('name','Ejercicio 3 - Chebyshev 1');
plot(abs(freqz(Bcheb1,Acheb1,5000)));title('Chebyshev 1')

%Obtenemos orden y frecuencia para filtro pasabanda de Chebyshev 2
[Ncheb2, Wncheb2] = cheb2ord([2500/5000 3000/5000], [2300/5000 3200/5000] ,0.7, 55) 
%a partir de estos datos generamos el filtro de Chebyshev 2
[Bcheb2, Acheb2] = cheby2(Ncheb2, 55, Wncheb2);
figure('name','Ejercicio 3 - Chebyshev 2');
plot(abs(freqz(Bcheb2,Acheb2,5000)));title('Chebyshev 2')
% 
%Obtenemos orden y frecuencia para filtro pasabanda elíptico
[Nelip,Wnelip]=ellipord([2500/5000 3000/5000],[2300/5000 3200/5000],0.7,55) 
%partir de estos datos generamos el filtro elíptico
[Belip ,Aelip] = ellip(Nelip, 0.7, 55, Wnelip);
figure('name','Ejercicio 3 - eliptico');
plot(abs(freqz(Belip,Aelip,5000)));title('elíptico')



%Vemos que el orden mínimo es el del filtro elíptico con un valor 5.
%Comparamos que pasa con el resto de los filtros utilizando este orden
%Butterworth
[Bbut5,Abut5]=butter(5,Wnbut);
[Bcheb1_5,Acheb1_5] = cheby1(5, 0.7, Wncheb1);
[Bcheb2_5, Acheb2_5] = cheby2(5, 55, Wncheb2);

figure('name','Ejercicio 3 - Butterworth Orden 5');
plot(abs(freqz(Bbut,Abut,5000))); title ('Butterworth Orden 5 (red) vz Butt Nbut')
hold on
plot(abs(freqz(Bbut5,Abut5,5000)),'r'); 




figure('name','Ejercicio 3 - Chebyshev 1 orden 5');
plot(abs(freqz(Bcheb1,Acheb1,5000)));title ('Bcheb1 Orden 5(red)')
hold on
plot(abs(freqz(Bcheb1_5,Acheb1_5,5000)),'r')


figure('name','Ejercicio 3 - Chebyshev 2 orden 5');
plot(abs(freqz(Bcheb2, Acheb2,5000)));title ('Bcheb2 Orden 5(red)')
hold on
plot(abs(freqz(Bcheb2_5, Acheb2_5,5000)),'r')


