function [y] = Gabor(n) %genera una ventana gausiana de n muestras
    t = (-1 : 2/(n-1) : 1);
    y = exp(1).^((-18*t.^2)/2);
    y=y';
end
