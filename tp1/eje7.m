%ejercicio 7
%verificar estacionariedad y ergoricidad
%Calcule la media y la varianza ahora, 
%utilizando las funciones Matlab mean y std(std al cuadrado = a varianza).
clear all
clc
tol=0.001;
x=randn(500,500);
%display ('estacionalidad ');
mest=mean(x);
vest=std(x).^2;
a=mean(mest);
b=mean(vest);
%display ('ergo ');
merg=mean(x,2);
verg=std(x,0,2).^2;
c=mean(merg);
d=mean(verg);

 if ((a-c)<tol && (b-d)<tol)
     display('ergodica');
 else
     display('no ergodica');
 end
