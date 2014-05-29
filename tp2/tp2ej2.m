%el espacio es el conjunto de:
%{S | S(t)=A*sin(2*pi*f*t+alpha) / A,alpha pertenecen a los reales R and
%f=cte }
%[t,x]=senoidal(A,f,tita,fm,t_ini,t_fin)

%senoidales genericas (distinta amplitud, frecuencia y fase)
[t,S1] = senoidal(1,5,0,1000,0,3);
[t,S2] = senoidal(4,15,5,1000,0,3);
NoDa = S1+S2;
figure(1)
plot(t,NoDa)
title('senoidales genericas (distinta amplitud, frecuencia y fase)');

%senoidales con misma fase, distinta frecuencia y amplitud
[t,S3] = senoidal(4,15,0,1000,0,3);
NoDa2 = S1+S3;
figure(2)
plot(t,NoDa2)
title('senoidales con misma fase, distinta frecuencia y amplitud');

%senoidales con misma amplitud, distinta frecuencia
[t,S4] = senoidal(4,5,0,1000,0,3);
NoDa3 = S3+S4;
figure(3)
plot(t,NoDa3)
title('senoidales con misma amplitud, distinta frecuencia');

%senoidales con misma frecuencia y fase, distinta amplitud
[t,S5] = senoidal(6,5,0,1000,0,3);
SiDa = S1+S5;
figure(4)
plot(t,SiDa)
title('senoidales con misma frecuencia y fase, distinta amplitud');

%senoidales con misma frecuencia y distinta amplitud y fase
[t,S6] = senoidal(1,5,4*pi/5,1000,0,3);
[t,S7] = senoidal(3,5,0,1000,0,3);
SiDa2 = S6+S7;
figure(5)
plot(t,SiDa2,'r*',t,S6,'g-',t,S7)
title('senoidales con misma frecuencia y distinta amplitud y fase');

PorEscalar = SiDa.*4;
figure(6)
plot(t,PorEscalar); %da bien
title('senoidales PorEscalar');

figure(7);
test= 9*(S6+S7);
test2 = 9*S6+9*S7;
dif = test - test2;
plot( t, test, 'g+', t, test2, 'r*', t, dif, 'b.' );
title( 'Distributivo');