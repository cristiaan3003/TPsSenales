function[vp]=prediccionFinal(ep,r0,orden)
    % calculo de vp para cada orden 
    for i=1:orden
        vp(i)=(ep(i)/r0);
    end
end
 
 


