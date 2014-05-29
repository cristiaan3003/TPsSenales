function [ AC ] = autoCorrelacion( vector )
    AC = convolucionBien(vector,fliplr(vector));
end

