function [t,x]=senoidal(A,f,tita,fm,t_ini,t_fin)
  dt=1/fm;
  t=t_ini:dt:t_fin-dt ;
  x=A*sin(2*pi*f*t+tita);
end
%[t,x]=senoidal(1,5,0,100,0,2)
