function [ a,g,error ] = LevDur( r, p )
    ei = r(1);
    error = [ei];
    ai(1) = 1;
    %Iteración Principal 
    for i=1:p
        ai1 = zeros(i+1, 1);
        ai1(1) = 1; 
        sumatoria=0; 
        for j=2:i,
            sumatoria = sumatoria + ai(j)*r(i-j+2);
        end
        ki = -(1/ei)*(r(i+1)+sumatoria);
        ai1(i+1) = ki;
        for j=2:i,
            ai1(j) = ai(j)+ki*(ai(i-j+2)');
        end
         ei1 = ei*(1-ki^2);
        error = [error ei1];
        % actualizamos variables para siguiente iteración 
        ei = ei1;
        ai = ai1;
        a = ai1;
    end
    % calculo de la ganancia g = sqrt(ei1);
    g = sqrt(ei1);
end