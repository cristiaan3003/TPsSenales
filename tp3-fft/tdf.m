function X = tdf(y)
    N=length(y);
    X=zeros(N,1);
    for k=0:N-1 %desde frecuencia cero
        suma=0;
        for ii=0:N-1
            ss=exp(-(i*2*pi*k*ii)/N);
            suma = suma + y(ii+1)*exp(-(i*2*pi*k*ii)/N); %producto interno contra N exponenciales ortogonal
        end
        X(k+1)=suma; %guardo aculumado y paso a la siguiente
    end
end

