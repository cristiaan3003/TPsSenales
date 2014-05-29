%ejercicio 4
figure(1);
[t,x]=senoidal( 1, 5, 0, 100, 0, 1 );
plot(t,x);
title( 'Muestreo: 100Hz');
xlabel( 'Tiempo' );

figure(2);
[t,x]=senoidal( 1, 5, 0, 25, 0, 1 );
plot(t,x);
title( 'Muestreo: 25 Hz');
xlabel( 'Tiempo' );

figure(3);
[t,x]=senoidal( 1, 5, 0, 10, 0, 1 );
plot(t,x);
title( 'Muestreo: 10 Hz');
xlabel( 'Tiempo' );

figure(4)
[t,x]=senoidal( 1, 5, 0, 4, 0, 1 );
plot(t,x);
title( 'Muestreo:  4 Hz');
xlabel( 'Tiempo' );

figure(5);
[t,x]=senoidal( 1, 5, 0, 1, 0, 1 );
plot(t,x);
title( 'Muestreo: 1 Hz');
xlabel( 'Tiempo' );

figure(6);
[t,x]=senoidal( 1, 5, 0, 0.5, 0, 1 );
plot(t,x);
title( 'Muestreo: 0.5 Hz');
xlabel( 'Tiempo' );
