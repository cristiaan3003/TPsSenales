function [t,x]=cuadrada(t_ini,t_fin,fs,fm,tita)
dt=1/fm;
t=t_ini:dt:t_fin-dt;
x=zeros(1,length(t));
for i=1:length(t)
    if(mod(2*pi*fs*t(i)+tita,2*pi)>=pi)
        x(i)=-1;
    else
        x(i)=1;
end

end
end