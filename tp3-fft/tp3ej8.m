%1
[t,S27] = senoidal(2,27,0,1,50);
subplot(2,1,1)
plot(t,S27)
subplot(2,1,2)
plot(abs(fft(S27)))
%las discrepancias se deben a que la fm es menor que 2*f de la senoidal, es
%decir no se respeta el teorema del muestreo

%2
% tengo mis dudas, despues voy a rapasar esto

%fm=1/Tm
%t=n*Tm
% n=0,1,...,n
% 
% fs=fm/2*k +- l  (l seria el 23 en el ejercicio)
% 
% cos(2*pi*fs*t)= cos(2*pi*fs*n*Tm)= 
% 
% 	      = cos(2*pi*(fm/2*k + l)*n*Tm 
% 
% 	      = cos(2*pi*n*Tm*(fm/2)*k + 2*pi*l*n*Tm) = cos(pi*n*k + 2*pi*l*t)
% 
% 	      =cos(2*pi*l*t) (l= -23 en el ejercicio)
	

%3
%M=(A*fm*t_tot)/2
