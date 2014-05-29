function [y] = Gabor50(n) %genera una ventana gausiana de n muestras
    t = (-1:2/(n-1):1);
    y = exp(1).^((-25*t.^2)/2); %utilizo 50 para cambiar el tamaño del atomo tiempo frecuencia
    y=y';
end

