clear all
close all
clc
%[t,x]=senoidal(A,f,tita,fm,t_ini,t_fin)
[t,s1]=senoidal(1,1,0,100,0,3);
[t,s2]=senoidal(1,3,0,100,0,3);
%item 1 y item 2
y1=conv(s1,s2);
subplot(3,1,1)
plot(y1);
title('convolucion con ciclos for');
%y2= "x"  convolucion "y".
%1=a(1)
%y=B=b(1)b(2)...b(N)
y2=filter(s2,1,[s1 zeros(1,length(s1)-1)]);
subplot(3,1,2)
plot(y2);
title('convolucion filter MatLaB');
subplot(3,1,3)
plot(y2-y1);
title('diferencia filter - conv');




