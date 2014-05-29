clear all
close all
clc
delta=[0,1,0,0,0,0,0,0,0,0,0];
n=length(delta);
x=zeros(n,1);
t(1:n)=1:n; 
a=1/232;
for i=2 : n
    x(i)=delta(i)+a*delta(i-1);
end

ha=zeros(1,100);
for q=1:100
    ha(q)=sin(8*q);
end

w=conv(x,ha);
%figure(1)
%plot(x);

u=[0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
hb=zeros(length(u),1);

for kk=1: length(u)
    hb(kk)=a^kk.*u(kk); % aca se observa la propiedad de desplazamiento, al multiplicar por "uu" arranca 8 lugares mas a la derecha, tiene 8 ceros al ppio
end

y=conv(w,hb);
figure(2)
plot(y)