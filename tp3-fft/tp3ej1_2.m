[t,S1] = senoidal(1,10,0,1000,0,2);
[t,S2] = senoidal(4,20,0,1000,0,2);
S=S1+S2;
N=length(S);
X=fft(S);

sumaS = 0;
sumaX = 0;
for t=1:N
    sumaS = sumaS + S(t)*S(t);
    sumaX = sumaX + abs(X(t))*abs(X(t));
end
sumaX = sumaX/N;
sumaS
sumaX
%da igual!!!