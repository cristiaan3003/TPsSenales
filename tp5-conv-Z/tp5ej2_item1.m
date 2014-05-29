clear all
close all
clc
%[t,x]=senoidal(A,f,tita,fm,t_ini,t_fin)
[t,s1]=senoidal(1,1,0,100,0,3);
[t,s2]=senoidal(1,3,0,100,0,3);
%item 1 y item 2
y1=convolucion(s1,s2);
subplot(3,1,1)
plot(y1);
title('convolucion con ciclos for');
y2=conv(s1,s2);
subplot(3,1,2)
plot(y2);
title('convolucion MatLaB');
subplot(3,1,3)
plot(y2-y1);
title('diferencia Conv MatLab - ciclo For');


