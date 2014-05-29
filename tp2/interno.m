function [answer] = interno(X,Y)
    suma=0;
    for i=1:length(X)
        suma = suma + X(i)*conj(Y(i));
    end
    answer=suma;
end

