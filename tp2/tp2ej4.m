clear all
close all
t=-1:1/1000:1
S1 = exp(i*2*pi*t);
S2 = exp(i*2*pi*t*2); 
y1=real(S1);
z1=imag(S1);
y2=real(S2);
z2=imag(S2);
S3 = S1+S2;
y3=real(S3);
z3=imag(S3);
figure(1)
plot3(t,y1,z1);
title(' exp 1')
figure(2)
plot3(t,y2,z2)
title(' exp 2')
figure(3)
plot3(t,y3,z3)
title('suma de exp 1 y 2')
figure(4)
plot3(t,y1,z1,t,y2,z2);
title(' exp 1 y exp 2 graficadas juntas')
figure(5)
plot3(t,y1,z1,t,y2,z2,t,y3,z3) %NO DAAAAAA con distintas frecuencias!!!
title(' grafica de las 3 exp')

Conj = [S1;S2;S3]
resultado = zeros( 3, 3 );
for i=1:3
    for j=1:3
        resultado(i,j) = interno( Conj(i,:), Conj(j,:) );
    end
end
disp(resultado );