function [e]=energia(x)
e=0
for u=1:length(x)
    e=e+x(u)*x(u);
end
end