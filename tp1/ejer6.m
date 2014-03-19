%//t1 es el vector de tiempo original 
%//t2 es el nuevo vector de tiempo con la frecuencia de muestreo nueva.
%//T es el periodo de nuestra funcion
%// x la funcion interpolada

%//T=1/fm
fm1=10; T1=1/fm1; t1=0:T1:(1-T1); N1=length(t1);
y1=sin(2*pi*t1);
figure(1)
stem(t1,y1); title(' seno - fm=10');

fm2=40; 
T2=1/fm2; 
t2=0:T2:(1-T2); 
N2=length(t2);
y2=sin(2*pi*t2);
figure(2)
stem(t2,y2,'r-'); title(' seno - fm=40');

%//interpolacion lineal
x=zeros(1,N2)
for i=1:N2
  for j=1:N1
   % x(i)=(y1(i))*lineal((t2(j)-(N1*T1))/T1);
     x(i)=((y1(j)*(N1*T1))*lineal((t2(j)-(N1*T1))/T1))+x(i);
  end
end
figure(3)
stem(t2,x,'g-'); title('Interp Lineal - seno  fm=40');
  

      