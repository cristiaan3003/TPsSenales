%ejemplo de que la convolucion contra un impulso
%,caracteriza completamente al sistema
%convolucionar contra un delta de dirac es como multiplicar por uno.
clear all
N=100;
x=zeros(1,N);x(1)=1;%impulso
y=zeros(1,N);
y(1)=(1/6)*x(1);
y(2)= (1/6)*(x(2)-2*x(1)+4*y(1));
for n=3:N
    y(n)=(1/6)*(x(n)-2*x(n-1)+x(n-2)+4*y(n-1)-5*y(n-2));
end
m=conv(y,x)
subplot(3,1,1);
plot(y);title('dandole valores a pata al sistema');
subplot(3,1,2);
plot(m(1:100));title('conv contra al respuesta calculada anterior')
subplot(3,1,3)
plot(y-m(1:100));title('la diferencia es cero')