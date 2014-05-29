close all
clear all
clc
sent=load('sent.txt');
figure('name','Espectrograma con tamaño de ventana 100 y paso 50') %Espectrograma con tamaño de ventana 100 y paso 50
a=espectrograma(sent,blackman(100),50);
figure('name','Espectrograma con tamaño de ventana 200 y paso 25') %Espectrograma con tamaño de ventana 200 y paso 25
b=espectrograma(sent,blackman(200),25);
figure('name','Espectrograma con tamaño de ventana 200 y paso 200') %Espectrograma con tamaño de ventana 200 y paso 200
c=espectrograma(sent,blackman(200),200);
figure('name','Espectrograma con tamaño de ventana 400 y paso 75') %Espectrograma con tamaño de ventana 400 y paso 75
d=espectrograma(sent,blackman(400),75);
figure('name','Espectrograma con tamaño de ventana 600 y paso 300') %Espectrograma con tamaño de ventana 600 y paso 300
e=espectrograma(sent,blackman(600),300);