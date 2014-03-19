function [e]=energia(x)
e=0;
for i=1:length(x)
    e=e+x(i)*x(i);
end
end
