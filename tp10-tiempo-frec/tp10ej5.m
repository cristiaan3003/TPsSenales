fm=500;
t=0:1/fm:4.096-1/fm; %2^11 = 2048 muestras potencia de 2
sen=sin(2*pi*exp(t)); 
figure(1); 
espec=espectrograma(sen',blackman(512),10); 
imagesc(t,[0 fm/2],espec);
xlabel('Tiempo')
ylabel('Frecuencia')
axis xy

n=length(sen);
[a,d]=todd(sen,ondita('daubechies',6),8);
figure(2)
escalogramad(a,d,n,8);

[a,d]=todd(sen,ondita('symlets',6),8);
figure(3)
escalogramad(a,d,n,8);

[a,d]=todd(sen,ondita('haar'),8);
figure(4)
escalogramad(a,d,n,8);

[a,d]=todd(sen,ondita('meyer'),8);
figure(5)
escalogramad(a,d,n,8);

figure(8)
tocon(sen,1,500,1);
