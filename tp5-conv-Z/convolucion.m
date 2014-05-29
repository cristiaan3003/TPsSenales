function [ Y ] = convolucion(X,h)
    M = length(X);
    N = length(h);
    Y = zeros(M+N-1,1);
    for i=0:M-1
        for j=0:N-1
            Y(i+j+1) = X(i+1)*h(j+1)+Y(i+j+1);
        end
    end
    Y=Y';
end