%consideracion
%t=2*pi*fs*t con t perteneciente al (-1,1)
% t=-1:0.01:1;
%x=2*pi*10*t;
%xx=sinc(x)
%plot(xx)
function [x]=sync(t)
  x=zeros(1,length(t));
  n=length(t);
  for r=1:n
    if t(r)==0
      x(r)=1;
    else
    x(r)=sin(t(r))/t(r);
  end
  end
end