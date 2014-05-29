%5.2)
t=-1:1/200:1;
N=length(t);
for i=1:N
  if t(i)<0
    y(i)=-1;
  else
    y(i)=1;
  end
end
phi1=sqrt(3/2)*t;
phi3=sqrt(7/2)*((5/2)*t.^3 - (3/2)*t);
alfa1=sqrt(3/2);
alfa3=-sqrt(7/32);

a1=alfa1-0.4:1/200:alfa1+0.4;
a3=alfa3-0.4:1/200:alfa3+0.4;
Err=zeros(length(a1),length(a3));
for i=1:length(a1)
  for j=1:length(a3)
    y_aprox = a1(i)*phi1 + a3(j)*phi3;
    for w=1:N
       Err(i,j) = Err(i,j) + (y(w)-y_aprox(w))*(y(w)-y_aprox(w)); 
    end

  end
end
mesh(a1,a3,Err);
%surf(a1,a3,Err);
