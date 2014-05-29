function [ zeros ] = zeroCro( entrada )
    zeros = 0; % cuenta los cruces por cero de la entrada
    for j=2:length(entrada)
        if (entrada(j-1)>0 && entrada(j)<0) || (entrada(j-1)<0 && entrada(j)>0)
            zeros = zeros+1;
        end
    end
end