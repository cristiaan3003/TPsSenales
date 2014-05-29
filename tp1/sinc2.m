function [t,xx] = sync (t_ini, t_fin, fs, fm )
 dt = 1/fm; 
 t = t_ini:dt:t_fin-dt;
 x = 2*pi*fs*t;
 xx = sinc(x);
end
%[t,xx]=sinc2_ejer1(-1,1,5,100);
%plot(t,xx)