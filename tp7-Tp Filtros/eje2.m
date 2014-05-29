whitebg([1,1,.8])
clear all
close all 
clc
for i=1:6
[B,A]=filtro(i);
respfreq=freqz(B,A,2000,'whole');
plot(abs(respfreq),'r');title('ORDENES DE 1 A 6')
hold on
end