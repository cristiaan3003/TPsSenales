h=[0,1,0,1,0,1,0,1,0,1];
%x, es una entrada periodica
x=[1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10];
[t,s]=senoidal(1,1,0,30,100);
%figura con conv  lineal de matlab
r=conv(h,x);
figure(1)
plot(r);
%figura conv lineal nuestra
r2=convolucion(x,h);
figure(2)
plot(r2)
% s:entrada periodica,numeros de una senoidal
r3=convolucion(s,h);
figure(3)
plot(r3)