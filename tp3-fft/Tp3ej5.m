close all
clear all
clc
[t,xs] = senoidal(1,10,0,100,0,2);
xd = delta_dirac(length(xs));
%xs es la señal senoidal, xd es la delta de dirac
%xsf y xdf son sus respectivas transformadas de Fourier

xsf = fft(xs); %transf senoidal
xdf = fft(xd); %tranformada delta

%xsfCortada = fft(xs); %
%xdfCortada = fft(xd); %

figure('Name','Sin ventana','NumberTitle','off');
 subplot(2,1,1);
 plot(xs);
 title('senoidal')
 subplot(2,1,2);
 plot(abs(fft(xs)));
  title('fft senoidal')

%%ventana de hanning
% %% con la senoidal
  corte = length(xs)/3; %sera la longitud de la ventana
  ventana = ventana_hanning(corte); %calculo la ventana
  vect_ventana=zeros(length(xs),1); %vector de ceros para poner la ventana
  vect_ventana(corte:(corte*2)-1) = ventana(1:corte); %sumo la ventana al vector anterior.coloco la ventana en la mitad
  xsVentana = xs.* vect_ventana'; %utilizo la ventana
  xsfVentana = fft(xsVentana); %transformada de la ventana
   
%    sin ventana
figure('Name','Ventana de hanning Senoidal','NumberTitle','off');
   subplot(4,1,1);
   plot(xs);
    title('senoidal')
   subplot(4,1,2);
   plot(abs(fft(xs)));
    title(' fft senoidal')
   
%   con ventana
   subplot(4,1,3);
   plot(xsVentana);
    title('senoidal ventaneada')
   subplot(4,1,4);
   plot(abs(xsfVentana));
    title('fft senoidal ventaneada')



% %% con la delta de dirac
% 
% 
corte = length(xd)/3; %sera la longitud de la ventana
ventana = ventana_hanning(corte); %calculo la ventana
vect_ventana=zeros(length(xd),1); %vector de ceros para poner la gentana
vect_ventana(1:corte) = ventana(1:corte); %sumo la ventana al vector anterior

%% bolazo para tirar el delta en el medio
vect_ventana(corte:(corte*2)-1) = ventana(1:corte);
xd(length(xd)/2)=1;


xdVentana = xd.* vect_ventana; %utilizo la ventana
xdfVentana = fft(xdVentana); %su transformada

 figure('Name','Ventana de blackman Delta','NumberTitle','off'); 
%sin ventana (ACA HACE FRUTA !!! )
 subplot(4,1,1);
 plot(xd);
  title('Delta')
 subplot(4,1,2);
 plot(abs(fft(xd)));
  title('fft Delta')
 %con ventana
  subplot(4,1,3);
  plot(xdVentana);
   title('Delta')
  subplot(4,1,4);
  plot(abs(xdfVentana));
   title('fft Delta')
% 


% %%
% %%ventana de blackman
 %con la senoidal
 corte = length(xs)/3; %sera la longitud de la ventana
 ventana = ventana_blackman(corte); %calculo la ventana
 vect_ventana=zeros(length(xs),1); %vector de ceros para poner la gentana
 vect_ventana(corte:(corte*2)-1) = ventana(1:corte); %sumo la ventana al vector anterior
 xsVentana5B = xs.* vect_ventana'; %utilizo la ventana
 xsfVentanaB = fft(xsVentana); %su transformada
 figure('Name','Ventana de blackman Senoidal','NumberTitle','off');
  %sin ventana
  subplot(4,1,1);
  plot(xs);
   title('senoidal')
  subplot(4,1,2);
  plot(abs(fft(xs)));
   title('fft senoidal')
  %con ventana
   subplot(4,1,3);
   plot(xsVentana);
    title('senoidal ventaneada')
   subplot(4,1,4);
   plot(abs(xsfVentana));
 title('fft senoidal ventaneada')

