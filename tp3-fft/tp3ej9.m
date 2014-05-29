m1 = load('merval1.txt');
m2 = load('merval2.txt');
Tm1 = fft(m1);
N = length(m1);
X = [Tm1(1:N/2); zeros(N,1); Tm1(N/2+1:N);];
inter = ifft(X).*2;%el 2 es xq al aumentar el numero de puntos al doble, la mag de los palitos se va ver reducido a la mitad

subplot(4,1,1);stem(m1);title('MERVAL 1')

subplot(4,1,2);stem(real(inter));title('MERVAL 1 INTERPOLADA')

subplot(4,1,3);stem(m2);title('MERVAL 2')

subplot(4,1,4);error= m2 - inter;stem(abs(error));title('Error m2- intepolacion m1');
