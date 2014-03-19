function [x]=lineal(t)
  n=length(t)
  x=zeros(n)
  for i=1:n
    if abs(t(i))<1
      x(i)=1-abs(t(i))
    else
      x(i)=0
    end
  end
end
  