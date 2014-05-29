function[B,A]=filtro(orden)
%datos del problema
fm=2000;
fcorte=2*pi*500; % Hz  to  rad/s
T=1/fm;

%dependiendo del orden se seleccionan los coeficientes del denominador
%del polinomio de la función de transferencia analógica H(s)

switch(orden)
case 1
q=[1 1];
case 2
q=[1 sqrt(2) 1];
case 3
q=[1 2 2 1];
case 4
q=[1 2.6161 3.4142 2.6131 1];
case 5
q=[1 3.2361 5.2361 5.2361 3.2361 1];
case 6
q=[1 3.8637 7.4641 9.1416 7.4641 3.8637 1];
end

% calculamos las raíces del polinomio
p=roots(q); %raices
n=length(p);

%A y B coeficientes “finales” del filtro
A=[1];
B=[1];

for i=1:n
%calculamos los coeficientes a y b de la función de transferencia
%para cada raíz
a(1)= fcorte * T - 2 * p(i);
a(2)= fcorte * T + 2 * p(i);
b(1)= 2;
b(2)= -2;
%luego vamos convolucionando con A y B para obtener los coeficientes
%finales del filtro
A=conv(A,a);
B=conv(B,b);
end
end
