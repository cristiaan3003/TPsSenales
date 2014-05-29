function X = tdfi(y)
    N=length(y);
    X=zeros(N,1);
    for k=0:N-1
        suma=0;
        for ii=0:N-1
            suma = suma + y(ii+1)*exp((1i*2*pi*k*ii)/N);
        end
        X(k+1)=suma/N;
    end
end

