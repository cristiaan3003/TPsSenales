%5.1
t=-1:1/200:1;
N=length(t);
y=zeros(N,1);
for i=1:N
  if t(i)<0
    y(i)=-1;
  else
    y(i)=1;
  end
end
alfa1=sqrt(3/2);
alfa3=-sqrt(7/32);
phi1=sqrt(3/2)*t;
phi3=sqrt(7/2)*((5/2)*t.^3 - (3/2)*t);
y_aprox = alfa1*phi1 + alfa3*phi3;
ErrorCT=0;
for i=1:N
   ErrorCT = ErrorCT + (y(i)-y_aprox(i))*(y(i)-y_aprox(i)); 
end
plot(t,y,t,y_aprox);  
ErrorCT

% 5-1:   ErrorCT = 56.3977