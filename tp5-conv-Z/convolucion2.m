% convolucion con fft (se usa convolucion circular y el resultado final es el resultado de la conv lineal)
function[Y]=convolucion2(X,h)
M=length(X);
N=length(h);
XX=[X(1:M) zeros(1,(M-1))];
hh=[h(1:N) zeros(1,(N-1))];
Y=ifft(fft(XX).*fft(hh));
end