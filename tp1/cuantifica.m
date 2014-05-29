% N = Cantidad de niveles
% x = Valores
function[x]=cuantifica(x,N)
% evita las funciones con valores negativos
valmin=min(x);
if( valmin < 0 ) 
    x = x-valmin;
end
H=max(x)/N;
for i=1:length(x)
    if (x(i)<0)
        x(i)=0;
    end
    if(x(i)>= 0 && x(i)< ((N-1)*H))
        x(i)=H*floor(x(i)/H);
    end
    if(x(i)>= (N-1)*H)
        x(i)=(N-1)*(H);
    end
end
if( valmin < 0 ) 
    x = x+valmin;
end
end
%[t,x]=senoidal(1,5,0,100,0,2);
%[xX]=cuantifica(x,2);
%stem(t,xX)

%[t,x]=senoidal(1,20,0,2000,0,2);
%abs_x=abs(x);
%[xxx]=cuantifica(abs_x,8);
%stem(t,xxx)


  