clear all
close all
clc
 num=[1 -2 2 -1];
 den=[1 -1.7 0.8 -0.1];
 [Z,P,K]=TF2ZP(num,den);
 figure (1)
 sys=tf(num,den)
%item1
 zplane(Z,P);
 figure(2)
 %item 2 
 impulse(sys)
 