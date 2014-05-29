close all
clear all
clc
%fm=1000;
%whitebg([1,1,.8])
%polos
radio_polo =0.95;
p(1)= radio_polo *(cos(pi/4) + j*sin(pi/4));
p(2)= radio_polo *(cos(-pi/4)+ j*sin(-pi/4));
p(3)= radio_polo *(cos(pi/4) + j*sin(pi/4));
p(4)= radio_polo *(cos(-pi/4)+ j*sin(-pi/4));

%ceros
radio_cero =0.80;
%euler e^jw=cos (tita)+ j*sin(tita)
c(1)= radio_cero *(cos(pi/6) + j*sin(pi/6));
c(2)= radio_cero *(cos(-pi/6)+ j*sin(-pi/6));
c(3)= radio_cero *(cos(pi/3) + j*sin(pi/3));
c(4) =radio_cero *(cos(-pi/3)+ j*sin(-pi/3)); 
figure('name','Ejercicio 1 - item a');
zplane(c',p');
title('Diagrama de polos y Ceros')
% %b)----------------------------------------------------------------------
b=poly(c); 
a=poly(p); 
fm=1000
r=freqz(b,a,fm/2,fm);%freqz(b,a,1000,'whole'); 0 a 2pi
%r=freqz(b,a,fm,'whole');
% graficamos
figure('name','Ejercicio 1 - item b');
stem(abs(r)); 
xlabel('frecuencias')
ylabel('mag')
title('Respuesta en frecuencia del filtro entre 0 y Pi .')

% %c)-----------------------------------------------------------------------
figure('name','Ejercicio 1 - item c');
h=freqz(b,a,fm/2,fm) / max(freqz(b,a,fm/2,fm));
stem(abs(h));
xlabel('frecuencias')
ylabel('mag')
title('freqz del filtro entre 0 y Pi NORMALIZADA .')


% %d)-----------------------------------------------------------------------

%polos con radio 0.7
radio_polo2=0.7;
p2(1)=radio_polo2 *(cos(pi/4)+sin(pi/4)*i);
p2(2)=radio_polo2 *(cos(-pi/4)+sin(-pi/4)*i);
p2(3)=radio_polo2 *(cos(pi/4)+sin(pi/4)*i);
p2(4)=radio_polo2 *(cos(-pi/4)+sin(-pi/4)*i);

%polos con radio 5
radio_polo3=5; 
p3(1)=radio_polo3 *(cos(pi/4)+sin(pi/4)*i);
p3(2)=radio_polo3 *(cos(-pi/4)+sin(-pi/4)*i);
p3(3)=radio_polo3 *(cos(pi/4)+sin(pi/4)*i);
p3(4)=radio_polo3 *(cos(-pi/4)+sin(-pi/4)*i);

%transformo a polinomio
b=poly(c);
a1=poly(p);
a2=poly(p2);
a3=poly(p3);

% calculo respuesta en frecuencia
rf1=freqz(b,a1,fm/2,fm);
rf2=freqz(b,a2,fm/2,fm);
rf3=freqz(b,a3,fm/2,fm);

figure('name','Ejercicio 1 - item d- Zplane');
subplot(3,1,1);zplane(c',p');title('polos r=0.95 - Radio Original del Ejercicio')
subplot(3,1,2);zplane(c',p2');title('polos r=0.7')
subplot(3,1,3);zplane(c',p3');title('polos r=5')

%grafico para comparar
figure('name','Ejercicio 1 - item d');
subplot(3,1,1); stem(abs(rf1));
xlabel('frecuencias')
ylabel('mag')
title('Respuesta en frecuencia Modificando el Radio de los polos - r=0.95 - Radio Original del Ejercicio')
subplot(3,1,2); stem(abs(rf2));
xlabel('frecuencias')
ylabel('mag')
title('Respuesta en frecuencia Modificando el Radio de los polos - r=0.7 ') 
subplot(3,1,3); stem(abs(rf3));
xlabel('frecuencias')
ylabel('mag')
title('Respuesta en frecuencia Modificando el Radio de los polos - r=5')

