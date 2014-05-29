%señal A=S2
[t,S2]=senoidal(1,2,0,100,0,1);
N = length(S2);
%señal B=SQ
SQ = square(t*2*2*pi);
%señal C=S4
[t,S4]=senoidal(1,4,0,100,0,1);
%1
es1 = interno(S2,SQ);%no es .Domino Tiempo
es2 = interno(S2,S4);%es. Domino Tiempo
es3 = interno(SQ,S4);%es. Domino Tiempo

%2
Tes1 = interno(fft(S2),fft(SQ)); %no es.Domino FRECUENCIAL
Tes2 = interno(fft(S2),fft(S4));%es.Domino FRECUENCIAL
Tes3 = interno(fft(SQ),fft(S4));%es.Domino FRECUENCIAL

%3
[t,S35]=senoidal(1,3.5,0,100,0,1);
Tes4 = interno(fft(S2),fft(S35));%es Domino FRECUENCIAL
Test44 = interno(S2,S35); % es  dominio TEMPORAL
stem(abs(fft(S35)))
%plot(t,S2,t,S4,t,SQ)