%6.3
%senoidales de distinta freciencia y fase cero
[t,S1] = senoidal(1,1,0,100,0,20);
[t,S2] = senoidal(1,2,0,100,0,20);
[t,S3] = senoidal(1,3,0,100,0,20);
[t,S4] = senoidal(1,4,0,100,0,20);
[t,S5] = senoidal(1,5,0,100,0,20);
[t,S6] = senoidal(1,6,0,100,0,20);
[t,S7] = senoidal(1,7,0,100,0,20);
[t,S8] = senoidal(1,8,0,100,0,20);
[t,S9] = senoidal(1,9,0,100,0,20);
[t,S10] = senoidal(1,10,0,100,0,20);

%square tiene periodo 2*pi --> para frecuencia 5,5 multiplico por 34,56
SQ2 = square(t.*2*pi*5.5);
N = length(SQ2);
%plot(t,SQ)
suma = zeros(10);
for i=1:1:N
    suma(1) = suma(1) + SQ2(i)*S1(i);
    suma(2) = suma(2) + SQ2(i)*S2(i);
    suma(3) = suma(3) + SQ2(i)*S3(i);
    suma(4) = suma(4) + SQ2(i)*S4(i);
    suma(5) = suma(5) + SQ2(i)*S5(i);
    suma(6) = suma(6) + SQ2(i)*S6(i);
    suma(7) = suma(7) + SQ2(i)*S7(i);
    suma(8) = suma(8) + SQ2(i)*S8(i);
    suma(9) = suma(9) + SQ2(i)*S9(i);
    suma(10) = suma(10) + SQ2(i)*S10(i);
end
bar(suma,'histc');
figure(2);
plot( t, SQ2 );