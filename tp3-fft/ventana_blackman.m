function [w] = ventana_blackman(N)
w=zeros(N,1);
for i=1 : 1 : N
    w(i)=21/50 - 0.5*cos((2*pi*i)/N)+ (2/25)*cos((4*pi*i)/N);
end