% %e)------------------------------------------------------------------------
% 
% 
%construyo la señal senoidal muestreada a 200hz
fm=200;
dt=1/fm;
t_tot=1;
t=[0:dt:t_tot-dt];
s=sin(2*pi*t*15) + sin(2*pi*t*25);

%diseño el filtro (ej_1_a)
%polos
radio_polo =0.95;
p(1)= radio_polo *(cos(pi/4) + j*sin(pi/4));
p(2)= radio_polo *(cos(-pi/4)+ j*sin(-pi/4));
p(3)= radio_polo *(cos(pi/4) + j*sin(pi/4));
p(4)= radio_polo *(cos(-pi/4)+ j*sin(-pi/4));

%ceros
radio_cero =0.80;
c(1)= radio_cero *(cos(pi/6) + j*sin(pi/6));
c(2)= radio_cero *(cos(-pi/6)+ j*sin(-pi/6));
c(3)= radio_cero *(cos(pi/3) + j*sin(pi/3));
c(4) =radio_cero *(cos(-pi/3)+ j*sin(-pi/3));

%transformo a polinomio b=poly(c);
a=poly(p); %polos
b=poly(c); %ceros
%normalizo los coeficientes 
r=freqz(b,a,fm/2,fm); %respuesta en frecuencia 0,pi sin normalizar
alfa=1/max(abs(r)); %factor de ponderacion
b=b*alfa; %normalizo
sys=tf(b,a)

%filtro la señal 
sfil=filter(b,a,s);
figure('name','Ejercicio 1 - item e');
%grafica de la señal(antes y después de filtrarla):
subplot(4,1,1), plot(t,s);
xlabel('tiempo')
title('grafica de la señal antes  de filtrarla');
subplot(4,1,2), plot(t,sfil);
xlabel('tiempo')
title('grafica de la señal despues  de filtrarla');
%espectro en frecuencia de la señal (antes y después):
subplot(4,1,3),stem(abs(fft(s))); 
xlabel('frecuencias')
ylabel('mag')
title('Espectro sin filtrar')
subplot(4,1,4),stem(abs(fft(sfil)));
xlabel('frecuencias')
ylabel('mag')
title('Espectro filtrado')


% 
% % %f----------------------------------------------------------------------
%construyo la señal senoidal muestreada a 120hz
fm=120;
dt=1/fm;
t_tot=1;
t=[0:dt:t_tot-dt];
s=sin(2*pi*t*15) + sin(2*pi*t*25);

%diseño el filtro
%polos
radio_polo =0.95;
p(1)= radio_polo *(cos(pi/4) + j*sin(pi/4)); 
p(2)= radio_polo *(cos(-pi/4)+ j*sin(-pi/4));
p(3)= radio_polo *(cos(pi/4) + j*sin(pi/4));
p(4)= radio_polo *(cos(-pi/4)+ j*sin(-pi/4));
%ceros
radio_cero =0.80;
c(1)= radio_cero *(cos(pi/6) + j*sin(pi/6));
c(2)= radio_cero *(cos(-pi/6)+ j*sin(-pi/6)); 
c(3)= radio_cero *(cos(pi/3) + j*sin(pi/3)); 
c(4) =radio_cero *(cos(-pi/3)+ j*sin(-pi/3));

%transformo a polinomio
b=poly(c);
a=poly(p);

%normalizo los coeficientes del polinomio
r=freqz(b,a,120); alfa=1/max(abs(r)); b=b*alfa;

%filtro la señal 
sfil=filter(b,a,s);
figure('name','Ejercicio 1 - item f');
%grafica de la señal(antes y después de filtrarla):
subplot(4,1,1), plot(t,s);
xlabel('tiempo')
title('grafica de la señal antes  de filtrarla');
subplot(4,1,2), plot(t,sfil);
xlabel('tiempo')
title('grafica de la señal despues  de filtrarla');
%espectro en frecuencia de la señal (antes y después):
subplot(4,1,3),stem(abs(fft(s))); 
xlabel('frecuencias')
ylabel('mag')
title('Espectro sin filtrar')
subplot(4,1,4),stem(abs(fft(sfil)));
xlabel('frecuencias')
ylabel('mag')
title('Espectro filtrado')
