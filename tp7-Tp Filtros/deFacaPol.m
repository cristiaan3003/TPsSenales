function[B,A]=deFactorizadoaPolinomio(vCeros,vPolos)
lvp=length(vPolos);
lvc=length(vCeros);
A=[1];
B=[1];
for i=1:lvp
A=conv(A,[1 -vPolos(i)]);
end
for i=1:lvc
B=conv(B,[1 -vCeros(i)]);
end
end