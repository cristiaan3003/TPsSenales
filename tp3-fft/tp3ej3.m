e1 = zeros(100,1);
e2 = zeros(100,1);
f1 = zeros(100,1);
for t=0:100
    e1(t+1) = exp(-(1i*2*pi*1*t)/100);% cumple 
    e2(t+1) = exp(-(1i*2*pi*2*t)/100); 
    f1(t+1) = exp(-(1i*2*pi*1.2*t)/100);%   no cumple con la ec
end
SI = [e1; e1];
NO = [f1; f1];
DUDA = [e1; e2];

subplot(3,2,1)
bar(real(SI))
title('parte real-concat-cumple ec')
subplot(3,2,3)
bar(real(NO))
title('parte real-concat-noCumple ec')
subplot(3,2,5)
bar(real(DUDA))
title('?')

subplot(3,2,2)
stem(imag(SI))
title('parte img-concat-cumple ec')
subplot(3,2,4)
stem(imag(NO))
title('parte img-concat-noCumple ec')
subplot(3,2,6)
stem(imag(DUDA))
title('?')