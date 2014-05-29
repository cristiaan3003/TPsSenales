function [ pos ] = positiva( espectro )
    n = length(espectro);
    cantPositivas = ceil(n/2);
    pos(1:cantPositivas) = espectro(1:cantPositivas);
end