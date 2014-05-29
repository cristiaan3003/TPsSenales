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

%[tt,ha]=senoidal(1,1,0,100,0,4);

u=[0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
l=length(u);
hb=zeros(l,1);

for kk = 1: 1: l
    hb(kk)=a^kk.*u(kk);
end

w=conv(x,hb);
y=conv(w,ha);
figure(2)
plot(y)