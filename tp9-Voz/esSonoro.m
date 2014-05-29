function[R]=esSonoro(x)
    cruces=zeroCro(x);
    potencia=sum(x.^2)/length(x);
    coeficiente=log(potencia/cruces);
    if(coeficiente < -12.60)
        R=false;
    else
        R=true;
    end
end