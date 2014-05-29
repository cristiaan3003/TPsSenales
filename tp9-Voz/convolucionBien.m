function y = convolucionBien(x,h)
    N = length(x);
    M = length(h);
    R = N+M-1;
    y = zeros(1,R);
    for i=1:N
        R_t = zeros(1,R);
        for j=1:M
            R_t(i+j-1) = x(i)*h(j);
        end
        y = y + R_t;
    end
end