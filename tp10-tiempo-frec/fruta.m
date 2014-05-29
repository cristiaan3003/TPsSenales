p=[ 1 2 3 4 5 6 7 8 9 10];
q=[10 9 8 7 6 5 4 3 2 1];
a=autocorrelacion(p);
b=autocorr(p);
c=xcorr(p);
subplot(3,1,1)
plot(a)
subplot(3,1,2)
plot(b)
subplot(3,1,3)
plot(c)