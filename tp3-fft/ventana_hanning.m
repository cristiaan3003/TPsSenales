function [w] = ventana_hanning(N)
    w=zeros(N,1);
    for i=1 : 1 : N
        w(i)=0.5 - 0.5*cos((2*pi*i)/N);
    end

